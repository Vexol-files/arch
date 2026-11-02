-- ============================================================
-- ANTIHOOK 9 — brak wrapperów (POPRAWIONY)
-- ============================================================
do
    local name = "AntiHook 9 — brak wrapperów"
    local issues = {}
    local b = buffer.create(4)

    local function checkNoWrapper(fn, callBad, label)
        local direct = false
        local function trig() return callBad(fn) end
        local ok = xpcall(trig, function()
            local s4, l4, f4 = debug.info(4, "slf")
            print(string.format("       [info] %s: ramka4 source=%s line=%s ref_ok=%s",
                label, tostring(s4), tostring(l4), tostring(rawequal(f4, fn))))
            if s4 == "[C]" and l4 == -1 and rawequal(f4, fn) then direct = true end
        end)
        if ok or not direct then table.insert(issues, label) end
    end

    checkNoWrapper(tonumber, function(f) return f("10", 99) end, "tonumber")
    checkNoWrapper(string.sub, function(f) return f("x", {}) end, "string.sub")
    checkNoWrapper(string.pack, function(f) return f("!99I4", 1) end, "string.pack")
    checkNoWrapper(buffer.readu8, function(f) return f(b, 99) end, "buffer.readu8")
    checkNoWrapper(bit32.extract, function(f) return f(1, 31, 5) end, "bit32.extract")
    checkNoWrapper(utf8.char, function(f) return f(0x200000) end, "utf8.char")

    local fTonum, fByte, fXor, fRawEq = tonumber, string.byte, bit32.bxor, rawequal
    local _ = fTonum("42")
    local acc = 0
    for _ = 1, 4000 do
        if fRawEq(fXor(fByte("A"), 3), 66) and fTonum("7") == 7 then acc += 1 end
    end
    if acc ~= 4000 then table.insert(issues, "loop acc=" .. acc) end

    if #issues > 0 then
        log("FAIL", name, table.concat(issues, ", ") .. banTag("Tamper_3"))
    else
        log("OK", name)
    end
end
