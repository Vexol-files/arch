// api/archnemesis/v2/keys/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    // Ustawienie CORS, aby można było odpytywać z zewnątrz
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

    if (req.method === 'OPTIONS') return res.status(200).end();

    const { action, ...params } = req.method === 'POST' ? req.body : req.query;

    try {
        await client.connect();
        // POPRAWIONA NAZWA BAZY DANYCH
        const db = client.db('loader_system'); 
        const keysCollection = db.collection('keys');
        const hwidLogsCollection = db.collection('hwid_logs');

        // ==========================================
        // WERYFIKACJA KLUCZA I PRZYPISANIE HWID
        // ==========================================
        if (action === 'verify_key') {
            const { script_key, hwid } = params;

            if (!script_key) return res.status(400).json({ success: false, error: 'Missing script_key' });
            if (!hwid) return res.status(400).json({ success: false, error: 'Missing HWID' });

            // Szukamy klucza w bazie
            const keyData = await keysCollection.findOne({ key: script_key });

            if (!keyData) {
                // Logowanie nieudanej próby
                await hwidLogsCollection.insertOne({ hwid, key: script_key, status: 'invalid_key', timestamp: new Date() });
                return res.status(404).json({ success: false, error: 'Invalid script_key' });
            }

            // Sprawdzanie daty ważności
            if (keyData.expires !== 'never') {
                const expirationDate = new Date(keyData.expires);
                if (new Date() > expirationDate) {
                    return res.status(403).json({ success: false, error: 'Key expired' });
                }
            }

            // Sprawdzanie HWID
            if (keyData.hwid && keyData.hwid !== hwid) {
                await hwidLogsCollection.insertOne({ hwid, key: script_key, status: 'hwid_mismatch', timestamp: new Date() });
                return res.status(403).json({ success: false, error: 'Key is bound to another HWID' });
            } else if (!keyData.hwid) {
                // Przypisujemy HWID przy pierwszym użyciu
                await keysCollection.updateOne(
                    { _id: keyData._id },
                    { $set: { hwid: hwid } }
                );
            }

            // Sukces
            await hwidLogsCollection.insertOne({ hwid, key: script_key, status: 'success', timestamp: new Date() });
            
            return res.status(200).json({
                success: true,
                message: 'Key verified successfully',
                type: keyData.key_type,
                expires: keyData.expires
            });
        }

        return res.status(400).json({ success: false, error: 'Unknown action' });

    } catch (error) {
        console.error('Keys API Error:', error);
        return res.status(500).json({ success: false, error: 'Internal Server Error' });
    }
}
