// api/archnemesis/v2/keys/router.js
import { MongoClient } from 'mongodb';
import crypto from 'crypto';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    
    const { action, ...params } = req.method === 'POST' ? req.body : req.query;

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const keysCollection = db.collection('keys');
        const tempCollection = db.collection('temp_scripts');
        const hwidLogsCollection = db.collection('hwid_logs');

        // ==========================================
        // 1. WERYFIKACJA KLUCZA I HWID (ZWRACA TYMCZASOWY LINK)
        // ==========================================
        if (action === 'verify_key') {
            const { script_key, hwid } = params;

            if (!script_key) return res.status(400).json({ success: false, error: 'Missing script_key' });
            if (!hwid) return res.status(400).json({ success: false, error: 'Missing HWID' });

            // Sprawdzamy klucz w bazie
            const keyData = await keysCollection.findOne({ key: script_key });
            
            if (!keyData) {
                await hwidLogsCollection.insertOne({ hwid, key: script_key, status: 'invalid_key', timestamp: new Date() });
                return res.status(404).json({ success: false, error: 'Invalid script_key' });
            }

            // Sprawdzanie bana
            if (keyData.banned_until && new Date(keyData.banned_until) > new Date()) {
                return res.status(403).json({ success: false, error: 'Banned: ' + (keyData.ban_reason || 'Suspicious activity') });
            }

            // Sprawdzanie wygaśnięcia
            if (keyData.expires !== 'never') {
                if (new Date() > new Date(keyData.expires)) {
                    return res.status(403).json({ success: false, error: 'Key expired' });
                }
            }

            // Sprawdzanie HWID
            if (keyData.hwid && keyData.hwid !== hwid) {
                await hwidLogsCollection.insertOne({ hwid, key: script_key, status: 'hwid_mismatch', timestamp: new Date() });
                return res.status(403).json({ success: false, error: 'Key is bound to another HWID' });
            } else if (!keyData.hwid) {
                // Przypisujemy HWID przy pierwszym użyciu
                await keysCollection.updateOne({ _id: keyData._id }, { $set: { hwid: hwid } });
            }

            // Sukces! Generujemy unikalny 256-znakowy ID dla etapu 2
            const tempId = crypto.randomBytes(128).toString('hex');
            
            // Zapisujemy w bazie, że ten link jest ważny przez 5 minut
            await tempCollection.insertOne({
                temp_id: tempId,
                stage: 2,
                script_key: script_key,
                created_at: new Date(),
                expires_at: new Date(Date.now() + 5 * 60 * 1000)
            });

            // Zwracamy link do etapu 2
            return res.status(200).json({
                success: true,
                message: 'Key verified',
                type: keyData.key_type,
                next_stage: `https://projectarch.vercel.app/api/archnemesis/v2/script/temp/${tempId}.lua`
            });
        }

        // ==========================================
        // 2. BANOWANIE (ANTI-TAMPER)
        // ==========================================
        if (action === 'ban') {
            const { script_key, hwid, reason } = params;
            if (!script_key || !hwid) return res.status(400).json({ success: false, error: 'Missing params' });

            // Ustalamy czas bana na podstawie powodu
            let banTimeMs = 24 * 60 * 60 * 1000; // Domyślnie 24h (Tamper 1)
            if (reason === 'Tamper_2') banTimeMs = 7 * 24 * 60 * 60 * 1000; // 7 dni
            if (reason === 'Tamper_3') banTimeMs = 30 * 24 * 60 * 60 * 1000; // 30 dni

            const banUntil = new Date(Date.now() + banTimeMs);

            await keysCollection.updateOne({ key: script_key }, { $set: { banned_until: banUntil, ban_reason: reason } });
            await hwidLogsCollection.updateOne({ hwid: hwid }, { $set: { banned_until: banUntil, ban_reason: reason } }, { upsert: true });

            return res.status(200).json({ success: true, message: `Banned for ${reason}` });
        }

        // ==========================================
        // 3. TWORZENIE TYMCZASOWEGO SKRYPTU (ETAP KOŃCOWY)
        // ==========================================
        if (action === 'create_temp') {
            const { script_key, script_content } = params;
            if (!script_key || !script_content) return res.status(400).json({ success: false, error: 'Missing params' });

            const tempId = crypto.randomBytes(128).toString('hex');

            await tempCollection.insertOne({
                temp_id: tempId,
                stage: 3,
                script_key: script_key,
                content: script_content, // Tutaj wkładasz finalny kod Lua
                created_at: new Date(),
                expires_at: new Date(Date.now() + 5 * 60 * 1000) // 5 minut ważności
            });

            return res.status(200).json({
                success: true,
                final_url: `https://projectarch.vercel.app/api/archnemesis/v2/script/temp/${tempId}.lua`
            });
        }

        return res.status(400).json({ success: false, error: 'Unknown action' });

    } catch (error) {
        console.error('Keys API Error:', error);
        return res.status(500).json({ success: false, error: 'Internal Server Error' });
    }
}
