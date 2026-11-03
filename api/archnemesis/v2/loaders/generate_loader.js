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

        // 1. Generujemy losowe ID dla znaków
        const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{};':\",./<>?\\|`~ ";
        const tokenMap = {};
        
        for (let i = 0; i < charset.length; i++) {
            const char = charset[i];
            const randomId = "arch." + Math.floor(1000 + Math.random() * 9000);
            tokenMap[char] = randomId;
        }

        // 2. Zapisujemy mapę w pamięci jako funkcję (ukryta)
        const mapFunction = `
_G["_ArN_GetMap"] = function()
    return ${JSON.stringify(tokenMap)}
end
`;

        // 3. Kod Stage 1, który ładuje Stage 2
        let loaderCode = `
${mapFunction}
_G["_ArN_Session"] = "${crypto.randomBytes(16).toString('hex')}"

-- Bierzemy oryginalny loadstring z pamięci
local _realLoadstring = loadstring
if debug.getinfo(loadstring).what ~= "C" then
    for k, v in pairs(_G) do
        if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
            _realLoadstring = v
            break
        end
    end
end

local _req = syn and syn.request or http_request or request
local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _G["_ArN_Session"], Method = "GET"})
_realLoadstring(_res.Body)()
`;

        // 4. Dodajemy 10 000 linii śmieci
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
