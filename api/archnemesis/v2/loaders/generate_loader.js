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

        // Generujemy sesję i mapę tokenów
        const sessionId = crypto.randomBytes(16).toString('hex');
        const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{};':\",./<>?\\|`~ ";
        const tokenMap = {};
        const reverseMap = {};
        
        for (let i = 0; i < charset.length; i++) {
            const char = charset[i];
            const randomHex = crypto.randomBytes(4).toString('hex');
            const tokenStr = `[arch.${randomHex}]`;
            tokenMap[char] = tokenStr;
            reverseMap[tokenStr] = char;
        }

        await sessionsCollection.insertOne({
            session_id: sessionId,
            token_map: reverseMap,
            created_at: new Date(),
            expires_at: new Date(Date.now() + 5 * 60 * 1000),
            used_stages: []
        });

        // PROSTY loader bez śmieci (tylko do testów)
        const loaderCode = `
_G["_ArN_Session"] = "${sessionId}"
local _req = syn and syn.request or http_request or request
local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _G["_ArN_Session"], Method = "GET"})

-- Używamy require zamiast loadstring
local _module = Instance.new("ModuleScript")
_module.Source = _res.Body
require(_module)
_module:Destroy()
`;

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(loaderCode);

    } catch (error) {
        res.status(500).send('Error');
    }
}
