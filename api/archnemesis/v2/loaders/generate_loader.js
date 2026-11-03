import { MongoClient } from 'mongodb';
import crypto from 'crypto';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    const { token } = req.query;
    if (!token) return res.status(400).send('Missing token');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const sessionsCollection = db.collection('sessions');

        // 1. Generujemy ID sesji
        const sessionId = crypto.randomBytes(16).toString('hex');

        // 2. Generujemy mapę tokenów
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

        // 3. Zapisujemy sesję (ważna 5 sekund od pobrania mapy)
        await sessionsCollection.insertOne({
            session_id: sessionId,
            token_map: reverseMap,
            created_at: new Date(),
            expires_at: new Date(Date.now() + 5 * 1000), // 5 sekund!
            used_stages: []
        });

        // 4. Kod Stage 1 (czysty)
        const stage1Code = `
local _req = syn and syn.request or http_request or request
local _sess = "${sessionId}"
local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _sess, Method = "GET"})
loadstring(_next.Body)()
        `;

        // 5. Szyfrujemy
        let encryptedLua = "";
        for (let i = 0; i < stage1Code.length; i++) {
            const char = stage1Code[i];
            encryptedLua += tokenMap[char] || char;
        }

        // 6. Odsyłamy do Robloxa
        const finalLoader = `
_G["_ArN_Session"] = "${sessionId}"
local _encrypted = [[${encryptedLua}]]
local _req = syn and syn.request or http_request or request
local _res = _req({Url="https://projectarch.vercel.app/api/archnemesis/v2/script/temp/map?sess=${sessionId}", Method="GET"})
local _map = game:GetService("HttpService"):JSONDecode(_res.Body)
for token, char in pairs(_map) do
    _encrypted = _encrypted:gsub(token:gsub("%[","%%["):gsub("%]","%%]"), char)
end
loadstring(_encrypted)()
        `;

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(finalLoader);

    } catch (error) {
        res.status(500).send('Error');
    }
}
