// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';
import crypto from 'crypto';

const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { file } = req.query;
    if (!file) return res.status(400).send('Missing file parameter');

    const scriptType = file.replace('.lua', '');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const updatesCollection = db.collection('updates');
        const scriptData = await updatesCollection.findOne({ type: scriptType });

        if (!scriptData) return res.status(404).send('-- Error: Script not found');

        // 1. Generujemy token i sesję
        const runToken = crypto.randomBytes(16).toString('hex');
        const sessionId = crypto.randomBytes(16).toString('hex');

        await db.collection('run_tokens').insertOne({
            token: runToken,
            session_id: sessionId,
            script_type: scriptType,
            created_at: new Date(),
            used: false
        });
        await db.collection('sessions').insertOne({ session_id: sessionId, used_stages: [] });

        // 2. Zwracamy kod, który pobiera główny loader (loader_obf.lua)
        const luaLoader = `
_G["_ArN_Session"] = "${sessionId}"
_G["_ArN_Token"] = "${runToken}"

local _req = syn and syn.request or http_request or request
local _loader_url = "https://raw.githubusercontent.com/Vexol-files/arch/main/loader_obf.lua"
local _res = _req({Url = _loader_url, Method = "GET"})

if not _res or not _res.Body or #_res.Body < 50 then
    game.Players.LocalPlayer:Kick("Failed to download loader.")
    return
end

local _realLoadstring = loadstring
for k, v in pairs(_G) do
    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
        _realLoadstring = v
        break
    end
end
_realLoadstring(_res.Body)()
        `;

        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        return res.status(200).send(luaLoader);
    } catch (error) {
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
