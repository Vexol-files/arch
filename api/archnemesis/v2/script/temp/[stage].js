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

        if (session.used_stages.includes(stage)) return res.status(403).send('Stage already used');
        await sessionsCollection.updateOne({ session_id: sess }, { $push: { used_stages: stage } });

        const stageCode = {
            "stage2": `
                local _req = syn and syn.request or http_request or request
                local _session = (getgenv and getgenv()._ArN_Session) or _G._ArN_Session
                local _res = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage3?sess=" .. _session, Method = "GET"})
                loadstring(_res.Body)()
            `,
            "stage3": `
                local HttpService = game:GetService("HttpService")
                local _req = syn and syn.request or http_request or request

                local function _get_script_key()
                    if getgenv and getgenv().script_key then return getgenv().script_key end
                    if _G.script_key then return _G.script_key end
                    if shared and shared.script_key then return shared.script_key end
                    return nil
                end

                local function _kickPlayer(msg)
                    local ok, players = pcall(function() return game:GetService("Players") end)
                    if ok and players and players.LocalPlayer then players.LocalPlayer:Kick(msg) else error(msg, 0) end
                end

                local _script_key = _get_script_key()
                if not _script_key or _script_key == "" then
                    _kickPlayer("Error: Missing script_key!")
                    return
                end

                local _api_url = "https://projectarch.vercel.app/api/archnemesis/v2/keys/router"
                local _j1 = _G._ArN_Json1 or (getgenv and getgenv()._ArN_Json1)
                
                if _j1 and isfile(_j1) then
                    local ok, data = pcall(function() return HttpService:JSONDecode(readfile(_j1)) end)
                    if ok and data and data.api_url then
                        _api_url = data.api_url
                    end
                end

                local _hwid = gethwid and gethwid() or "unknown"
                local _verify_url = _api_url .. "?action=verify_key&script_key=" .. _script_key .. "&hwid=" .. _hwid
                local _res = _req({Url = _verify_url, Method = "GET"})
                local _verify_data = HttpService:JSONDecode(_res.Body)
                
                if not _verify_data.success then
                    local _kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/key.lua"
                    if _verify_data.error == "banned" then
                        _kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/blacklist.lua"
                    elseif _verify_data.error == "invalid_hwid" then
                        _kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/hwid.lua"
                    end
                    local _kick = _req({Url = _kickUrl, Method = "GET"})
                    loadstring(_kick.Body)()
                    return
                end

                _G._ArN_Temp_URL = _verify_data.next_stage
                _G._ArN_Stage3 = true
                local _session = (getgenv and getgenv()._ArN_Session) or _G._ArN_Session
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage4?sess=" .. _session, Method = "GET"})
                loadstring(_next.Body)()
            `,
            "stage4": `
                local _req = syn and syn.request or http_request or request
                local _key = (getgenv and getgenv().script_key) or _G.script_key or "unknown"
                local _hwid = (function()
                    local ok, h = pcall(function() return gethwid and gethwid() end)
                    if ok and h then return h end
                    local ok2, h2 = pcall(function() return syn and syn.get_hwid and syn:get_hwid() end)
                    if ok2 and h2 then return h2 end
                    return "unknown"
                end)()

                local function isPureC(fn)
                    if type(fn) ~= "function" then return false end
                    local ok, s, f = pcall(debug.info, fn, "sf")
                    if not ok then return false end
                    return s == "[C]" and rawequal(f, fn)
                end

                local function triggerBan()
                    local _ban_url = "https://projectarch.vercel.app/api/archnemesis/v2/keys/router?action=ban&reason=Tamper_1&script_key=" .. _key .. "&hwid=" .. _hwid
                    pcall(function() _req({Url = _ban_url, Method = "GET"}) end)
                    local kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/tamper.lua"
                    pcall(function()
                        local _kick = _req({Url = kickUrl, Method = "GET"})
                        loadstring(_kick.Body)()
                    end)
                    error("dtc_Tamper_1", 0)
                end

                do
                    if syn and syn.request and not isPureC(syn.request) then triggerBan() end
                    if type(game.HttpGet) == "function" and not isPureC(game.HttpGet) then triggerBan() end
                end

                _G._ArN_Stage4 = true
                local _session = (getgenv and getgenv()._ArN_Session) or _G._ArN_Session
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage5?sess=" .. _session, Method = "GET"})
                loadstring(_next.Body)()
            `,
            "stage5": `
                local function _kickPlayer(msg)
                    local ok, players = pcall(function() return game:GetService("Players") end)
                    if ok and players and players.LocalPlayer then players.LocalPlayer:Kick(msg) else error(msg, 0) end
                end

                local _stage3 = (getgenv and getgenv()._ArN_Stage3) or _G._ArN_Stage3
                local _stage4 = (getgenv and getgenv()._ArN_Stage4) or _G._ArN_Stage4
                if not _stage3 or not _stage4 then
                    _kickPlayer("Anti-Tamper: Stage bypass detected.")
                    return
                end
                
                _G._ArN_Stage5 = true
                local _req = syn and syn.request or http_request or request
                local _session = (getgenv and getgenv()._ArN_Session) or _G._ArN_Session
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage6?sess=" .. _session, Method = "GET"})
                loadstring(_next.Body)()
            `,
            "stage6": `
                local function _kickPlayer(msg)
                    local ok, players = pcall(function() return game:GetService("Players") end)
                    if ok and players and players.LocalPlayer then players.LocalPlayer:Kick(msg) else error(msg, 0) end
                end

                local _req = syn and syn.request or http_request or request
                local _session = (getgenv and getgenv()._ArN_Session) or _G._ArN_Session
                local _token = (getgenv and getgenv()._ArN_Token) or _G._ArN_Token

                if not _session then
                    _kickPlayer("Anti-Tamper: Missing session.")
                    return
                end

                local _get_url = "https://projectarch.vercel.app/api/archnemesis/v2/cheats/get_cheat?sess=" .. _session .. "&token=" .. (_token or "")
                local _res = _req({Url = _get_url, Method = "GET"})

                if not _res or not _res.Body or #_res.Body < 20 then
                    _kickPlayer("Failed to fetch final script.")
                    return
                end
                
                loadstring(_res.Body, true)()
            `
        };

        const rawCode = stageCode[stage];
        if (!rawCode) return res.status(404).send('Unknown stage');

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(rawCode);
    } catch (error) {
        return res.status(500).send('Error');
    }
}
