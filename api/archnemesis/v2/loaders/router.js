// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    // Ustawiamy CORS i zwracamy czysty tekst
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Content-Type', 'text/plain');

    // Pobieramy nazwę pliku z adresu URL (np. "premium.lua")
    const { file } = req.query;

    if (!file) {
        return res.status(400).send('-- Error: Missing file parameter');
    }

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const updatesCollection = db.collection('updates');
        
        // Usuwamy rozszerzenie .lua, żeby zostało samo "premium"
        const scriptType = file.replace('.lua', '');

        // Szukamy w bazie skryptu dla tego typu
        const scriptData = await updatesCollection.findOne({ type: scriptType });
        
        if (!scriptData) {
            return res.status(404).send('-- Error: Script not found');
        }

        // Zwracamy tylko i wyłącznie kod Lua z bazy
        return res.status(200).send(scriptData.Script);

    } catch (error) {
        console.error('Loader Error:', error);
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
