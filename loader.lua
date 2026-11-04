--[[
  Archnemesis Loader
  Build: __BUILD_VERSION__
]]

local _session_id = string.format("%s", "__SESSION_ID__")
local _run_token  = string.format("%s", "__RUN_TOKEN__")
local _build_ver  = string.format("%s", "__BUILD_VERSION__")

_G["_ArN_Session"] = _session_id
_G["_ArN_Token"]   = _run_token

local _req = syn and syn.request or http_request or request
local HttpService = game:GetService("HttpService")

-- 1. Funkcja do kicków z GitHuba
local function _kick(fileName)
    if not _req then
        game.Players.LocalPlayer:Kick("Unsupported executor.")
        return
    end
    local _kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/" .. fileName
    local _k = _req({Url = _kickUrl, Method = "GET"})
    if _k and _k.Body then
        local _rl = loadstring
        for k, v in pairs(_G) do
            if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
                _rl = v
                break
            end
        end
        _rl(_k.Body)()
    else
        game.Players.LocalPlayer:Kick("Error loading kick screen.")
    end
end

-- 2. Sprawdzenia wstępne
if not _req then _kick("stage_error.lua") return end
if not writefile or not makefolder or not isfolder then _kick("stage_error.lua") return end

-- 3. Pobieranie JSON-ów
local _json1_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=" .. _run_token .. "&file=json1", Method = "GET"})
local _json2_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=" .. _run_token .. "&file=json2", Method = "GET"})

if not _json1_res or not _json1_res.Body or #_json1_res.Body < 10 then _kick("stage_error.lua") return end
if not _json2_res or not _json2_res.Body or #_json2_res.Body < 10 then _kick("stage_error.lua") return end

if _json1_res.Headers and _json1_res.Headers["Server"] and _json1_res.Headers["Server"] ~= "Vercel" then _kick("stage_error.lua") return end

-- 4. Zapis JSON-ów
local _fName = "ArN_Cache_" .. HttpService:GenerateGUID(false)
local _f1 = _fName .. "/config_1.json"
local _f2 = _fName .. "/config_2.json"
local _ok = pcall(function()
    if not isfolder(_fName) then makefolder(_fName) end
    writefile(_f1, _json1_res.Body)
    writefile(_f2, _json2_res.Body)
end)
if not _ok then _kick("stage_error.lua") return end

_G["_ArN_Json1"] = _f1
_G["_ArN_Json2"] = _f2
_G["_ArN_Folder"] = _fName

-- 5. Ładowanie Stage 2
local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage2?sess=" .. _session_id, Method = "GET"})

-- 6. NOWE, SZCZELNE SPRAWDZANIE CZY TO KOD LUA A NIE HTML/404
local _isValid = false
if _res and _res.Body and #_res.Body > 20 then
    local _body = _res.Body
    -- Kod Lua zawsze zaczyna się od komentarza, "return", "local" lub "if". 
    -- HTML zawsze zaczyna się od "<" (np. "<!DOCTYPE" lub "<html").
    -- Vercel 404 zwraca "The page could not be found" lub "404: Not Found".
    if string.sub(_body, 1, 1) ~= "<" 
       and not string.find(_body, "The page could not be found", 1, true)
       and not string.find(_body, "404: Not Found", 1, true)
       and not string.find(_body, "FUNCTION_INVOCATION_FAILED", 1, true)
       and (string.find(_body, "^%-%-", 1) or string.find(_body, "^return", 1) or string.find(_body, "^local", 1) or string.find(_body, "^if", 1)) then
        _isValid = true
    end
end

if not _isValid then
    _kick("stage_error.lua")
    return
end

-- 7. Znalezienie czystego loadstring
local _realLoadstring = loadstring
for k, v in pairs(_G) do
    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
        _realLoadstring = v
        break
    end
end
if type(_realLoadstring) ~= "function" then _kick("stage_error.lua") return end

-- 8. Uruchomienie Stage 2 (jeśli doszliśmy tutaj, to na 100% jest to kod Lua)
_realLoadstring(_res.Body)()
