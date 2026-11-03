// api/archnemesis/v2/script/temp/[stage].js
import { MongoClient } from 'mongodb';
const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { stage } = req.query; // np. "stage2", "stage3", "stage4", "stage5", "stage6"
    const { sess } = req.query;   // ID sesji

    if (!sess) return res.status(400).send('Missing session');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const sessionsCollection = db.collection('sessions');
        
        const session = await sessionsCollection.findOne({ session_id: sess });
        if (!session) return res.status(404).send('Session not found');

        // Blokada przed ponownym użyciem tego samego etapu
        if (session.used_stages.includes(stage)) {
            return res.status(403).send('Stage already used');
        }

        // Oznaczamy etap jako użyty
        await sessionsCollection.updateOne(
            { session_id: sess },
            { $push: { used_stages: stage } }
        );

        // --- DEFINICJE CZYSTEGO KODU LUA DLA KAŻDEGO ETAPU ---
        const stageCode = {
            // Stage 2: Prosty przekaźnik
            "stage2": `
                local _req = syn and syn.request or http_request or request
                local _sess = _G["_ArN_Session"]
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage3?sess=" .. _sess, Method = "GET"})
                loadstring(_next.Body)()
            `,

            // Stage 3: Weryfikacja klucza i HWID
            "stage3": `
                local HttpService = game:GetService("HttpService")
                local _req = syn and syn.request or http_request or request
                local _sess = _G["_ArN_Session"]
                local _script_key = _G["script_key"]
                local _j1 = _G["_ArN_Json1"]
                local _data1 = HttpService:JSONDecode(readfile(_j1))
                local _api_url = _data1.api_url
                local _hwid = gethwid and gethwid() or "unknown"
                local _verify_url = _api_url .. "?action=verify_key&script_key=" .. _script_key .. "&hwid=" .. _hwid
                local _res = _req({Url = _verify_url, Method = "GET"})
                local _verify_data = HttpService:JSONDecode(_res.Body)
                
                if not _verify_data.success then
                    local kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/key.lua"
                    local _kick = _req({Url = kickUrl, Method = "GET"})
                    loadstring(_kick.Body)()
                    return
                end
                
                _G["_ArN_Temp_URL"] = _verify_data.next_stage
                _G["_ArN_Stage3"] = true
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage4?sess=" .. _sess, Method = "GET"})
                loadstring(_next.Body)()
            `,

            // Stage 4: Wielki Anti-Tamper (Ban 24h)
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
                    local kickUrl = "https://raw.githubusercontent.com/Vexol-files/archenmesis-kick/refs/heads/main/tamper1.lua"
                    pcall(function()
                        local _kick = _req({Url = kickUrl, Method = "GET"})
                        loadstring(_kick.Body)()
                    end)
                    error("dtc_Tamper_1", 0)
                end

                local function isPureC(fn)
                    if type(fn) ~= "function" then return false end
                    local ok, s, f = pcall(debug.info, fn, "sf")
                    if not ok then return false end
                    return s == "[C]" and rawequal(f, fn)
                end

                -- Podstawowe testy (możesz tu wkleić resztę z poprzedniego kodu, jeśli chcesz)
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

                -- Sukces
                _G["_ArN_Stage4"] = true
                local _sess = _G["_ArN_Session"]
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage5?sess=" .. _sess, Method = "GET"})
                loadstring(_next.Body)()
            `,

            // Stage 5: Sprawdzenie flag (czy nie pominięto etapów)
            "stage5": `
                if not _G["_ArN_Stage3"] or not _G["_ArN_Stage4"] then
                    game.Players.LocalPlayer:Kick("Anti-Tamper: Stage bypass detected.")
                    return
                end
                _G["_ArN_Stage5"] = true
                local _req = syn and syn.request or http_request or request
                local _sess = _G["_ArN_Session"]
                local _next = _req({Url = "https://projectarch.vercel.app/api/archnemesis/v2/script/temp/stage6?sess=" .. _sess, Method = "GET"})
                loadstring(_next.Body)()
            `,

            // Stage 6: Pobranie i uruchomienie finalnego (zaszyfrowanego) skryptu
            "stage6": `
                local _req = syn and syn.request or http_request or request
                local _final_url = _G["_ArN_Temp_URL"]
                if not _final_url then
                    game.Players.LocalPlayer:Kick("Anti-Tamper: Missing script URL.")
                    return
                end
                local _res = _req({Url = _final_url, Method = "GET"})
                loadstring(_res.Body)()
            `
        };

        const rawCode = stageCode[stage];
        if (!rawCode) return res.status(404).send('Unknown stage');

        // --- SZYFROWANIE KODU ETAPU ---
        let encrypted = "";
        for (let i = 0; i < rawCode.length; i++) {
            const char = rawCode[i];
            const tokenStr = Object.keys(session.token_map).find(key => session.token_map[key] === char);
            encrypted += tokenStr || char;
        }

        // --- GENEROWANIE LOADERA DLA TEGO ETAPU ---
        const stageLoader = `
local _req = syn and syn.request or http_request or request
local _enc = [[${encrypted}]]
local _res = _req({Url="https://projectarch.vercel.app/api/archnemesis/v2/script/temp/map?sess=${sess}", Method="GET"})
local _map = game:GetService("HttpService"):JSONDecode(_res.Body)
for t, c in pairs(_map) do _enc = _enc:gsub(t:gsub("%[","%%["):gsub("%]","%%]"), c) end
loadstring(_enc)()
        `;

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(stageLoader);

    } catch (error) {
        console.error("Błąd API:", error);
        return res.status(500).send('Internal Server Error');
    }
}
