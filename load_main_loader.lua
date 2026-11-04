-- Zdeobfuskowany główny loader (wersja z router.js)
-- (Ten, który user wkleja do executora)

local _session = string.format("%s", "__SESSION_ID__")
local _token = string.format("%s", "__RUN_TOKEN__")
_G["_ArN_Session"] = _session
_G["_ArN_Token"] = _token

local _req = syn and syn.request or http_request or request
local HttpService = game:GetService("HttpService")

-- 1. Pobieranie 2 plików JSON z API
local _json1_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=" .. _token .. "&file=json1", Method = "GET"})
local _json2_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=" .. _token .. "&file=json2", Method = "GET"})

-- 2. Zapis na dysku
local _fName = "ArN_Cache_" .. tostring(math.random(100000, 999999))
local _f1 = _fName .. "/config_1.json"
local _f2 = _fName .. "/config_2.json"
if not isfolder(_fName) then makefolder(_fName) end
writefile(_f1, _json1_res.Body)
writefile(_f2, _json2_res.Body)

-- 3. Zapis ścieżek w pamięci
_G["_ArN_Json1"] = _f1
_G["_ArN_Json2"] = _f2
_G["_ArN_Folder"] = _fName

-- 4. Ładowanie Stage 2
local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _session, Method = "GET"})

-- 5. Znalezienie oryginalnego loadstring z C++ (omijanie hooka)
local _realLoadstring = loadstring
for k, v in pairs(_G) do
    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
        _realLoadstring = v
        break
    end
end

_realLoadstring(_res.Body)()
