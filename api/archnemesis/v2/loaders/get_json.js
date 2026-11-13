// api/archnemesis/v2/loaders/get_json.js
import { MongoClient } from 'mongodb';

export default async function handler(req, res) {
    const { token, file } = req.query;
    if (!token || !file) return res.status(400).send('Missing parameters');

    let client;
    try {
        client = new MongoClient(process.env.MONGODB_URI);
        await client.connect();
        const db = client.db('loader_system');
        
        const tokenData = await db.collection('run_tokens').findOne({ token: token });
        const scriptType = tokenData ? tokenData.script_type : "free";

        const scriptData = await db.collection('updates').findOne({ type: scriptType });
        
        // POPRAWKA: sprawdzamy stringa "true" i boolean true
        const isKeyless = scriptData ? (scriptData.keyless === "true" || scriptData.keyless === true) : false;

        const configs = {
            json1: {
                api_url: "https://projectarch.vercel.app/api/archnemesis/v2/keys/router",
                script_type: scriptType,
                keyless: isKeyless
            },
            json2: {
                script_type: scriptType,
                keyless: isKeyless
            }
        };

        const jsonData = configs[file];
        if (!jsonData) return res.status(404).send('Unknown file');

        res.setHeader('Content-Type', 'application/json');
        return res.status(200).send(JSON.stringify(jsonData));
    } catch (error) {
        console.error('Get JSON Error:', error);
        return res.status(500).send('Error');
    } finally {
        if (client) await client.close();
    }
}
