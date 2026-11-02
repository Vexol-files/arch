-- static_content/stage4.lua (WIELKI ANTI-TAMPER — bez print, z banami)
-- ============================================================
-- CZĘŚĆ A: Vexol-files (bany)  —  24h / 7 dni / 30 dni
-- CZĘŚĆ B: AntiHook 1..10 (pengussy/Roblox-Anti-Tamper-Obfuscator)
-- Wersja: bez fałszywych banów + BEZ print
-- ============================================================

local _req = syn and syn.request or http_request or request
local _key = _G["script_key"] or "unknown"

-- _hwid w pcall — LocalPlayer może być nil
local _hwid = (function()
    local ok, h = pcall(function() return gethwid and gethwid() end)
    if ok and h then return h end
    local ok2, h2 = pcall(function() return syn and syn.get_hwid and syn:get_hwid() end)
    if ok2 and h2 then return h2 end
    local ok3, plr = pcall(function() return game.Players.LocalPlayer end)
    if ok3 and plr then return plr.UserId .. "_" .. plr.Name end
    return "unknown"
end)()

-- triggerBan — banuje i PRZERYWA cały skrypt (error, nie return)
local function triggerBan(reason)
    local _ban_url = "https://projectarch.vercel.app/api/archnemesis/v2/keys/router?action=ban&reason=" .. reason .. "&script_key=" .. _key .. "&hwid=" .. _hwid
    pcall(function() _req({Url = _ban_url, Method = "GET"}) end)

    local kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/" .. (reason == "Tamper_1" and "tamper1.lua" or (reason == "Tamper_2" and "tamper2.lua" or "tamper3.lua"))
    pcall(function()
        local _kick = _req({Url = kickUrl, Method = "GET"})
        loadstring(_kick.Body)()
    end)

    error("dtc_" .. tostring(reason), 0)
end

-- Pomocnicza: sprawdza, czy funkcja jest czystą C i nie jest owinięta
local function isPureC(fn)
    if type(fn) ~= "function" then return false end
    local ok, s, f = pcall(debug.info, fn, "sf")
    if not ok then return false end
    return s == "[C]" and rawequal(f, fn)
end

-- ============================================================
-- CZĘŚĆ A: TESTY VEXOL (bez print)
-- ============================================================

-- TEST 1: LOADSTRING (Tamper_1 - 24h)
do
    local ok, res = pcall(function()
        local fn = loadstring("return 1337")
        return fn and fn()
    end)
    if not ok or res ~= 1337 then triggerBan("Tamper_1") end
    if not isPureC(loadstring) then triggerBan("Tamper_1") end
end

-- TEST 2: DEBUG.INFO (Tamper_2 - 7 dni) — print NIE jest testowany
do
    if not isPureC(debug.info) then triggerBan("Tamper_2") end
    local ok, s, l, f = pcall(debug.info, pcall, "slf")
    if not ok or s ~= "[C]" or l ~= -1 or not rawequal(f, pcall) then
        triggerBan("Tamper_2")
    end
end

-- TEST 3: REQUEST / GAME:HTTPGET (Tamper_3 - 30 dni)
do
    if syn and syn.request and not isPureC(syn.request) then triggerBan("Tamper_3") end
    if not isPureC(game.HttpGet) then triggerBan("Tamper_3") end
end

-- ============================================================
-- CZĘŚĆ B: ANTIHOOK 1..10 (bez print)
--   AntiHook 1-3  -> Tamper_1 (24h)
--   AntiHook 4-6  -> Tamper_2 (7 dni)
--   AntiHook 7-10 -> Tamper_3 (30 dni)
-- ============================================================

