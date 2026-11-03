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
        await sessionsCollection.insertOne({ session_id: sessionId, used_stages: [] });

        // Używamy loadstring, ale bierzemy oryginał z pamięci
        const loaderCode = `
_G["_ArN_Session"] = "${sessionId}"
local _req = syn and syn.request or http_request or request
local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _G["_ArN_Session"], Method = "GET"})

-- Znajdujemy oryginalny loadstring z C++ (omijając hooka)
local _realLoadstring = loadstring
for k, v in pairs(_G) do
    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
        _realLoadstring = v
        break
    end
end

_realLoadstring(_res.Body)()
`;
        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(loaderCode);
    } catch (error) {
        res.status(500).send('Error');
    }
}
