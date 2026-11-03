import { MongoClient } from 'mongodb';
const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { stage } = req.query;
    const { sess } = req.query;
    if (!sess) return res.status(400).send('Missing session');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const sessionsCollection = db.collection('sessions');
        const session = await sessionsCollection.findOne({ session_id: sess });
        if (!session) return res.status(404).send('Session not found');

        if (session.used_stages.includes(stage)) return res.status(403).send('Stage already used');
        await sessionsCollection.updateOne({ session_id: sess }, { $push: { used_stages: stage } });

        // ... (definicje stageCode dla stage2, stage3, stage4, stage5, stage6 - te same co wcześniej)

        const rawCode = stageCode[stage];
        if (!rawCode) return res.status(404).send('Unknown stage');

        let encrypted = "";
        for (let i = 0; i < rawCode.length; i++) {
            const char = rawCode[i];
            const tokenStr = Object.keys(session.token_map).find(key => session.token_map[key] === char);
            encrypted += tokenStr || char;
        }

        // Kluczowa zmiana: używamy _realLoadstring zamiast loadstring
        const stageLoader = `
local _req = syn and syn.request or http_request or request
local _enc = [[${encrypted}]]

local _realLoadstring = loadstring
if debug.getinfo(loadstring).what ~= "C" then
    for k, v in pairs(_G) do
        if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
            _realLoadstring = v
            break
        end
    end
end

local _res = _req({Url="https://projectarch.vercel.app/api/archnemesis/v2/script/temp/map?sess=${sess}", Method="GET"})
local _map = game:GetService("HttpService"):JSONDecode(_res.Body)
for t, c in pairs(_map) do _enc = _enc:gsub(t:gsub("%[","%%["):gsub("%]","%%]"), c) end

pcall(function()
    _realLoadstring(_enc)()
end)
        `;
        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(stageLoader);
    } catch (error) {
        return res.status(500).send('Error');
    }
}