-- ===================== AntiHook 1.lua (Tamper_1) =====================
do
    local function fail(c) triggerBan("Tamper_1") end
    if type(debug) ~= "table" or type(debug.info) ~= "function" or type(debug.traceback) ~= "function" then fail(1) end
    if not isPureC(debug.info) then fail(2) end
    if not isPureC(debug.traceback) then fail(2) end

    local list = {
        pcall, xpcall, tostring, tonumber, type, typeof,
        rawequal, rawget, rawset, getmetatable, setmetatable,
        select, error, assert,
        string.byte, string.sub, string.char,
        bit32.bxor, buffer.create,
        debug.info, debug.traceback, coroutine.resume,
        game.GetService, Instance.new,
    }
    for i, fn in ipairs(list) do
        if not isPureC(fn) then fail(100 + i) end
    end

    local function luaFn(x, y) return x + y end
    local ok, s, f = pcall(debug.info, luaFn, "sf")
    if not ok or s == "[C]" or not rawequal(f, luaFn) then fail(3) end
end

-- ===================== AntiHook 2.lua (Tamper_1) =====================
do
    local function fail(c) triggerBan("Tamper_1") end
    local function mustFailYield(fn)
        local co = coroutine.create(fn)
        local ok, res = coroutine.resume(co)
        return (not ok)
            and string.find(tostring(res), "yield across", 1, true) ~= nil
            and coroutine.status(co) == "dead"
    end
    if not mustFailYield(function()
        local o = setmetatable({}, { __tostring = function() coroutine.yield("hooked"); return "s" end })
        return tostring(o)
    end) then fail(1) end
    if not mustFailYield(function()
        return string.gsub("a", "a", function() coroutine.yield("hooked"); return "b" end)
    end) then fail(2) end
    if not mustFailYield(function()
        local t = { 2, 1 }
        table.sort(t, function(x, y) coroutine.yield("hooked"); return x < y end)
    end) then fail(3) end
    if not mustFailYield(function()
        local o = setmetatable({}, { __index = function() coroutine.yield("hooked") end })
        return o.k
    end) then fail(4) end
    if not mustFailYield(function()
        local o = setmetatable({}, { __newindex = function() coroutine.yield("hooked") end })
        o.k = 1
    end) then fail(5) end
    if not mustFailYield(function()
        local mt = { __eq = function() coroutine.yield("hooked"); return true end }
        local a = setmetatable({}, mt); local b = setmetatable({}, mt)
        return a == b
    end) then fail(6) end
    local coPcall = coroutine.create(function()
        local ok, v = pcall(function() return coroutine.yield("pcall_yield_ok") end)
        return ok and v == "resumed_ok"
    end)
    local ok1, y1 = coroutine.resume(coPcall)
    local ok2, y2 = coroutine.resume(coPcall, "resumed_ok")
    if not ok1 or y1 ~= "pcall_yield_ok" or not ok2 or y2 ~= true then fail(7) end
end

-- ===================== AntiHook 3.lua (Tamper_1) =====================
do
    local function fail(c) triggerBan("Tamper_1") end
    local okS, mtS = pcall(getmetatable, "")
    local okV, mtV = pcall(getmetatable, Vector3.zero)
    local okC, mtC = pcall(getmetatable, CFrame.identity)
    if not okS or mtS ~= "The metatable is locked" then fail(1) end
    if not okV or mtV ~= "The metatable is locked" or not okC or mtC ~= "The metatable is locked" then fail(2) end
    if not rawequal(("x").byte, string.byte)
        or not rawequal(("x").sub, string.sub)
        or not rawequal(("x").gsub, string.gsub)
        or not rawequal(("x").format, string.format)
        or not rawequal(("x").pack, string.pack)
    then fail(3) end
    local guard = table.freeze({ k = 7 })
    if not table.isfrozen(guard) then fail(4) end
    if pcall(function() guard.k = 8 end) then fail(4) end
    local cOk = false
    local function badSub() return string.sub("abc", {}) end
    local ran = xpcall(badSub, function(msg)
        local s2, l2, f2 = debug.info(2, "slf")
        local f3 = debug.info(3, "f")
        if s2 == "[C]" and l2 == -1 and rawequal(f2, string.sub) and rawequal(f3, badSub)
            and string.find(tostring(msg), "number expected, got table", 1, true) then cOk = true end
    end)
    if ran or not cOk then fail(5) end
    local b1, b2 = ("SL"):byte(1, 2)
    if b1 ~= 83 or b2 ~= 76 then fail(6) end
