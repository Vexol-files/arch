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

        // Generujemy ID sesji dla dalszych etapów
        const sessionId = crypto.randomBytes(16).toString('hex');

        // Generujemy mapę tokenów dla Stage 2-6 (będą one szyfrowane)
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

        // Prawdziwy kod Stage 1 (bez szyfrowania tokenami, żeby ArN Hook go nie zablokował)
        let loaderCode = `
_G["_ArN_Session"] = "${sessionId}"
local _req = syn and syn.request or http_request or request
local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _G["_ArN_Session"], Method = "GET"})
loadstring(_next.Body)()
`;

        // --- GENEROWANIE 10 000 LINII ŚMIECI ---
        for (let i = 0; i < 10000; i++) {
            const type = Math.floor(Math.random() * 4);
            if (type === 0) {
                loaderCode += `local _junk_var_${i} = ${Math.floor(Math.random() * 9999)} * math.cos(${Math.random()})\n`;
            } else if (type === 1) {
                loaderCode += `local _junk_var_${i} = 0\nif _junk_var_${i} % ${Math.floor(Math.random() * 5) + 2} == 0 then _G["_fake_${i}"] = string.rep("X", ${Math.floor(Math.random() * 20)}) end\n`;
            } else if (type === 2) {
                loaderCode += `for _loop_${i} = 1, ${Math.floor(Math.random() * 3)} do _G["_dummy_${i}"] = (_G["_dummy_${i}"] or 0) + _loop_${i} end\n`;
            } else {
                loaderCode += `local function _fake_func_${i}() return ${Math.random()} + ${Math.floor(Math.random() * 100)} end local _ = _fake_func_${i}()\n`;
            }
        }

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(loaderCode);

    } catch (error) {
        res.status(500).send('Error');
    }
}
