-- static_content/stage4.lua
local _req = syn and syn.request or http_request or request
local KICK_TAMPER = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/tamper1.lua"

-- 1. Testujemy loadstring - jeśli jest prawdziwy, powinien zwrócić funkcję
local testCode = "return 1 + 1"
local success, result = pcall(function()
    local fn = loadstring(testCode)
    if type(fn) ~= "function" then
        error("loadstring didn't return a function")
    end
    return fn()
end)

-- 2. Jeśli wynik nie jest równy 2, coś jest nie tak (hook)
if not success or result ~= 2 then
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- 3. Sprawdzamy też debug.getinfo jako dodatkowe zabezpieczenie
local info = debug.getinfo(loadstring)
if info.what ~= "C" then
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- 4. Jeśli wszystko OK, idziemy dalej
_G["_ArN_Stage4"] = true
local _next_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage5.lua"
local _next_res = _req({Url = _next_url, Method = "GET"})
pcall(function() loadstring(_next_res.Body)() end)
