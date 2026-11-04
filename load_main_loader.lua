--[[
  Archnemesis Loader (Faza 1)
  Ten kod jest generowany przez Vercel i wklejany do executora.
  Pobiera główny zobfuskowany loader z GitHuba i go uruchamia.
]]

local _session_id = string.format("%s", "__SESSION_ID__")
local _run_token  = string.format("%s", "__RUN_TOKEN__")
local _build_ver  = string.format("%s", "__BUILD_VERSION__")

_G["_ArN_Session"] = _session_id
_G["_ArN_Token"]   = _run_token

local _req = syn and syn.request or http_request or request
local HttpService = game:GetService("HttpService")

-- Bezpieczna funkcja kicka (działa nawet w DataModel "Ugc")
local function _kickPlayer(msg)
    local ok, players = pcall(function() return game:GetService("Players") end)
    if ok and players and players.LocalPlayer then
        players.LocalPlayer:Kick(msg)
    else
        error(msg, 0)
    end
end

-- Pobieramy główny zobfuskowany loader z GitHuba
local GITHUB_LOADER_URL = "https://raw.githubusercontent.com/Vexol-files/arch/main/loader.lua"

local _loader_res = _req({Url = GITHUB_LOADER_URL, Method = "GET"})

-- Sprawdzamy, czy GitHub zwrócił kod Lua
if not _loader_res or not _loader_res.Body or #_loader_res.Body < 50 
   or string.sub(_loader_res.Body, 1, 1) == "<"
   or string.find(_loader_res.Body, "404: Not Found", 1, true) then
    _kickPlayer("Failed to download loader. Rejoin.")
    return
end

-- Znajdujemy oryginalny loadstring (omijanie hooków)
local _realLoadstring = loadstring
for k, v in pairs(_G) do
    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
        _realLoadstring = v
        break
    end
end

if type(_realLoadstring) ~= "function" then
    _kickPlayer("loadstring not found.")
    return
end

-- Uruchamiamy główny loader
_realLoadstring(_loader_res.Body)()
