// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    // Ustawiamy CORS
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

    if (req.method === 'OPTIONS') return res.status(200).end();

    // Pobieramy zmienne bezpośrednio z adresu URL
    const { script_key, action } = req.query;

    // Jeśli brakuje klucza, zwracamy błąd w formie tekstu (żeby Lua nie crashowało)
    if (!script_key) {
        res.setHeader('Content-Type', 'text/plain');
        return res.status(400).send('-- Error: Missing script_key');
    }

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const updatesCollection = db.collection('updates');
        const keysCollection = db.collection('keys');

        // 1. Sprawdzamy, czy klucz istnieje w bazie
        const keyData = await keysCollection.findOne({ key: script_key });
        if (!keyData) {
            res.setHeader('Content-Type', 'text/plain');
            return res.status(404).send('-- Error: Invalid script_key');
        }

        // 2. Sprawdzamy status (opcjonalnie, jeśli chcesz blokować wyłączone skrypty)
        if (action === 'status') {
            const settings = await db.collection('settings').findOne({});
            return res.status(200).json({
                success: true,
                status: settings ? settings.script_status : 'off'
            });
        }

        // 3. Pobieramy skrypt na podstawie typu klucza (premium, free, beta)
        const scriptType = keyData.key_type.toLowerCase(); 
        const scriptData = await updatesCollection.findOne({ type: scriptType });
        
        if (!scriptData) {
            res.setHeader('Content-Type', 'text/plain');
            return res.status(404).send('-- Error: Script not found for this tier');
        }

        // 4. Zwracamy CZYSTY KOD LUA
        // Dzięki temu game:HttpGet pobierze od razu gotowy kod do loadstring
        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(scriptData.Script);

    } catch (error) {
        console.error('Loader API Error:', error);
        res.setHeader('Content-Type', 'text/plain');
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
