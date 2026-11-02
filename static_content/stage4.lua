-- static_content/stage4.lua
local _req = syn and syn.request or http_request or request
local KICK_TAMPER = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/tamper1.lua"

-- 1. Test funkcjonalny loadstring
local testCode = "return 1337"
local success, result = pcall(function()
    local fn = loadstring(testCode)
    if type(fn) ~= "function" then
        error("loadstring returned not a function")
    end
    return fn()
end)

-- 2. Jeśli wynik nie jest równy 1337, coś jest nie tak (hook)
if not success or result ~= 1337 then
    print("[STAGE 4] Wykryto hooka na loadstring!")
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- 3. Test funkcjonalny print
local printSuccess = pcall(function()
    print("test")
end)

if not printSuccess then
    print("[STAGE 4] Wykryto hooka na print!")
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- 4. Jeśli wszystko OK, idziemy dalej
print("[STAGE 4] Brak hooków, przechodzę dalej.")
_G["_ArN_Stage4"] = true
local _next_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage5.lua"
local _next_res = _req({Url = _next_url, Method = "GET"})
pcall(function() loadstring(_next_res.Body)() end)
