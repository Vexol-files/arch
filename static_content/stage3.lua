-- static_content/stage3.lua (CZYSTA WERSJA TESTOWA)
local HttpService = game:GetService("HttpService")
local _req = syn and syn.request or http_request or request

local _script_key = _G["script_key"]
print("[STAGE 3] Klucz pobrany z pamieci: " .. tostring(_script_key))

if not _script_key then
    print("[STAGE 3] BLAD: Brak klucza w _G['script_key']")
    return
end

local _j1 = _G["_ArN_Json1"]
local _j2 = _G["_ArN_Json2"]
local _data1 = HttpService:JSONDecode(readfile(_j1))
local _api_url = _data1.api_url

local _hwid = "unknown"
if gethwid then _hwid = gethwid() end

local _verify_url = _api_url .. "?action=verify_key&script_key=" .. _script_key .. "&hwid=" .. _hwid
print("[STAGE 3] Wysylam zapytanie...")

local _res = _req({Url = _verify_url, Method = "GET"})
print("[STAGE 3] Odpowiedz z API: " .. tostring(_res.Body))

local _verify_data = HttpService:JSONDecode(_res.Body)

if not _verify_data.success then
    print("[STAGE 3] BLAD Z API: " .. tostring(_verify_data.error))
    return
else
    print("[STAGE 3] SUKCES! Link temp: " .. tostring(_verify_data.next_stage))
end

_G["_ArN_Temp_URL"] = _verify_data.next_stage
_G["_ArN_Stage3"] = true
local _next_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage4.lua"
local _next_res = _req({Url = _next_url, Method = "GET"})
pcall(function() loadstring(_next_res.Body)() end)
