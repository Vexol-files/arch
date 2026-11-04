import { MongoClient } from 'mongodb';
const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { stage } = req.query;
    const { sess } = req.query;
    if (!sess) return res.status(400).send('Missing session');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const sessionsCollection = db.collection('sessions');
        const session = await sessionsCollection.findOne({ session_id: sess });
        if (!session) return res.status(404).send('Session not found');

        // 1. Definiujemy kody wszystkich stage'y
        const stageCode = {
            "stage2": `
                local _req = syn and syn.request or http_request or request
                local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage3?sess=" .. _G["_ArN_Session"], Method = "GET"})
                if not _res or not _res.Body or #_res.Body < 20 or string.find(_res.Body, "Stage already used", 1, true) or string.find(_res.Body, "Session not found", 1, true) then
                    game.Players.LocalPlayer:Kick("Failed to load stage 3.")
                    return
                end
                local _realLoadstring = loadstring
                for k, v in pairs(_G) do
                    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
                        _realLoadstring = v
                        break
                    end
                end
                _realLoadstring(_res.Body)()
            `,
            "stage3": `
                local HttpService = game:GetService("HttpService")
                local _req = syn and syn.request or http_request or request
                local _script_key = _G["script_key"]
                local _j1 = _G["_ArN_Json1"]
                if not _script_key or not _j1 then
                    game.Players.LocalPlayer:Kick("Anti-Tamper: Missing data.")
                    return
                end
                local _data1 = HttpService:JSONDecode(readfile(_j1))
                local _api_url = _data1.api_url
                local _hwid = gethwid and gethwid() or "unknown"
                local _verify_url = _api_url .. "?action=verify_key&script_key=" .. _script_key .. "&hwid=" .. _hwid
                local _res = _req({Url = _verify_url, Method = "GET"})
                local _verify_data = HttpService:JSONDecode(_res.Body)
                
                if not _verify_data.success then
                    local _kickUrl = ""
                    if _verify_data.error == "banned" then
                        _kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/blacklist.lua"
                    elseif _verify_data.error == "invalid_hwid" then
                        _kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/hwid.lua"
                    else
                        _kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/key.lua"
                    end
                    
                    local _kick = _req({Url = _kickUrl, Method = "GET"})
                    local _realLoadstring = loadstring
                    for k, v in pairs(_G) do
                        if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
                            _realLoadstring = v
                            break
                        end
                    end
                    _realLoadstring(_kick.Body)()
                    return
                end
                
                _G["_ArN_Temp_URL"] = _verify_data.next_stage
                _G["_ArN_Stage3"] = true
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage4?sess=" .. _G["_ArN_Session"], Method = "GET"})
                
                if not _next or not _next.Body or #_next.Body < 20 or string.find(_next.Body, "Stage already used", 1, true) then
                    game.Players.LocalPlayer:Kick("Failed to load stage 4.")
                    return
                end

                local _realLoadstring = loadstring
                for k, v in pairs(_G) do
                    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
                        _realLoadstring = v
                        break
                    end
                end
                _realLoadstring(_next.Body)()
            `,
            "stage4": `
                local _req = syn and syn.request or http_request or request
                local _key = _G["script_key"] or "unknown"
                local _hwid = (function()
                    local ok, h = pcall(function() return gethwid and gethwid() end)
                    if ok and h then return h end
                    local ok2, h2 = pcall(function() return syn and syn.get_hwid and syn:get_hwid() end)
                    if ok2 and h2 then return h2 end
                    local ok3, plr = pcall(function() return game.Players.LocalPlayer end)
                    if ok3 and plr then return plr.UserId .. "_" .. plr.Name end
                    return "unknown"
                end)()

                local function triggerBan()
                    local _ban_url = "https://projectarch.vercel.app/api/archnemesis/v2/keys/router?action=ban&reason=Tamper_1&script_key=" .. _key .. "&hwid=" .. _hwid
                    pcall(function() _req({Url = _ban_url, Method = "GET"}) end)
                    local kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/tamper.lua"
                    pcall(function()
                        local _kick = _req({Url = kickUrl, Method = "GET"})
                        local _realLoadstring = loadstring
                        for k, v in pairs(_G) do
                            if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
                                _realLoadstring = v
                                break
                            end
                        end
                        _realLoadstring(_kick.Body)()
                    end)
                    error("dtc_Tamper_1", 0)
                end

                local function isPureC(fn)
                    if type(fn) ~= "function" then return false end
                    local ok, s, f = pcall(debug.info, fn, "sf")
                    if not ok then return false end
                    return s == "[C]" and rawequal(f, fn)
                end

                do
                    local ok, res = pcall(function() local fn = loadstring("return 1337"); return fn and fn() end)
                    if not ok or res ~= 1337 then triggerBan() end
                    if not isPureC(loadstring) then triggerBan() end
                end
                do
                    if not isPureC(debug.info) then triggerBan() end
                    local ok, s, l, f = pcall(debug.info, pcall, "slf")
                    if not ok or s ~= "[C]" or l ~= -1 or not rawequal(f, pcall) then triggerBan() end
                end
                do
                    if syn and syn.request and not isPureC(syn.request) then triggerBan() end
                    if type(game.HttpGet) == "function" and not isPureC(game.HttpGet) then triggerBan() end
                end

                _G["_ArN_Stage4"] = true
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage5?sess=" .. _G["_ArN_Session"], Method = "GET"})
                
                if not _next or not _next.Body or #_next.Body < 20 or string.find(_next.Body, "Stage already used", 1, true) then
                    game.Players.LocalPlayer:Kick("Failed to load stage 5.")
                    return
                end

                local _realLoadstring = loadstring
                for k, v in pairs(_G) do
                    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
                        _realLoadstring = v
                        break
                    end
                end
                _realLoadstring(_next.Body)()
            `,
            "stage5": `
                if not _G["_ArN_Stage3"] or not _G["_ArN_Stage4"] then
                    game.Players.LocalPlayer:Kick("Anti-Tamper: Stage bypass detected.")
                    return
                end
                _G["_ArN_Stage5"] = true
                local _req = syn and syn.request or http_request or request
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage6?sess=" .. _G["_ArN_Session"], Method = "GET"})
                
                if not _next or not _next.Body or #_next.Body < 20 or string.find(_next.Body, "Stage already used", 1, true) then
                    game.Players.LocalPlayer:Kick("Failed to load stage 6.")
                    return
                end

                local _realLoadstring = loadstring
                for k, v in pairs(_G) do
                    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
                        _realLoadstring = v
                        break
                    end
                end
                _realLoadstring(_next.Body)()
            `,
            "stage6": `
                local _req = syn and syn.request or http_request or request
                local _final_url = _G["_ArN_Temp_URL"]
                if not _final_url then
                    game.Players.LocalPlayer:Kick("Anti-Tamper: Missing script URL.")
                    return
                end
                local _res = _req({Url = _final_url, Method = "GET"})
                
                if not _res or not _res.Body or #_res.Body < 20 then
                    game.Players.LocalPlayer:Kick("Failed to load final script.")
                    return
                end

                local _realLoadstring = loadstring
                for k, v in pairs(_G) do
                    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
                        _realLoadstring = v
                        break
                    end
                end
                _realLoadstring(_res.Body)()
            `
        };

        // 2. Sprawdzamy, czy taki stage w ogóle istnieje
        const rawCode = stageCode[stage];
        if (!rawCode) return res.status(404).send('Unknown stage');

        // 3. Sprawdzamy, czy sesja nie zużyła już tego stage'a
        if (session.used_stages.includes(stage)) return res.status(403).send('Stage already used');

        // 4. Oznaczamy stage jako użyty DOPIERO TERAZ (po sprawdzeniu, że kod istnieje i nie był użyty)
        await sessionsCollection.updateOne({ session_id: sess }, { $push: { used_stages: stage } });

        // 5. Zwracamy kod Lua
        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(rawCode);
    } catch (error) {
        return res.status(500).send('Error');
    }
}
