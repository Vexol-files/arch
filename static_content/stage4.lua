-- static_content/stage4.lua (WIELKI ANTI-TAMPER)
local _req = syn and syn.request or http_request or request
local _key = _G["script_key"] or "unknown"
local _hwid = (gethwid and gethwid()) or (syn and syn.get_hwid and syn:get_hwid()) or (game.Players.LocalPlayer.UserId .. "_" .. game.Players.LocalPlayer.Name)

-- Funkcja do wysyłania bana
local function triggerBan(reason)
    local _ban_url = "https://projectarch.vercel.app/api/archnemesis/v2/keys/router?action=ban&reason=" .. reason .. "&script_key=" .. _key .. "&hwid=" .. _hwid
    pcall(function() _req({Url = _ban_url, Method = "GET"}) end)
    
    -- Pobieramy odpowiedni kick
    local kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/" .. (reason == "Tamper_1" and "tamper1.lua" or (reason == "Tamper_2" and "tamper2.lua" or "tamper3.lua"))
    local _kick = _req({Url = kickUrl, Method = "GET"})
    pcall(function() loadstring(_kick.Body)() end)
end

-- ==========================================
-- TEST 1: LOADSTRING (Tamper_1 - 24h)
-- ==========================================
local ok, res = pcall(function()
    local fn = loadstring("return 1337")
    return fn and fn()
end)
if not ok or res ~= 1337 or debug.getinfo(loadstring).what ~= "C" then
    triggerBan("Tamper_1")
    return
end

-- ==========================================
-- TEST 2: PRINT (Tamper_2 - 7 dni)
-- ==========================================
local printOk, printRes = pcall(function()
    print("Anti-Tamper")
    return true
end)
if not printOk or debug.getinfo(print).what ~= "C" then
    triggerBan("Tamper_2")
    return
end

-- ==========================================
-- TEST 3: REQUEST / GAME:HTTPGET (Tamper_3 - 30 dni)
-- ==========================================
-- Sprawdzamy, czy request nie jest podmieniony
if syn and syn.request and debug.getinfo(syn.request).what ~= "C" then
    triggerBan("Tamper_3")
    return
end

-- Sprawdzamy, czy game:HttpGet nie jest podmienione
if debug.getinfo(game.HttpGet).what ~= "C" then
    triggerBan("Tamper_3")
    return
end

-- Sprawdzamy, czy debug.getinfo samo w sobie nie jest podmienione (najgroźniejszy hook)
if debug.getinfo(debug.getinfo).what ~= "C" then
    triggerBan("Tamper_3")
    return
end

-- ==========================================
-- SUKCES - Idziemy dalej
-- ==========================================
_G["_ArN_Stage4"] = true
_G["_ArN_Stage5"] = true
_G["_ArN_Stage6"] = true

local _next_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage7.lua"
local _next_res = _req({Url = _next_url, Method = "GET"})
pcall(function() loadstring(_next_res.Body)() end)
