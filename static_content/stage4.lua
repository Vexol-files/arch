-- static_content/stage4.lua
local _req = syn and syn.request or http_request or request
local KICK_TAMPER = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/tamper1.lua"

-- Test 1: Sprawdzamy, czy loadstring zwraca prawidłowy wynik
local testCode = "return 1 + 1"
local success, result = pcall(function()
    local fn = loadstring(testCode)
    if type(fn) ~= "function" then
        error("loadstring didn't return a function")
    end
    return fn()
end)

if not success or result ~= 2 then
    -- Wykryto hooka na loadstring!
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- Test 2: Sprawdzamy, czy print nie jest zahookowany
local printSuccess, printResult = pcall(function()
    print("Anti-Tamper Test")
    return true
end)

if not printSuccess then
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- Test 3: Sprawdzamy debug.getinfo jako dodatkowe zabezpieczenie
if debug.getinfo(loadstring).what ~= "C" then
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- 4. Jeśli wszystko OK, idziemy dalej
_G["_ArN_Stage4"] = true
local _next_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage5.lua"
local _next_res = _req({Url = _next_url, Method = "GET"})
pcall(function() loadstring(_next_res.Body)() end)
