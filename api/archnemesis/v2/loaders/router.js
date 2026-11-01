// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    // Ustawiamy nagłówki, które Roblox akceptuje
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Content-Type', 'text/plain; charset=utf-8');

    const { file } = req.query;

    if (!file) {
        return res.status(400).send('-- Error: Missing file parameter');
    }

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const updatesCollection = db.collection('updates');
        
        const scriptType = file.replace('.lua', '');
        const scriptData = await updatesCollection.findOne({ type: scriptType });
        
        if (!scriptData) {
            return res.status(404).send('-- Error: Script not found');
        }

        // Wysyłamy sam kod
        return res.status(200).send(scriptData.Script);

    } catch (error) {
        console.error('Loader Error:', error);
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
