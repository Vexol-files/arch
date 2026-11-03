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
            expires_at: new Date(Date.now() + 5 * 1000),
            used_stages: []
        });

        // Stage 1 - tutaj odszyfrowujemy przez _realLoadstring
        const stage1Code = `
local _req = syn and syn.request or http_request or request
local _sess = "${sessionId}"
local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _sess, Method = "GET"})
loadstring(_next.Body)()
        `;

        let encryptedLua = "";
        for (let i = 0; i < stage1Code.length; i++) {
            const char = stage1Code[i];
            encryptedLua += tokenMap[char] || char;
        }

        const finalLoader = `
_G["_ArN_Session"] = "${sessionId}"
local _encrypted = [[${encryptedLua}]]
local _req = syn and syn.request or http_request or request

-- Bierzemy oryginalny loadstring z pamięci, zanim hook go podmieni
local _realLoadstring = loadstring
if debug.getinfo(loadstring).what ~= "C" then
    for k, v in pairs(_G) do
        if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
            _realLoadstring = v
            break
        end
    end
end

local _res = _req({Url="https://projectarch.vercel.app/api/archnemesis/v2/script/temp/map?sess=${sessionId}", Method="GET"})
local _map = game:GetService("HttpService"):JSONDecode(_res.Body)
for token, char in pairs(_map) do
    _encrypted = _encrypted:gsub(token:gsub("%[","%%["):gsub("%]","%%]"), char)
end

-- Uruchamiamy przez _realLoadstring
pcall(function()
    _realLoadstring(_encrypted)()
end)
        `;

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(finalLoader);

    } catch (error) {
        res.status(500).send('Error');
    }
}
