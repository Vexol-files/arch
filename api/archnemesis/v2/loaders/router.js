// api/archnemesis/v2/loaders/router.js
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
        // POPRAWIONA NAZWA BAZY DANYCH
        const db = client.db('loader_system'); 
        const updatesCollection = db.collection('updates');
        const keysCollection = db.collection('keys');

        // ==========================================
        // POBIERANIE SKRYPTU DO LOADSTRING
        // ==========================================
        if (action === 'get_script') {
            const { script_key } = params;

            if (!script_key) return res.status(400).json({ success: false, error: 'Missing script_key' });

            // 1. Sprawdzamy, jaki to typ klucza (PREMIUM, BETA, FREE)
            const keyData = await keysCollection.findOne({ key: script_key });
            if (!keyData) return res.status(404).json({ success: false, error: 'Invalid script_key' });

            // 2. Mapowanie typu z bazy na typ skryptu w updates
            const scriptType = keyData.key_type.toLowerCase(); 

            // 3. Pobieramy skrypt (szukamy pola 'Script' z dużej litery, tak jak w Twojej bazie)
            const scriptData = await updatesCollection.findOne({ type: scriptType });
            if (!scriptData) return res.status(404).json({ success: false, error: 'Script not found for this tier' });

            // 4. Zwracamy skrypt
            return res.status(200).json({
                success: true,
                filename: scriptData.filename,
                version: scriptData.version,
                script: scriptData.Script // Pobieramy pole 'Script'
            });
        }

        // ==========================================
        // SPRAWDZANIE STATUSU SKRYPTU
        // ==========================================
        if (action === 'get_status') {
            const settings = await db.collection('settings').findOne({});
            return res.status(200).json({
                success: true,
                status: settings ? settings.script_status : 'off',
                placeId: settings ? settings.placeId : null
            });
        }

        return res.status(400).json({ success: false, error: 'Unknown action' });

    } catch (error) {
        console.error('Loader API Error:', error);
        return res.status(500).json({ success: false, error: 'Internal Server Error' });
    }
}
