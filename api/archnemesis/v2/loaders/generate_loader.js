// api/archnemesis/v2/loaders/generate_loader.js
import { MongoClient } from 'mongodb';
const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { token, sess } = req.query;
    if (!token) return res.status(400).send('Missing token');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const session = await db.collection('sessions').findOne({ session_id: sess });
        if (!session) return res.status(404).send('Session not found');

        const loaderCode = `
            _G["_ArN_Session"] = "${sess}"
            local _req = syn and syn.request or http_request or request
            local HttpService = game:GetService("HttpService")

            local _json1_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=${token}&file=json1", Method = "GET"})
            local _json2_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=${token}&file=json2", Method = "GET"})

            local _fName = "ArN_Cache_" .. tostring(math.random(100000, 999999))
            local _f1 = _fName .. "/config_1.json"
            local _f2 = _fName .. "/config_2.json"
            if not isfolder(_fName) then makefolder(_fName) end
            writefile(_f1, _json1_res.Body)
            writefile(_f2, _json2_res.Body)

            _G["_ArN_Json1"] = _f1
            _G["_ArN_Json2"] = _f2

            local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _G["_ArN_Session"], Method = "GET"})

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
        return res.status(200).send(loaderCode);
    } catch (error) {
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
