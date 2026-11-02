-- ============================================================
-- ANTITAMPER DIAGNOSTYKA — PEŁNA (AntiHook 1..10, bez banów)
-- ============================================================
-- Wypisuje [OK]/[FAIL]/[SKIP] dla KAŻDEGO testu.
-- Na końcu: które Tamper_X by poleciało i z którego bloku.
-- ============================================================

local results = { ok = 0, fail = 0, skip = 0 }
local failures = {}   -- { blok, test, szczegół, ban }
local bans = { Tamper_1 = 0, Tamper_2 = 0, Tamper_3 = 0 }

local function log(status, block, test, detail, ban)
    local tag = "[OK]  "
    if status == "FAIL" then
        tag = "[FAIL]"
        results.fail += 1
        table.insert(failures, { block = block, test = test, detail = detail, ban = ban })
        if ban then bans[ban] = (bans[ban] or 0) + 1 end
    elseif status == "SKIP" then
        tag = "[SKIP]"
        results.skip += 1
    else
        results.ok += 1
    end
    print(string.format("%s %s / %s%s%s",
        tag, block, test,
        detail and (" — " .. detail) or "",
        ban and ("  <-- ban: " .. ban) or ""))
end

-- ============================================================
-- isPureC (jak w stage4)
-- ============================================================
local function isPureC(fn)
    if type(fn) ~= "function" then return false, "not a function (" .. type(fn) .. ")" end
    local ok, s, f = pcall(debug.info, fn, "sf")
    if not ok then return false, "debug.info error: " .. tostring(s) end
    if s ~= "[C]" then return false, "source=" .. tostring(s) .. " (expected [C])" end
    if not rawequal(f, fn) then return false, "reference mismatch (f ~= fn)" end
    return true
end

print("============================================================")
print("ANTITAMPER DIAGNOSTYKA — PEŁNA (1..10)")
print("============================================================")

-- ============================================================
-- TEST 1: LOADSTRING (Tamper_1)
-- ============================================================
do
    local ok, res = pcall(function()
        local fn = loadstring("return 1337")
        return fn and fn()
    end)
    if not ok then
        log("FAIL", "TEST 1", "loadstring", "error: " .. tostring(res), "Tamper_1")
    elseif res ~= 1337 then
        log("FAIL", "TEST 1", "loadstring", "returned " .. tostring(res), "Tamper_1")
    else
        local pure, why = isPureC(loadstring)
        if not pure then
            log("FAIL", "TEST 1", "loadstring not pure C", why, "Tamper_1")
        else
            log("OK", "TEST 1", "loadstring")
        end
    end
end

-- ============================================================
-- TEST 2: DEBUG.INFO (Tamper_2)
-- ============================================================
do
    local pure, why = isPureC(debug.info)
    if not pure then
        log("FAIL", "TEST 2", "debug.info not pure C", why, "Tamper_2")
    else
        local ok, s, l, f = pcall(debug.info, pcall, "slf")
        if not ok then
            log("FAIL", "TEST 2", "debug.info(pcall)", "error: " .. tostring(s), "Tamper_2")
        elseif s ~= "[C]" then
            log("FAIL", "TEST 2", "pcall source", tostring(s), "Tamper_2")
        elseif l ~= -1 then
            log("FAIL", "TEST 2", "pcall currentline", tostring(l), "Tamper_2")
        elseif not rawequal(f, pcall) then
            log("FAIL", "TEST 2", "pcall reference", "mismatch", "Tamper_2")
        else
            log("OK", "TEST 2", "debug.info")
        end
    end
end

-- ============================================================
-- TEST 3: SYN.REQUEST / GAME.HTTPGET (Tamper_3)
-- ============================================================
do
    if not syn or not syn.request then
        log("SKIP", "TEST 3a", "syn.request", "not available")
    else
        local pure, why = isPureC(syn.request)
        if not pure then
            log("FAIL", "TEST 3a", "syn.request", why, "Tamper_3")
        else
            log("OK", "TEST 3a", "syn.request")
        end
    end

    if type(game.HttpGet) ~= "function" then
        log("SKIP", "TEST 3b", "game.HttpGet", "type=" .. type(game.HttpGet))
    else
        local pure, why = isPureC(game.HttpGet)
        if not pure then
            log("FAIL", "TEST 3b", "game.HttpGet", why, "Tamper_3")
        else
            log("OK", "TEST 3b", "game.HttpGet")
        end
    end
end

