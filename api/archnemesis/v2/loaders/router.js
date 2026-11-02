// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    const { file } = req.query;
    if (!file) return res.status(400).send('Missing file parameter');

    const scriptType = file.replace('.lua', '');
    const userAgent = req.headers['user-agent'] || '';
    const isBrowser = userAgent.includes('Mozilla') || userAgent.includes('Chrome') || userAgent.includes('Safari');

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const updatesCollection = db.collection('updates');
        
        const scriptData = await updatesCollection.findOne({ type: scriptType });

        // ==========================================
        // OBSŁUGA BRAKU SKRYPTU (404)
        // ==========================================
        if (!scriptData) {
            if (isBrowser) {
                res.setHeader('Content-Type', 'text/html; charset=utf-8');
                return res.status(404).send(`
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Archnemesis - Script Not Found</title>
    <style>
        body { background-color: #020203; color: #fff; font-family: 'Segoe UI', system-ui, sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; background-image: radial-gradient(circle at center, rgba(255, 46, 99, 0.1) 0%, transparent 60%); }
        .container { text-align: center; background: rgba(15, 18, 25, 0.9); padding: 50px 40px; border-radius: 16px; border: 1px solid rgba(255, 46, 99, 0.3); box-shadow: 0 20px 50px rgba(0,0,0,0.8), 0 0 30px rgba(255, 46, 99, 0.15); max-width: 500px; width: 100%; }
        .icon { font-size: 50px; color: #ff2e63; margin-bottom: 20px; text-shadow: 0 0 20px rgba(255, 46, 99, 0.5); }
        h1 { color: #ff2e63; margin-bottom: 10px; font-size: 24px; text-transform: uppercase; letter-spacing: 2px; }
        p { color: #8a93a6; font-size: 15px; line-height: 1.6; margin-bottom: 30px; }
        .status-box { background: rgba(0, 0, 0, 0.5); padding: 15px; border-radius: 8px; border: 1px solid #1a1f2b; font-family: 'Consolas', monospace; color: #ff2e63; font-size: 14px; }
        .btn { display: inline-block; margin-top: 30px; padding: 12px 30px; background: #ff2e63; color: #fff; text-decoration: none; border-radius: 6px; font-weight: bold; text-transform: uppercase; letter-spacing: 1px; transition: 0.2s; }
        .btn:hover { background: #fff; color: #ff2e63; box-shadow: 0 0 15px #ff2e63; }
    </style>
</head>
<body>
    <div class="container">
        <div class="icon">⚠️</div>
        <h1>Script Not Found</h1>
        <p>The requested script does not exist in our database or has been temporarily removed.</p>
        <div class="status-box">Requested File: ${file}</div>
        <a href="https://discord.gg/S3PJ37MfPG" class="btn">Join Discord for Support</a>
    </div>
</body>
</html>
                `);
            }
            res.setHeader('Content-Type', 'text/plain');
            return res.status(404).send('-- Error: Script not found in database');
        }

        // ==========================================
        // WIDOK DLA PRZEGLĄDARKI (GŁÓWNY LOADER HTML)
        // ==========================================
        if (isBrowser) {
            res.setHeader('Content-Type', 'text/html; charset=utf-8');
            return res.status(200).send(`
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Archnemesis - ${scriptType.toUpperCase()} Loader</title>
    <style>
        body { background-color: #020203; color: #fff; font-family: 'Segoe UI', system-ui, sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; background-image: radial-gradient(circle at center, rgba(0, 229, 255, 0.1) 0%, transparent 60%); }
        .container { text-align: center; background: rgba(15, 18, 25, 0.9); padding: 40px; border-radius: 16px; border: 1px solid rgba(0, 229, 255, 0.2); box-shadow: 0 20px 50px rgba(0,0,0,0.8), 0 0 30px rgba(0, 229, 255, 0.15); max-width: 700px; width: 100%; }
        h1 { color: #00e5ff; margin-bottom: 8px; font-size: 26px; text-transform: uppercase; letter-spacing: 3px; text-shadow: 0 0 15px rgba(0, 229, 255, 0.5); }
        p { color: #8a93a6; margin-bottom: 30px; font-size: 15px; }
        .code-container { background: #000; border-radius: 10px; border: 1px solid #1a1f2b; text-align: left; position: relative; overflow: hidden; }
        .code-header { background: #0a0c10; padding: 10px 20px; border-bottom: 1px solid #1a1f2b; display: flex; justify-content: space-between; align-items: center; }
        .code-title { color: #8a93a6; font-size: 12px; text-transform: uppercase; letter-spacing: 1px; font-weight: bold; }
        .copy-btn { background: #00e5ff; color: #000; border: none; padding: 8px 20px; border-radius: 6px; font-weight: 800; font-size: 12px; text-transform: uppercase; cursor: pointer; transition: 0.2s; }
        .copy-btn:hover { background: #fff; box-shadow: 0 0 15px #00e5ff; }
        .code-content { padding: 25px 20px; font-family: 'Consolas', 'Fira Code', monospace; color: #00ffaa; font-size: 14px; line-height: 1.8; white-space: pre-wrap; word-break: break-all; }
    </style>
</head>
<body>
    <div class="container">
        <h1>${scriptType.toUpperCase()} LOADER</h1>
        <p>Copy the code below and execute it in your Roblox executor.</p>
        
        <div class="code-container">
            <div class="code-header">
                <span class="code-title">Roblox Script</span>
                <button class="copy-btn" onclick="copyCode(this)">Copy Code</button>
            </div>
            <div class="code-content" id="fullCode">script_key="_YOUR_SCRIPT_KEY_HERE";
loadstring(game:HttpGet("https://projectarch.vercel.app/api/archnemesis/v2/loaders/${file}", true))()</div>
        </div>
    </div>
    <script>
        function copyCode(btn) {
            const code = document.getElementById('fullCode').innerText;
            navigator.clipboard.writeText(code).then(() => {
                const original = btn.innerText;
                btn.innerText = 'Copied!';
                btn.style.background = '#00ffaa';
                setTimeout(() => { btn.innerText = original; btn.style.background = '#00e5ff'; }, 2000);
            });
        }
    </script>
</body>
</html>
            `);
        }

        // ==========================================
        // WIDOK DLA ROBLOX (ANTI-TAMPER + CZYSTY KOD LUA)
        // ==========================================
        
        // Ten kod jest generowany dynamicznie i odsyłany do game:HttpGet w Roblox
        const luaLoader = `
-- ==========================================
-- ANTI-HOOK CHECK
-- ==========================================
local function checkHooks()
    local info = debug.getinfo(loadstring)
    if info.what ~= "C" then
        -- Wykryto hooka na loadstring (np. ArN Minimal Hook)
        request({
            Url = "https://projectarch.vercel.app/api/archnemesis/v2/keys/router?action=ban&script_key=" .. script_key .. "&hwid=test-hwid&reason=Loadstring_Hook",
            Method = "GET"
        })
        game.Players.LocalPlayer:Kick("Anti-Tamper: Hooking Detected")
        return false
    end
    return true
end

-- Uruchamiamy test, jeśli przejdzie, ładujemy właściwy kod z bazy
if checkHooks() then
    ${scriptData.Script}
end
        `;

        // Zwracamy gotowy, wygenerowany kod Lua dla Robloxa
        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        return res.status(200).send(luaLoader);

    } catch (error) {
        console.error('Loader Error:', error);
        res.setHeader('Content-Type', 'text/plain');
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
