// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI; // Dodaj to w Vercel Environment Variables
const client = new MongoClient(uri);

export default async function handler(req, res) {
    // Podstawowe CORS (jeśli strona i API są na różnych domenach)
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

    if (req.method === 'OPTIONS') return res.status(200).end();

    const { action, ...params } = req.method === 'POST' ? req.body : req.query;

    try {
        await client.connect();
        const db = client.db('Cluster0'); // Zamień na nazwę swojej bazy, jeśli jest inna

        // ==========================================
        // POBIERANIE SKRYPTU (LOADER)
        // ==========================================
        if (action === 'get_script') {
            const { type } = params; // 'free', 'premium', 'beta'
            if (!type) return res.status(400).json({ error: 'Missing script type' });

            const script = await db.collection('updates').findOne({ type: type });
            if (!script) return res.status(404).json({ error: 'Script not found' });

            return res.status(200).json({
                success: true,
                filename: script.filename,
                version: script.version,
                encryptedScript: script.encryptedScript
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

        // ==========================================
        // LOGOWANIE URUCHOMIENIA
        // ==========================================
        if (action === 'log_execution') {
            const { hwid, key, status } = params;
            
            await db.collection('loader_logs').insertOne({
                hwid: hwid || 'unknown',
                key: key || 'unknown',
                status: status || 'success',
                timestamp: new Date()
            });

            return res.status(200).json({ success: true, message: 'Log saved' });
        }

        return res.status(400).json({ error: 'Unknown action' });

    } catch (error) {
        console.error('Loader API Error:', error);
        return res.status(500).json({ error: 'Internal Server Error', details: error.message });
    } finally {
        // Nie zamykamy klienta przy każdym żądaniu w środowisku serverless dla wydajności,
        // ale w prostym podejściu można to zostawić (MongoDB Driver sam zarządza pulą).
    }
}
