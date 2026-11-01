// api/archnemesis/v2/keys/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

    if (req.method === 'OPTIONS') return res.status(200).end();

    const { action, ...params } = req.method === 'POST' ? req.body : req.query;

    try {
        await client.connect();
        const db = client.db('Cluster0');
        const keysCollection = db.collection('keys');
        const hwidLogsCollection = db.collection('hwid_logs');

        // ==========================================
        // WERYFIKACJA KLUCZA I PRZYPISANIE HWID
        // ==========================================
        if (action === 'verify_key') {
            const { key, hwid } = params;

            if (!key) return res.status(400).json({ error: 'Key is required' });
            if (!hwid) return res.status(400).json({ error: 'HWID is required' });

            // Szukamy klucza w bazie
            const keyData = await keysCollection.findOne({ key: key });

            if (!keyData) {
                // Opcjonalnie: logowanie nieudanej próby
                await hwidLogsCollection.insertOne({ hwid, key, status: 'invalid_key', timestamp: new Date() });
                return res.status(404).json({ success: false, error: 'Invalid key' });
            }

            // Sprawdzanie daty ważności
            if (keyData.expires !== 'never') {
                const expirationDate = new Date(keyData.expires);
                if (new Date() > expirationDate) {
                    return res.status(403).json({ success: false, error: 'Key expired' });
                }
            }

            // Sprawdzanie HWID
            if (keyData.hwid) {
                // Klucz jest już przypisany do jakiegoś sprzętu
                if (keyData.hwid !== hwid) {
                    await hwidLogsCollection.insertOne({ hwid, key, status: 'hwid_mismatch', timestamp: new Date() });
                    return res.status(403).json({ success: false, error: 'Key is bound to another HWID' });
                }
            } else {
                // Klucz nie ma jeszcze przypisanego HWID - przypisujemy go teraz
                await keysCollection.updateOne(
                    { _id: keyData._id },
                    { $set: { hwid: hwid, owner: params.owner || null } }
                );
            }

            // Sukces
            await hwidLogsCollection.insertOne({ hwid, key, status: 'success', timestamp: new Date() });
            
            return res.status(200).json({
                success: true,
                message: 'Key verified successfully',
                type: keyData.key_type, // 'PREMIUM', 'FREE', 'BETA'
                expires: keyData.expires
            });
        }

        // ==========================================
        // RESETOWANIE HWID (np. z panelu admina)
        // ==========================================
        if (action === 'reset_hwid') {
            const { key } = params;
            if (!key) return res.status(400).json({ error: 'Key is required' });

            const result = await keysCollection.updateOne(
                { key: key },
                { $set: { hwid: null } }
            );

            if (result.matchedCount === 0) return res.status(404).json({ error: 'Key not found' });

            return res.status(200).json({ success: true, message: 'HWID reset successfully' });
        }

        // ==========================================
        // GENEROWANIE NOWEGO KLUCZA (dla admina)
        // ==========================================
        if (action === 'generate_key') {
            const { key_type, expires } = params; // np. key_type: 'PREMIUM', expires: '2027-01-01T00:00:00Z' lub 'never'
            
            // Generowanie losowego klucza (np. AR-XXXX-XXXX-XXXX)
            const generatedKey = 'AR-' + Math.random().toString(36).substring(2, 6).toUpperCase() + '-' + Math.random().toString(36).substring(2, 6).toUpperCase();

            const newKeyData = {
                key: generatedKey,
                key_type: key_type || 'PREMIUM',
                created: Date.now().toString(),
                expires: expires || 'never',
                owner: null,
                hwid: null
            };

            await keysCollection.insertOne(newKeyData);

            return res.status(200).json({ success: true, key: generatedKey, data: newKeyData });
        }

        return res.status(400).json({ error: 'Unknown action' });

    } catch (error) {
        console.error('Keys API Error:', error);
        return res.status(500).json({ error: 'Internal Server Error', details: error.message });
    }
}