-- ============================================================
-- ANTIHOOK 1 — integralność funkcji C (Tamper_1)
-- ============================================================
do
    local block = "AntiHook 1"
    local list = {
        { "pcall", pcall }, { "xpcall", xpcall }, { "tostring", tostring }, { "tonumber", tonumber },
        { "type", type }, { "typeof", typeof }, { "rawequal", rawequal }, { "rawget", rawget },
        { "rawset", rawset }, { "getmetatable", getmetatable }, { "setmetatable", setmetatable },
        { "select", select }, { "error", error }, { "assert", assert },
        { "string.byte", string.byte }, { "string.sub", string.sub }, { "string.char", string.char },
        { "bit32.bxor", bit32.bxor }, { "buffer.create", buffer.create },
        { "debug.info", debug.info }, { "debug.traceback", debug.traceback },
        { "coroutine.resume", coroutine.resume },
        { "game.GetService", game.GetService }, { "Instance.new", Instance.new },
    }
    local bad = {}
    for i, entry in ipairs(list) do
        local pure, why = isPureC(entry[2])
        if not pure then table.insert(bad, entry[1] .. " (" .. why .. ")") end
    end
    if #bad > 0 then
        log("FAIL", block, "integralność C", table.concat(bad, ", "), "Tamper_1")
    else
        log("OK", block, "integralność C (" .. #list .. " funkcji)")
    end

    -- funkcja Lua musi być "Lua"
    local function luaFn(x, y) return x + y end
    local ok, s, f = pcall(debug.info, luaFn, "sf")
    if not ok or s == "[C]" or not rawequal(f, luaFn) then
        log("FAIL", block, "luaFn", "source=" .. tostring(s) .. " ref=" .. tostring(ok and rawequal(f, luaFn)), "Tamper_1")
    else
        log("OK", block, "luaFn")
    end
end

-- ============================================================
-- ANTIHOOK 2 — yield przez metametody (Tamper_1)
-- ============================================================
do
    local block = "AntiHook 2"
    local function mustFailYield(fn)
        local co = coroutine.create(fn)
        local ok, res = coroutine.resume(co)
        return (not ok) and string.find(tostring(res), "yield across", 1, true) ~= nil and coroutine.status(co) == "dead"
    end
    local tests = {
        { "__tostring", function()
            local o = setmetatable({}, { __tostring = function() coroutine.yield("hooked"); return "s" end })
            return tostring(o)
        end },
        { "string.gsub", function()
            return string.gsub("a", "a", function() coroutine.yield("hooked"); return "b" end)
        end },
        { "table.sort", function()
            local t = { 2, 1 }
            table.sort(t, function(x, y) coroutine.yield("hooked"); return x < y end)
        end },
        { "__index", function()
            local o = setmetatable({}, { __index = function() coroutine.yield("hooked") end })
            return o.k
        end },
        { "__newindex", function()
            local o = setmetatable({}, { __newindex = function() coroutine.yield("hooked") end })
            o.k = 1
        end },
        { "__eq", function()
            local mt = { __eq = function() coroutine.yield("hooked"); return true end }
            local a = setmetatable({}, mt); local b = setmetatable({}, mt)
            return a == b
        end },
    }
    local bad = {}
    for i, entry in ipairs(tests) do
        if not mustFailYield(entry[2]) then table.insert(bad, entry[1]) end
    end
    if #bad > 0 then
        log("FAIL", block, "yield metametody", "nie rzucają: " .. table.concat(bad, ", "), "Tamper_1")
    else
        log("OK", block, "yield metametody")
    end

    local coPcall = coroutine.create(function()
        local ok, v = pcall(function() return coroutine.yield("pcall_yield_ok") end)
        return ok and v == "resumed_ok"
    end)
    local ok1, y1 = coroutine.resume(coPcall)
    local ok2, y2 = coroutine.resume(coPcall, "resumed_ok")
    if not ok1 or y1 ~= "pcall_yield_ok" or not ok2 or y2 ~= true then
        log("FAIL", block, "pcall yield", "y1=" .. tostring(y1) .. " y2=" .. tostring(y2), "Tamper_1")
    else
        log("OK", block, "pcall yield")
    end
end

-- ============================================================
-- ANTIHOOK 3 — zamknięte metatabele (Tamper_1)
-- ============================================================
do
    local block = "AntiHook 3"
    local issues = {}
    local okS, mtS = pcall(getmetatable, "")
    local okV, mtV = pcall(getmetatable, Vector3.zero)
    local okC, mtC = pcall(getmetatable, CFrame.identity)
    if not okS or mtS ~= "The metatable is locked" then table.insert(issues, "string mt=" .. tostring(mtS)) end
    if not okV or mtV ~= "The metatable is locked" then table.insert(issues, "Vector3 mt=" .. tostring(mtV)) end
    if not okC or mtC ~= "The metatable is locked" then table.insert(issues, "CFrame mt=" .. tostring(mtC)) end
    if not rawequal(("x").byte, string.byte) then table.insert(issues, "('x').byte") end
    if not rawequal(("x").sub, string.sub) then table.insert(issues, "('x').sub") end
    if not rawequal(("x").gsub, string.gsub) then table.insert(issues, "('x').gsub") end
    if not rawequal(("x").format, string.format) then table.insert(issues, "('x').format") end
    if not rawequal(("x").pack, string.pack) then table.insert(issues, "('x').pack") end
    local guard = table.freeze({ k = 7 })
    if not table.isfrozen(guard) then table.insert(issues, "freeze") end
    if pcall(function() guard.k = 8 end) then table.insert(issues, "frozen writable") end
    -- badSub
    local cOk = false
    local function badSub() return string.sub("abc", {}) end
    local ran = xpcall(badSub, function(msg)
        local s2, l2, f2 = debug.info(2, "slf")
        local f3 = debug.info(3, "f")
        if s2 == "[C]" and l2 == -1 and rawequal(f2, string.sub) and rawequal(f3, badSub)
            and string.find(tostring(msg), "number expected, got table", 1, true) then cOk = true end
    end)
    if ran or not cOk then table.insert(issues, "badSub (ran=" .. tostring(ran) .. " cOk=" .. tostring(cOk) .. ")") end
    local b1, b2 = ("SL"):byte(1, 2)
    if b1 ~= 83 or b2 ~= 76 then table.insert(issues, "SL byte") end
    if #issues > 0 then
        log("FAIL", block, "metatabele", table.concat(issues, " | "), "Tamper_1")
    else
        log("OK", block, "metatabele")
    end
end

-- ============================================================
-- ANTIHOOK 4 — getfenv/setfenv (Tamper_2)
-- ============================================================
do
    local block = "AntiHook 4"
    if type(getfenv) ~= "function" or type(setfenv) ~= "function" then
        log("SKIP", block, "getfenv/setfenv", "not available")
    else
        local natives = {
            { "pcall", pcall }, { "xpcall", xpcall }, { "tostring", tostring }, { "rawequal", rawequal },
            { "getmetatable", getmetatable }, { "setmetatable", setmetatable },
            { "debug.info", debug.info }, { "string.byte", string.byte },
            { "buffer.create", buffer.create }, { "task.spawn", task.spawn },
            { "Instance.new", Instance.new }, { "game.GetService", game.GetService },
        }
        local bad = {}
        for i, entry in ipairs(natives) do
            local ok = false
            local function trySet() return setfenv(entry[2], {}) end
            local ran = xpcall(trySet, function(e)
                if string.find(tostring(e), "cannot change environment", 1, true) then ok = true end
            end)
            if ran or not ok then table.insert(bad, entry[1]) end
        end
        local env0 = getfenv(0)
        if type(env0) ~= "table" or rawequal(env0, _G) then table.insert(bad, "getfenv(0)") end
        local function box() return secretToken end
        local custom = { secretToken = 0x51A7E }
        local ret = setfenv(box, custom)
        if not rawequal(ret, box) or not rawequal(getfenv(box), custom) or box() ~= 0x51A7E then
            table.insert(bad, "setfenv Lua")
        end
        if #bad > 0 then
            log("FAIL", block, "getfenv/setfenv", table.concat(bad, ", "), "Tamper_2")
        else
            log("OK", block, "getfenv/setfenv")
        end
    end
end

-- ============================================================
-- ANTIHOOK 5 — tostring/newproxy (Tamper_2)
-- ============================================================
do
    local block = "AntiHook 5"
    local issues = {}
    local seen = {}
    local prefixes = {
        { "table", function() return {} end, "table: 0x" },
        { "function", function() return function() end end, "function: 0x" },
        { "userdata", function() return newproxy(false) end, "userdata: 0x" },
        { "thread", function() return coroutine.create(function() end) end, "thread: 0x" },
        { "buffer", function() return buffer.create(4) end, "buffer: 0x" },
    }
    for i, entry in ipairs(prefixes) do
        local nm, make, pref = entry[1], entry[2], entry[3]
        local x = make(); local y = make()
        if rawequal(x, y) then table.insert(issues, nm .. " rawequal") end
        local sx = tostring(x); local sy = tostring(y)
        if sx == sy then table.insert(issues, nm .. " same tostring") end
        if string.sub(sx, 1, #pref) ~= pref or string.sub(sy, 1, #pref) ~= pref then
            table.insert(issues, nm .. " bad prefix (" .. tostring(sx) .. ")")
        end
        if seen[sx] or seen[sy] then table.insert(issues, nm .. " duplicate") end
        seen[sx] = true; seen[sy] = true
    end
    local nan = 0 / 0
    if nan == nan or rawequal(nan, nan) then table.insert(issues, "nan == nan") end
    if not rawequal(-0.0, 0.0) or 1 / -0.0 == 1 / 0.0 then table.insert(issues, "-0.0/0.0") end
    local p1 = newproxy(true); local p2 = newproxy(false)
    if type(getmetatable(p1)) ~= "table" or getmetatable(p2) ~= nil then table.insert(issues, "newproxy mt") end
    local spoof = setmetatable({ real = 11 }, {
        __index = { real = 22, fake = 33 },
        __eq = function() return true end,
    })
    local other = setmetatable({}, getmetatable(spoof))
    if spoof ~= other or rawequal(spoof, other) then table.insert(issues, "__eq") end
    if rawget(spoof, "real") ~= 11 or rawget(spoof, "fake") ~= nil or spoof.fake ~= 33 then
        table.insert(issues, "rawget/__index")
    end
    if #issues > 0 then
        log("FAIL", block, "tostring/newproxy", table.concat(issues, " | "), "Tamper_2")
    else
        log("OK", block, "tostring/newproxy")
    end
end

-- ============================================================
-- ANTIHOOK 6 — game.GetService (Tamper_2)
-- ============================================================
do
    local block = "AntiHook 6"
    local issues = {}
    local gs1 = game.GetService
    local gs2 = game.GetService
    if type(gs1) ~= "function" or type(gs2) ~= "function" then
        table.insert(issues, "GetService not function")
    else
        local p1 = game:GetService("Players")
        local p2 = gs1(game, "Players")
        if typeof(p1) ~= "Instance" or not rawequal(p1, p2) then
            table.insert(issues, "GetService colon vs dot")
        end
        if pcall(gs1) or pcall(gs1, {}, "Players") or pcall(gs1, newproxy(true), "Players") then
            table.insert(issues, "GetService bad args")
        end
        local colonCheck = false
        local function dotCall() return game.GetService("Players") end
        local okDot = xpcall(dotCall, function(err)
            if string.find(tostring(err), "Expected ':' not '.'", 1, true) then colonCheck = true end
        end)
        if okDot or not colonCheck then table.insert(issues, "dot call not rejected") end
    end
    local folder = Instance.new("Folder")
    local child = Instance.new("IntValue")
    child.Name = "Probe"; child.Parent = folder
    if not rawequal(folder:FindFirstChild("Probe"), folder.FindFirstChild(folder, "Probe")) then
        table.insert(issues, "FindFirstChild")
    end
    folder:Destroy()
    if #issues > 0 then
        log("FAIL", block, "game.GetService", table.concat(issues, " | "), "Tamper_2")
    else
        log("OK", block, "game.GetService")
    end
end

-- ============================================================
-- ANTIHOOK 7 — pcall/xpcall args (Tamper_3)
-- ============================================================
do
    local block = "AntiHook 7"
    local issues = {}
    local function packRet(...) return select("#", ...), { ... } end
    local n1, t1 = packRet(pcall(function(a, b, c)
        if a ~= 11 or b ~= nil or c ~= 33 then error("arg", 0) end
        return nil, "ok", nil, 77, nil
    end, 11, nil, 33))
    if n1 ~= 6 or t1[1] ~= true or t1[2] ~= nil or t1[3] ~= "ok" or t1[4] ~= nil or t1[5] ~= 77 or t1[6] ~= nil then
        table.insert(issues, "pcall args (n=" .. n1 .. ")")
    end
    local n2, t2 = packRet(xpcall(function(x, y, z)
        if x ~= "a" or y ~= nil or z ~= "c" then error("xarg", 0) end
        return nil, 42, nil
    end, function(e) return e end, "a", nil, "c"))
    if n2 ~= 4 or t2[1] ~= true or t2[2] ~= nil or t2[3] ~= 42 or t2[4] ~= nil then
        table.insert(issues, "xpcall args (n=" .. n2 .. ")")
    end
    local hits = 0
    local okE, msgE = xpcall(function() error("first", 0) end, function()
        hits += 1; error("second", 0)
    end)
    if okE or hits ~= 1 or string.find(tostring(msgE), "error in error handling", 1, true) == nil then
        table.insert(issues, "error in error handling (hits=" .. hits .. " msg=" .. tostring(msgE) .. ")")
    end
    if #issues > 0 then
        log("FAIL", block, "pcall/xpcall", table.concat(issues, " | "), "Tamper_3")
    else
        log("OK", block, "pcall/xpcall")
    end
end

-- ============================================================
-- ANTIHOOK 8 — __len/rawlen/next/select (Tamper_3)
-- ============================================================
do
    local block = "AntiHook 8"
    local issues = {}
    local t = setmetatable({ 10, 20, 30 }, {
        __len = function() return 999 end,
        __index = { ghost = 123 },
    })
    if #t ~= 999 then table.insert(issues, "#t=" .. tostring(#t)) end
    if rawlen(t) ~= 3 then table.insert(issues, "rawlen(t)=" .. tostring(rawlen(t))) end
    if rawlen("abcd") ~= 4 then table.insert(issues, "rawlen('abcd')=" .. tostring(rawlen("abcd"))) end
    if pcall(rawlen, 123) then table.insert(issues, "rawlen(123) no error") end
    if pcall(rawlen, newproxy(true)) then table.insert(issues, "rawlen(newproxy) no error") end
    local count = 0
    for k, v in next, t do
        if k == "ghost" then table.insert(issues, "next ghost") end
        count += v
    end
    if count ~= 60 then table.insert(issues, "next count=" .. count) end
    local nextOk = false
    local function badNext() return next({ a = 1 }, "nonexistent_key_sl") end
    local ranNext = xpcall(badNext, function(e)
        if string.find(tostring(e), "invalid key", 1, true) then nextOk = true end
    end)
    if ranNext or not nextOk then table.insert(issues, "next invalid key") end
    if select(-1, 5, 8, 13) ~= 13 then table.insert(issues, "select(-1)") end
    if select("#", nil, nil, nil) ~= 3 then table.insert(issues, "select('#')") end
    if pcall(select, 0, 1, 2) then table.insert(issues, "select(0) no error") end
    if #issues > 0 then
        log("FAIL", block, "__len/rawlen/next/select", table.concat(issues, " | "), "Tamper_3")
    else
        log("OK", block, "__len/rawlen/next/select")
    end
end

-- ============================================================
-- ANTIHOOK 9 — brak wrapperów (Tamper_3) — isPureC
-- ============================================================
do
    local block = "AntiHook 9"
    local issues = {}
    local b = buffer.create(4)
    local function checkPure(fn, label)
        local pure, why = isPureC(fn)
        if not pure then
            table.insert(issues, label .. " (" .. why .. ")")
        end
    end
    checkPure(tonumber, "tonumber")
    checkPure(string.sub, "string.sub")
    checkPure(string.pack, "string.pack")
    checkPure(buffer.readu8, "buffer.readu8")
    checkPure(bit32.extract, "bit32.extract")
    checkPure(utf8.char, "utf8.char")
    checkPure(Instance.new, "Instance.new")
    checkPure(game.GetService, "game.GetService")

    local fTonum, fByte, fXor, fRawEq = tonumber, string.byte, bit32.bxor, rawequal
    local _ = fTonum("42")
    local acc = 0
    for _ = 1, 4000 do
        if fRawEq(fXor(fByte("A"), 3), 66) and fTonum("7") == 7 then acc += 1 end
    end
    if acc ~= 4000 then table.insert(issues, "loop acc=" .. acc) end

    if #issues > 0 then
        log("FAIL", block, "brak wrapperów", table.concat(issues, " | "), "Tamper_3")
    else
        log("OK", block, "brak wrapperów")
    end
end

-- ============================================================
-- ANTIHOOK 10 — Enum/BindableEvent (Tamper_3) — pełny
-- ============================================================
do
    local block = "AntiHook 10"
    local issues = {}

    -- 1) Enum ref
    local et = Enum.HashAlgorithm
    local fn1 = et.FromName
    local fn2 = et.FromName
    local fv1 = et.FromValue
    local fv2 = et.FromValue
    if type(fn1) ~= "function" or type(fv1) ~= "function" then
        table.insert(issues, "FromName/FromValue not function")
    else
        if rawequal(fn1, fn2) then table.insert(issues, "FromName ref equal") end
        if rawequal(fv1, fv2) then table.insert(issues, "FromValue ref equal") end
        local p1, w1 = isPureC(fn1); if not p1 then table.insert(issues, "FromName " .. w1) end
        local p2, w2 = isPureC(fv1); if not p2 then table.insert(issues, "FromValue " .. w2) end
    end
    if et:FromName("Sha256") ~= Enum.HashAlgorithm.Sha256 then table.insert(issues, "FromName Sha256") end
    if et:FromName("__none__") ~= nil then table.insert(issues, "FromName none") end

    -- 2) BindableEvent.Event
    local be = Instance.new("BindableEvent")
    local sg1 = be.Event
    local sg2 = be.Event
    if typeof(sg1) ~= "RBXScriptSignal" then
        table.insert(issues, "Event typeof=" .. typeof(sg1))
        be:Destroy()
    elseif sg1 ~= sg2 then
        table.insert(issues, "Event ref mismatch")
        be:Destroy()
    else
        -- 3) Connect
        local cn = sg1:Connect(function() end)
        if cn.Connected ~= true then
            table.insert(issues, "Connected=" .. tostring(cn.Connected))
            cn:Disconnect(); be:Destroy()
        else
            -- 4) Disconnect bez self
            local badDisc = false
            local function noSelf() return cn.Disconnect() end
            local okNoSelf = xpcall(noSelf, function()
                local s2, l2 = debug.info(2, "sl")
                local f3 = debug.info(3, "f")
                if s2 == "[C]" and l2 == -1 and rawequal(f3, noSelf) then badDisc = true end
            end)
            if okNoSelf or not badDisc or cn.Connected ~= true then
                table.insert(issues, "Disconnect bez self (ok=" .. tostring(okNoSelf) .. " bad=" .. tostring(badDisc) .. ")")
            end
            cn:Disconnect()
            if cn.Connected ~= false then table.insert(issues, "Connected po Disconnect") end
            be:Destroy()
        end
    end

    -- 5) GetEnumItems
    local okItems, items = pcall(function() return et:GetEnumItems() end)
    if not okItems or type(items) ~= "table" or #items == 0 then
        table.insert(issues, "GetEnumItems")
    else
        local first = items[1]
        if typeof(first) ~= "EnumItem" then
            table.insert(issues, "first typeof=" .. typeof(first))
        else
            if first.EnumType ~= et then table.insert(issues, "first.EnumType") end
            local byValue = et:FromValue(first.Value)
            if not rawequal(byValue, first) then table.insert(issues, "FromValue != first") end
            local byName = et:FromName(first.Name)
            if not rawequal(byName, first) then table.insert(issues, "FromName != first") end
        end
    end

    -- 6) złe argumenty
    if pcall(function() return et:FromName(123) end) then table.insert(issues, "FromName(123) no error") end
    if pcall(function() return et:FromValue("abc") end) then table.insert(issues, "FromValue('abc') no error") end
    if pcall(function() return et:FromValue(-99999) end) then table.insert(issues, "FromValue(-99999) no error") end

    -- 7) Fire
    local be2 = Instance.new("BindableEvent")
    local fired = false
    local conn = be2.Event:Connect(function() fired = true end)
    be2:Fire()
    task.wait()
    conn:Disconnect()
    be2:Destroy()
    if not fired then table.insert(issues, "Fire nie zadziałał") end

    if #issues > 0 then
        log("FAIL", block, "Enum/BindableEvent", table.concat(issues, " | "), "Tamper_3")
    else
        log("OK", block, "Enum/BindableEvent")
    end
end

-- ============================================================
-- PODSUMOWANIE
-- ============================================================
print("============================================================")
print(string.format("PODSUMOWANIE: %d OK, %d FAIL, %d SKIP", results.ok, results.fail, results.skip))
print(string.format("BANY (gdyby to był stage4): Tamper_1=%d, Tamper_2=%d, Tamper_3=%d",
    bans.Tamper_1, bans.Tamper_2, bans.Tamper_3))
print("============================================================")
if #failures > 0 then
    print("NIEUDANE TESTY (dokładnie to by Cię zbanowało):")
    for i, f in ipairs(failures) do
        print(string.format("  %d. [%s] %s — %s  --> %s",
            i, f.block, f.test, tostring(f.detail), tostring(f.ban)))
    end
else
    print("Wszystkie testy przeszły — brak tampera.")
end
print("============================================================")
