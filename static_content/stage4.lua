-- static_content/stage4.lua
local _req = syn and syn.request or http_request or request
local KICK_TAMPER = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/tamper1.lua"

-- 1. Sprawdzamy, czy loadstring to prawdziwa funkcja C++
if debug.getinfo(loadstring).what ~= "C" then
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- 2. Sprawdzamy, czy print to prawdziwa funkcja C++
if debug.getinfo(print).what ~= "C" then
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- 3. Sprawdzamy, czy request to prawdziwa funkcja C++ (jeśli istnieje)
if syn and syn.request and debug.getinfo(syn.request).what ~= "C" then
    local _kick = _req({Url = KICK_TAMPER, Method = "GET"})
    loadstring(_kick.Body)()
    return
end

-- 4. Jeśli wszystko OK, idziemy dalej
_G["_ArN_Stage4"] = true
local _next_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage5.lua"
local _next_res = _req({Url = _next_url, Method = "GET"})
pcall(function() loadstring(_next_res.Body)() end)
