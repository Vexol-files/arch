--[[
  Archnemesis Loader
  Build: __BUILD_VERSION__
]]

_G["_ArN_Session"] = string.format("%s", "__SESSION_ID__")
_G["_ArN_Token"] = string.format("%s", "__RUN_TOKEN__")

local _req = syn and syn.request or http_request or request
local HttpService = game:GetService("HttpService")

-- 1. Pobieramy 2 pliki JSON z API (Vercel)
local _json1_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=" .. _G["_ArN_Token"] .. "&file=json1", Method = "GET"})
local _json2_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=" .. _G["_ArN_Token"] .. "&file=json2", Method = "GET"})

-- 2. Zapisujemy je na dysku
local _fName = "ArN_Cache_" .. tostring(math.random(100000, 999999))
local _f1 = _fName .. "/config_1.json"
local _f2 = _fName .. "/config_2.json"
if not isfolder(_fName) then makefolder(_fName) end
writefile(_f1, _json1_res.Body)
writefile(_f2, _json2_res.Body)

-- 3. Zapisujemy ścieżki w pamięci
_G["_ArN_Json1"] = _f1
_G["_ArN_Json2"] = _f2
_G["_ArN_Folder"] = _fName

-- 4. Ładujemy Stage 2
local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _G["_ArN_Session"], Method = "GET"})

-- 5. Znajdujemy oryginalny loadstring z C++ (omijając hooka)
local _realLoadstring = loadstring
for k, v in pairs(_G) do
    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
        _realLoadstring = v
        break
    end
end

_realLoadstring(_res.Body)()
