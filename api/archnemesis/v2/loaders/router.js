// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

    if (req.method === 'OPTIONS') return res.status(200).end();

    // Pobieramy tier (np. "premium.lua") i klucz
    const { tier, script_key } = req.query;

    if (!script_key) {
        res.setHeader('Content-Type', 'text/plain');
        return res.status(400).send('-- Error: Missing script_key');
    }

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const updatesCollection = db.collection('updates');
        const keysCollection = db.collection('keys');

        // 1. Weryfikacja klucza (opcjonalnie: sprawdź, czy typ klucza pasuje do tieru)
        const keyData = await keysCollection.findOne({ key: script_key });
        if (!keyData) {
            res.setHeader('Content-Type', 'text/plain');
            return res.status(404).send('-- Error: Invalid script_key');
        }

        // 2. Ustalamy typ skryptu na podstawie adresu URL (usuwamy ".lua")
        // Jeśli użyto router?script_key=..., a nie podano tieru, bierzemy typ z klucza
        let scriptType = tier ? tier.replace('.lua', '') : keyData.key_type.toLowerCase();

        // 3. Pobieramy skrypt
        const scriptData = await updatesCollection.findOne({ type: scriptType });
        
        if (!scriptData) {
            res.setHeader('Content-Type', 'text/plain');
            return res.status(404).send('-- Error: Script not found');
        }

        // 4. Zwracamy CZYSTY KOD LUA
        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(scriptData.Script);

    } catch (error) {
        console.error('Loader API Error:', error);
        res.setHeader('Content-Type', 'text/plain');
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
