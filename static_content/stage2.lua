-- static_content/stage2.lua
local HttpService = game:GetService("HttpService")
local _req = syn and syn.request or http_request or request

-- Pobieranie ścieżek zapisanych przez Loader
local _j1 = _G["_ArN_Json1"]
local _j2 = _G["_ArN_Json2"]
local _folder = _G["_ArN_Folder"]

if not _j1 or not _j2 then
    warn("[Archnemesis] Brak plików JSON. Loader nie zapisał danych.")
    return
end

-- Odczytywanie JSONów
local _data1 = HttpService:JSONDecode(readfile(_j1))
local _data2 = HttpService:JSONDecode(readfile(_j2))

local _api_url = _data1.api_url
local _script_type = _data2.script_type

-- Pobieranie HWID
local _hwid = "unknown"
if gethwid then _hwid = gethwid()
elseif syn and syn.get_hwid then _hwid = syn.get_hwid()
else _hwid = game.Players.LocalPlayer.UserId .. "_" .. game.Players.LocalPlayer.Name end

-- KLUCZ (do testów wpisz na sztywno)
local _script_key = "premiumtest" 

-- Weryfikacja klucza przez API
local _verify_url = _api_url .. "?action=verify_key&script_key=" .. _script_key .. "&hwid=" .. _hwid
local _res = _req({Url = _verify_url, Method = "GET"})
local _verify_data = HttpService:JSONDecode(_res.Body)

-- Usuwanie folderu z komputerze
if isfolder(_folder) then 
    delfolder(_folder) 
end

-- Sprawdzanie poprawności
if not _verify_data.success then
    game.Players.LocalPlayer:Kick("Invalid Key or HWID")
    return
end

-- Pobieranie finalnego skryptu
local _final_res = _req({Url = _verify_data.next_stage, Method = "GET"})
loadstring(_final_res.Body)()