end

-- ===================== AntiHook 4.lua (Tamper_2) — getfenv/setfenv =====================
do
    local function fail(c) triggerBan("Tamper_2") end
    if type(getfenv) ~= "function" or type(setfenv) ~= "function" then fail(1) end

    local natives = {
        pcall, xpcall, tostring, rawequal, getmetatable, setmetatable,
        debug.info, string.byte, buffer.create, task.spawn,
        Instance.new, game.GetService,
    }
    for i, fn in ipairs(natives) do
        local cErrOk = false
        local function trySet() return setfenv(fn, {}) end
        local ran = xpcall(trySet, function(e)
            local s2, l2, f2 = debug.info(2, "slf")
            local f3 = debug.info(3, "f")
            if s2 == "[C]" and l2 == -1 and rawequal(f2, setfenv) and rawequal(f3, trySet)
                and string.find(tostring(e), "cannot change environment", 1, true) then cErrOk = true end
        end)
        if ran or not cErrOk then fail(10 + i) end
    end

    local env0 = getfenv(0)
    if type(env0) ~= "table" or rawequal(env0, _G) then fail(2) end

    local function box() return secretToken end
    local custom = { secretToken = 0x51A7E }
    local ret = setfenv(box, custom)
    if not rawequal(ret, box) or not rawequal(getfenv(box), custom) or box() ~= 0x51A7E then fail(3) end
end

