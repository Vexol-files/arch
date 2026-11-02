-- static_content/stage3.lua
local HttpService = game:GetService("HttpService")
local _req = syn and syn.request or http_request or request

-- Linki do kicków z Twojego repo
local KICK_KEY = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/key.lua"
local KICK_HWID = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/hwid.lua"
local KICK_BANNED = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/tamper3.lua" -- Kick dla banów

-- 1. Pobieramy KLUCZ z pamięci globalnej
local _script_key = _G["script_key"]

if not _script_key then
    local _kick = _req({Url = KICK_KEY, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- 2. Pobieramy dane zapisane przez Loader (Stage 1)
local _j1 = _G["_ArN_Json1"]
local _j2 = _G["_ArN_Json2"]

local _data1 = HttpService:JSONDecode(readfile(_j1))
local _data2 = HttpService:JSONDecode(readfile(_j2))

local _api_url = _data1.api_url
local _script_type = _data2.script_type

-- 3. Pobieranie HWID
local _hwid = "unknown"
if gethwid then 
    _hwid = gethwid()
elseif syn and syn.get_hwid then 
    _hwid = syn:get_hwid()
else 
    _hwid = game.Players.LocalPlayer.UserId .. "_" .. game.Players.LocalPlayer.Name 
end

-- 4. Wysyłamy zapytanie do API (Vercel)
local _verify_url = _api_url .. "?action=verify_key&script_key=" .. _script_key .. "&hwid=" .. _hwid
local _res = _req({Url = _verify_url, Method = "GET"})
local _verify_data = HttpService:JSONDecode(_res.Body)

-- 5. Sprawdzamy odpowiedź i uruchamiamy odpowiedniego kicka
if not _verify_data.success then
    if _verify_data.error == "invalid_key" then
        local _kick = _req({Url = KICK_KEY, Method = "GET"})
        loadstring(_kick.Body)()
    elseif _verify_data.error == "invalid_hwid" then
        local _kick = _req({Url = KICK_HWID, Method = "GET"})
        loadstring(_kick.Body)()
    elseif _verify_data.error == "banned" then
        local _kick = _req({Url = KICK_BANNED, Method = "GET"})
        loadstring(_kick.Body)()
    else
        local _kick = _req({Url = KICK_KEY, Method = "GET"})
        loadstring(_kick.Body)()
    end
    return
end

-- 6. Zapisujemy unikalny link tymczasowy (temp) do pamięci
_G["_ArN_Temp_URL"] = _verify_data.next_stage
_G["_ArN_Stage3"] = true

-- 7. Ładujemy Stage 4
local _next_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage4.lua"
local _next_res = _req({Url = _next_url, Method = "GET"})
pcall(function() loadstring(_next_res.Body)() end)
