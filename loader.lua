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

-- Bezpieczny kick (działa nawet jeśli game.Players nie istnieje)
local function _kickPlayer(msg)
    local ok, players = pcall(function() return game:GetService("Players") end)
    if ok and players and players.LocalPlayer then
        players.LocalPlayer:Kick(msg)
    else
        error(msg, 0)
    end
end

-- 1. Funkcja do kicków z GitHuba
local function _kick(fileName)
    if not _req then
        _kickPlayer("Unsupported executor.")
        return
    end
    local _kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/" .. fileName
    local _k = _req({Url = _kickUrl, Method = "GET"})
    
    if _k and _k.Body and #_k.Body > 20 and string.sub(_k.Body, 1, 1) ~= "<" 
       and not string.find(_k.Body, "404: Not Found", 1, true) then
        local _rl = loadstring
        for k, v in pairs(_G) do
            if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
                _rl = v
                break
            end
        end
        _rl(_k.Body)()
    else
        _kickPlayer("Failed to load error screen. Rejoin.")
    end
end

-- 2. Sprawdzenia wstępne
if not _req then _kick("stage_error.lua") return end
if not writefile or not makefolder or not isfolder then _kick("stage_error.lua") return end

-- 3. Pobieranie JSON-ów z Vercela
local _json1_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=" .. _run_token .. "&file=json1", Method = "GET"})
local _json2_res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/get_json?token=" .. _run_token .. "&file=json2", Method = "GET"})

if not _json1_res or not _json1_res.Body or #_json1_res.Body < 10 then _kick("stage_error.lua") return end
if not _json2_res or not _json2_res.Body or #_json2_res.Body < 10 then _kick("stage_error.lua") return end

if _json1_res.Headers and _json1_res.Headers["Server"] and _json1_res.Headers["Server"] ~= "Vercel" then 
    _kick("stage_error.lua") 
    return 
end

-- 4. Zapis JSON-ów na dysku
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

-- 6. NOWE SPRAWDZANIE CZY TO KOD LUA
local _isValid = false
if _res and _res.Body and #_res.Body > 20 then
    local _body = _res.Body
    if not string.find(_body, "The page could not be found", 1, true)
       and not string.find(_body, "404: Not Found", 1, true)
       and not string.find(_body, "FUNCTION_INVOCATION_FAILED", 1, true)
       and not string.find(_body, "Stage already used", 1, true)
       and not string.find(_body, "Session not found", 1, true)
       and not string.find(_body, "<!DOCTYPE", 1, true)
       and not string.find(_body, "<html", 1, true) then
       
        if string.find(_body, "local ", 1, true) 
           or string.find(_body, "return ", 1, true) 
           or string.find(_body, "if ", 1, true) then
            _isValid = true
        end
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

-- 8. Uruchomienie Stage 2
_realLoadstring(_res.Body)()
