-- static_content/stage2.lua
local _req = syn and syn.request or http_request or request

-- Sprawdzamy, czy loader zapisał ścieżki do plików JSON
if not _G["_ArN_Json1"] or not _G["_ArN_Json2"] then
    game.Players.LocalPlayer:Kick("Anti-Tamper: Loader missing.")
    return
end

-- Ustawiamy flagę, że ten etap został ukończony
_G["_ArN_Stage2"] = true

-- Ładujemy następny etap
local _next_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage3.lua"
local _next_res = _req({Url = _next_url, Method = "GET"})
pcall(function() loadstring(_next_res.Body)() end)
