// api/archnemesis/v2/loaders/generate_loader.js

export default async function handler(req, res) {
    // Ustawiamy nagłówki dla Robloxa
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Content-Type', 'text/plain; charset=utf-8');

    // Pobieramy token przekazany z router.js (Faza 1)
    const { token } = req.query;
    if (!token) return res.status(400).send('-- Error: Missing token');

    // ==========================================
    // PRAWDZIWY KOD (UKRYTY WŚRÓD ŚMIECI)
    // ==========================================
    let loaderCode = `
-- [START ARNEMESIS ENGINE]
local _T = "${token}"
local _API = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=" .. _T
local _req = syn and syn.request or http_request or request
local _json = game:GetService("HttpService")

local _res1 = _req({Url = _API .. "&file=json1", Method = "GET"})
local _res2 = _req({Url = _API .. "&file=json2", Method = "GET"})

local _fName = "ArN_Cache_" .. tostring(math.random(100000, 999999))
local _f1 = _fName .. "/config_1.json"
local _f2 = _fName .. "/config_2.json"
if not isfolder(_fName) then makefolder(_fName) end
writefile(_f1, _res1.Body)
writefile(_f2, _res2.Body)

_G["_ArN_Json1"] = _f1
_G["_ArN_Json2"] = _f2
_G["_ArN_Folder"] = _fName

local _stage2_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage2.lua"
local _stage2 = _req({Url = _stage2_url, Method = "GET"})
pcall(function() loadstring(_stage2.Body)() end)
-- [END ARNEMESIS ENGINE]

-- ==========================================
-- PONIŻEJ GENERUJEMY 10 000 LINII ŚMIECI
-- ==========================================
`;

    // Generator śmieci (10 000 linii)
    for (let i = 0; i < 10000; i++) {
        const type = Math.floor(Math.random() * 4); // 4 typy losowych śmieci
        
        if (type === 0) {
            // Fałszywe zmienne i obliczenia
            loaderCode += `local _junk_var_${i} = ${Math.floor(Math.random() * 9999)} * math.cos(${Math.random()})\n`;
        } 
        else if (type === 1) {
            // Fałszywe warunki
            loaderCode += `if _junk_var_${i-1 || 0} % ${Math.floor(Math.random() * 5) + 2} == 0 then _G["_fake_${i}"] = string.rep("X", ${Math.floor(Math.random() * 20)}) end\n`;
        } 
        else if (type === 2) {
            // Fałszywe pętle
            loaderCode += `for _loop_${i} = 1, ${Math.floor(Math.random() * 3)} do _G["_dummy_${i}"] = (_G["_dummy_${i}"] or 0) + _loop_${i} end\n`;
        } 
        else {
            // Fałszywe funkcje
            loaderCode += `local function _fake_func_${i}() return ${Math.random()} + ${Math.floor(Math.random() * 100)} end local _ = _fake_func_${i}()\n`;
        }
    }

    // Zwracamy całość do Robloxa
    return res.status(200).send(loaderCode);
}
