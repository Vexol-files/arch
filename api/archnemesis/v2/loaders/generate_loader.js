import { MongoClient } from 'mongodb';
import crypto from 'crypto';
const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { token } = req.query;
    if (!token) return res.status(400).send('Missing token');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const sessionsCollection = db.collection('sessions');

        const sessionId = crypto.randomBytes(16).toString('hex');
        
        await sessionsCollection.insertOne({
            session_id: sessionId,
            created_at: new Date(),
            used_stages: []
        });

        // Główny loader (czysty kod, bez loadstring)
        const loaderCode = `
_G["_ArN_Session"] = "${sessionId}"
local _req = syn and syn.request or http_request or request
local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _G["_ArN_Session"], Method = "GET"})
local _m = Instance.new("ModuleScript")
_m.Source = _res.Body
require(_m)
_m:Destroy()
`;

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(loaderCode);

    } catch (error) {
        res.status(500).send('Error');
    }
}