-- ===================== AntiHook 5.lua (Tamper_2) — tostring/newproxy =====================
do
    local function fail(c) triggerBan("Tamper_2") end
    local seen = {}
    local prefixes = {
        { function() return {} end, "table: 0x" },
        { function() return function() end end, "function: 0x" },
        { function() return newproxy(false) end, "userdata: 0x" },
        { function() return coroutine.create(function() end) end, "thread: 0x" },
        { function() return buffer.create(4) end, "buffer: 0x" },
    }
    for i, entry in ipairs(prefixes) do
        local make, pref = entry[1], entry[2]
        local x = make(); local y = make()
        if rawequal(x, y) then fail(10 + i) end
        local sx = tostring(x); local sy = tostring(y)
        if sx == sy then fail(20 + i) end
        if string.sub(sx, 1, #pref) ~= pref or string.sub(sy, 1, #pref) ~= pref then fail(30 + i) end
        if seen[sx] or seen[sy] then fail(40 + i) end
        seen[sx] = true; seen[sy] = true
    end
    local nan = 0 / 0
    if nan == nan or rawequal(nan, nan) then fail(1) end
    if not rawequal(-0.0, 0.0) or 1 / -0.0 == 1 / 0.0 then fail(2) end
    local p1 = newproxy(true); local p2 = newproxy(false)
    if type(getmetatable(p1)) ~= "table" or getmetatable(p2) ~= nil then fail(3) end
    local spoof = setmetatable({ real = 11 }, {
        __index = { real = 22, fake = 33 },
        __eq = function() return true end,
    })
    local other = setmetatable({}, getmetatable(spoof))
    if spoof ~= other or rawequal(spoof, other) then fail(4) end
    if rawget(spoof, "real") ~= 11 or rawget(spoof, "fake") ~= nil or spoof.fake ~= 33 then fail(5) end
end

-- ===================== AntiHook 6.lua (Tamper_2) — game.GetService =====================
do
    local function fail(c) triggerBan("Tamper_2") end
    local gs1 = game.GetService
    local gs2 = game.GetService
    if type(gs1) ~= "function" or type(gs2) ~= "function" then fail(1) end
    local p1 = game:GetService("Players")
    local p2 = gs1(game, "Players")
    if typeof(p1) ~= "Instance" or not rawequal(p1, p2) then fail(2) end
    if pcall(gs1) or pcall(gs1, {}, "Players") or pcall(gs1, newproxy(true), "Players") then fail(3) end
    local colonCheck = false
    local function dotCall() return game.GetService("Players") end
    local okDot = xpcall(dotCall, function(err)
        local s2, l2 = debug.info(2, "sl")
        local f3 = debug.info(3, "f")
        if s2 == "[C]" and l2 == -1 and rawequal(f3, dotCall)
            and string.find(tostring(err), "Expected ':' not '.'", 1, true) then colonCheck = true end
    end)
    if okDot or not colonCheck then fail(4) end
    local folder = Instance.new("Folder")
    local child = Instance.new("IntValue")
    child.Name = "Probe"; child.Parent = folder
    if not rawequal(folder:FindFirstChild("Probe"), folder.FindFirstChild(folder, "Probe")) then
        folder:Destroy(); fail(5)
    end
    folder:Destroy()
end

-- ===================== AntiHook 7.lua (Tamper_3) =====================
do
    local function fail(c) triggerBan("Tamper_3") end
    local function packRet(...) return select("#", ...), { ... } end
    local n1, t1 = packRet(pcall(function(a, b, c)
        if a ~= 11 or b ~= nil or c ~= 33 then error("arg", 0) end
        return nil, "ok", nil, 77, nil
    end, 11, nil, 33))
    if n1 ~= 6 or t1[1] ~= true or t1[2] ~= nil or t1[3] ~= "ok" or t1[4] ~= nil or t1[5] ~= 77 or t1[6] ~= nil then fail(1) end
    local n2, t2 = packRet(xpcall(function(x, y, z)
        if x ~= "a" or y ~= nil or z ~= "c" then error("xarg", 0) end
        return nil, 42, nil
    end, function(e) return e end, "a", nil, "c"))
    if n2 ~= 4 or t2[1] ~= true or t2[2] ~= nil or t2[3] ~= 42 or t2[4] ~= nil then fail(2) end
    local hits = 0
    local okE, msgE = xpcall(function() error("first", 0) end, function()
        hits += 1; error("second", 0)
    end)
    if okE or msgE ~= "error in error handling" or hits ~= 1 then fail(3) end
end

-- ===================== AntiHook 8.lua (Tamper_3) =====================
do
    local function fail(c) triggerBan("Tamper_3") end
    local t = setmetatable({ 10, 20, 30 }, {
        __len = function() return 999 end,
        __index = { ghost = 123 },
    })
    if #t ~= 999 or rawlen(t) ~= 3 or rawlen("abcd") ~= 4 then fail(1) end
    if pcall(rawlen, 123) or pcall(rawlen, newproxy(true)) then fail(2) end
    local count = 0
    for k, v in next, t do
        if k == "ghost" then fail(3) end
        count += v
    end
    if count ~= 60 then fail(4) end
    local nextOk = false
    local function badNext() return next({ a = 1 }, "nonexistent_key_sl") end
    local ranNext = xpcall(badNext, function(e)
        local s2, l2, f2 = debug.info(2, "slf")
        local f3 = debug.info(3, "f")
        if s2 == "[C]" and l2 == -1 and rawequal(f2, next) and rawequal(f3, badNext)
            and string.find(tostring(e), "invalid key", 1, true) then nextOk = true end
    end)
    if ranNext or not nextOk then fail(5) end
    if select(-1, 5, 8, 13) ~= 13 or select("#", nil, nil, nil) ~= 3 then fail(6) end
    if pcall(select, 0, 1, 2) then fail(7) end
end

-- ===================== AntiHook 9.lua (Tamper_3) =====================
do
    local function fail(c) triggerBan("Tamper_3") end
    local function checkNoWrapper(fn, callBad)
        local direct = false
        local function trig() return callBad(fn) end
        local ok = xpcall(trig, function()
            local s2, l2, f2 = debug.info(2, "slf")
            local f3 = debug.info(3, "f")
            if s2 == "[C]" and l2 == -1 and rawequal(f2, fn) and rawequal(f3, trig) then direct = true end
        end)
        return (not ok) and direct
    end
    local b = buffer.create(4)
    if not checkNoWrapper(tonumber, function(f) return f("10", 99) end) then fail(1) end
    if not checkNoWrapper(string.sub, function(f) return f("x", {}) end) then fail(2) end
    if not checkNoWrapper(string.pack, function(f) return f("!99I4", 1) end) then fail(3) end
    if not checkNoWrapper(buffer.readu8, function(f) return f(b, 99) end) then fail(4) end
    if not checkNoWrapper(bit32.extract, function(f) return f(1, 31, 5) end) then fail(5) end
    if not checkNoWrapper(utf8.char, function(f) return f(0x200000) end) then fail(6) end
    if not checkNoWrapper(Instance.new, function(f) return f("__InvalidClass_SL_99__") end) then fail(7) end
    if not checkNoWrapper(game.GetService, function(f) return f(game, "__InvalidService_SL_99__") end) then fail(8) end
    local fTonum, fByte, fXor, fRawEq = tonumber, string.byte, bit32.bxor, rawequal
    local _ = fTonum("42")
    local m0 = gcinfo()
    local acc = 0
    for _ = 1, 4000 do
        if fRawEq(fXor(fByte("A"), 3), 66) and fTonum("7") == 7 then acc += 1 end
    end
    if acc ~= 4000 or (gcinfo() - m0) > 128 then fail(9) end
end

-- ===================== AntiHook 10.lua (Tamper_3) =====================
do
    local function fail(c) triggerBan("Tamper_3") end
    local et = Enum.HashAlgorithm
    local fn1 = et.FromName; local fn2 = et.FromName
    local fv1 = et.FromValue; local fv2 = et.FromValue
    if type(fn1) ~= "function" or rawequal(fn1, fn2) or rawequal(fv1, fv2) then fail(1) end
    if not isPureC(fn1) then fail(2) end
    if et:FromName("Sha256") ~= Enum.HashAlgorithm.Sha256 or et:FromName("__none__") ~= nil then fail(3) end
    local be = Instance.new("BindableEvent")
    local sg1 = be.Event; local sg2 = be.Event
    if typeof(sg1) ~= "RBXScriptSignal" or sg1 ~= sg2 or rawequal(sg1, sg2) then
        be:Destroy(); fail(4)
    end
    local cn = sg1:Connect(function() end)
    if cn.Connected ~= true then cn:Disconnect(); be:Destroy(); fail(5) end
    local badDisc = false
    local function noSelf() return cn.Disconnect() end
    local okNoSelf = xpcall(noSelf, function()
        local s2, l2 = debug.info(2, "sl")
        local f3 = debug.info(3, "f")
        if s2 == "[C]" and l2 == -1 and rawequal(f3, noSelf) then badDisc = true end
    end)
    if okNoSelf or not badDisc or cn.Connected ~= true then
        cn:Disconnect(); be:Destroy(); fail(6)
    end
    cn:Disconnect()
    local deadState = cn.Connected == false
    be:Destroy()
    if not deadState then fail(7) end
end

-- ============================================================
-- SUKCES — Idziemy dalej (bez print)
-- ============================================================
_G["_ArN_Stage4"] = true
_G["_ArN_Stage5"] = true
_G["_ArN_Stage6"] = true

local _next_url = "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/static_content/stage7.lua"
local _next_res = _req({Url = _next_url, Method = "GET"})
pcall(function() loadstring(_next_res.Body)() end)
