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

        // 1. Generujemy sesję
        const sessionId = crypto.randomBytes(16).toString('hex');
        
        // 2. Generujemy mapę tokenów
        const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{};':\",./<>?\\|`~ ";
        const tokenMap = {};
        const reverseMap = {};
        
        for (let i = 0; i < charset.length; i++) {
            const char = charset[i];
            const randomId = "arch." + crypto.randomBytes(3).toString('hex');
            tokenMap[char] = `[${randomId}]`;
            reverseMap[randomId] = char;
        }

        await sessionsCollection.insertOne({
            session_id: sessionId,
            token_map: reverseMap,
            created_at: new Date(),
            used_stages: []
        });

        // 3. Prawdziwy kod loadera (Faza 1)
        // Ten kod pobiera Stage 2 z API i go uruchamia.
        // NIE MA TU ŻADNYCH ŚMIECI, tylko czysty kod.
        const realLoaderCode = `
_G["_ArN_Session"] = "${sessionId}"
local _req = syn and syn.request or http_request or request
local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _G["_ArN_Session"], Method = "GET"})
loadstring(_res.Body)()
`;

        // 4. Szyfrujemy kod loadera
        let encrypted = "";
        for (let i = 0; i < realLoaderCode.length; i++) {
            const char = realLoaderCode[i];
            encrypted += tokenMap[char] || char;
        }

        // 5. Zwracamy do Robloxa loader z tokenami
        const finalLoader = `
local _enc = [[${encrypted}]]
local _req = syn and syn.request or http_request or request

-- Pobieramy mapę z API (128-znakowy link tymczasowy)
local _res = _req({Url="https://projectarch.vercel.app/api/archnemesis/v2/script/temp/map?sess=${sessionId}", Method="GET"})
local _mapData = game:GetService("HttpService"):JSONDecode(_res.Body)

-- Odszyfrowujemy kod loadera
for t, c in pairs(_mapData) do 
    _enc = _enc:gsub(t:gsub("%[","%%["):gsub("%]","%%]"), c) 
end

-- Uruchamiamy przez loadstring (zapamiętany oryginał)
local _realLoadstring = loadstring
if debug.getinfo(loadstring).what ~= "C" then
    for k, v in pairs(_G) do
        if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
            _realLoadstring = v
            break
        end
    end
end

_realLoadstring(_enc)()
        `;

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(finalLoader);

    } catch (error) {
        res.status(500).send('Error');
    }
}
