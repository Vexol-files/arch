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
        const hwidLogsCollection = db.collection('hwid_logs');
        const tempCollection = db.collection('temp_scripts');

        // ==========================================
        // 1. WERYFIKACJA KLUCZA I HWID
        // ==========================================
        if (action === 'verify_key') {
            const { script_key, hwid } = params;

            if (!script_key) return res.status(400).json({ success: false, error: 'Missing script_key' });
            if (!hwid) return res.status(400).json({ success: false, error: 'Missing HWID' });

            // Sprawdzamy klucz w bazie
            const keyData = await keysCollection.findOne({ key: script_key });
            
            if (!keyData) {
                await hwidLogsCollection.insertOne({ hwid, key: script_key, status: 'invalid_key', timestamp: new Date() });
                return res.status(404).json({ success: false, error: 'invalid_key' });
            }

            // Sprawdzanie bana
            if (keyData.banned_until && new Date(keyData.banned_until) > new Date()) {
                return res.status(403).json({ success: false, error: 'banned' });
            }

            // --- NOWA FUNKCJA: PARSOWANIE DATY Z FORMATU DDMMYYYYHHmmss ---
            function parseExpirationDate(expStr) {
                if (!expStr || expStr === 'never') return null;
                
                // Jeśli to już standardowa data ISO (np. z Date.now()), po prostu ją zwróć
                if (expStr.includes('-') || expStr.includes('T')) return new Date(expStr);

                // Jeśli to nasz format DDMMYYYYHHmmss (14 cyfr)
                if (expStr.length === 14) {
                    const sec = parseInt(expStr.substring(12, 14)) || 0;
                    const min = parseInt(expStr.substring(10, 12)) || 0;
                    const hour = parseInt(expStr.substring(8, 10)) || 0;
                    const day = parseInt(expStr.substring(0, 2)) || 1;
                    const month = parseInt(expStr.substring(2, 4)) || 1;
                    const year = parseInt(expStr.substring(4, 8)) || 2026;
                    return new Date(year, month - 1, day, hour, min, sec);
                }

                // Jeśli nie znamy formatu, zwracamy null (brak wygaśnięcia)
                return null;
            }

            // Sprawdzanie wygaśnięcia
            const expirationDate = parseExpirationDate(keyData.expires);
            if (expirationDate && new Date() > expirationDate) {
                return res.status(403).json({ success: false, error: 'expired' });
            }

            // Sprawdzanie HWID
            if (keyData.hwid && keyData.hwid !== hwid) {
                await hwidLogsCollection.insertOne({ hwid, key: script_key, status: 'hwid_mismatch', timestamp: new Date() });
                return res.status(403).json({ success: false, error: 'invalid_hwid' });
            } else if (!keyData.hwid) {
                await keysCollection.updateOne({ _id: keyData._id }, { $set: { hwid: hwid } });
            }

            // Sukces! Generujemy unikalny 128-znakowy ID
            const tempId = crypto.randomBytes(64).toString('hex');

            await tempCollection.insertOne({
                temp_id: tempId,
                script_key: script_key,
                created_at: new Date(),
                expires_at: new Date(Date.now() + 5 * 60 * 1000) // Ważny 5 minut
            });

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

            let banTimeMs = 24 * 60 * 60 * 1000; // Domyślnie 24h
            if (reason === 'Tamper_2') banTimeMs = 7 * 24 * 60 * 60 * 1000; // 7 dni
            if (reason === 'Tamper_3') banTimeMs = 30 * 24 * 60 * 60 * 1000; // 30 dni

            const banUntil = new Date(Date.now() + banTimeMs);

            await keysCollection.updateOne({ key: script_key }, { $set: { banned_until: banUntil, ban_reason: reason } });
            await hwidLogsCollection.updateOne({ hwid: hwid }, { $set: { banned_until: banUntil, ban_reason: reason } }, { upsert: true });

            return res.status(200).json({ success: true, message: `Banned for ${reason}` });
        }

        return res.status(400).json({ success: false, error: 'Unknown action' });

    } catch (error) {
        console.error('Keys API Error:', error);
        return res.status(500).json({ success: false, error: 'Internal Server Error' });
    }
}
