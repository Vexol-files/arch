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

        const runToken = crypto.randomBytes(16).toString('hex');
        const sessionId = crypto.randomBytes(16).toString('hex');

        await db.collection('run_tokens').insertOne({ token: runToken, session_id: sessionId, script_type: scriptType, created_at: new Date(), used: false });
        await db.collection('sessions').insertOne({ session_id: sessionId, used_stages: [] });

        const luaLoader = `
_G["_ArN_Session"] = "${sessionId}"
_G["_ArN_Token"] = "${runToken}"

local _req = syn and syn.request or http_request or request
local _gen_url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/generate_loader?token=${runToken}&sess=${sessionId}"
local _gen_code = _req({Url = _gen_url, Method = "GET"})

if not _gen_code or not _gen_code.Body or #_gen_code.Body < 50 then
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
_realLoadstring(_gen_code.Body)()
        `;

        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        return res.status(200).send(luaLoader);
    } catch (error) {
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
