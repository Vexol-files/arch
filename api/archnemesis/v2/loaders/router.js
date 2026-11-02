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
    <title>Script Not Found</title>
    <style>
        body { background-color: #020203; color: #fff; font-family: 'Segoe UI', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .container { text-align: center; background: rgba(255, 46, 99, 0.1); padding: 40px; border-radius: 12px; border: 1px solid #ff2e63; }
        h1 { color: #ff2e63; }
        p { color: #8a93a6; }
    </style>
</head>
<body>
    <div class="container">
        <h1>⚠️ Script Not Found</h1>
        <p>The requested script (${file}) does not exist.</p>
    </div>
</body>
</html>`);
            }
            res.setHeader('Content-Type', 'text/plain');
            return res.status(404).send('-- Error: Script not found');
        }

        // ==========================================
        // WIDOK DLA PRZEGLĄDARKI
        // ==========================================
        if (isBrowser) {
            res.setHeader('Content-Type', 'text/html; charset=utf-8');
            return res.status(200).send(`
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Archnemesis - ${scriptType.toUpperCase()} Loader</title>
    <style>
        body { background-color: #020203; color: #fff; font-family: 'Segoe UI', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-image: radial-gradient(circle at center, rgba(0, 229, 255, 0.1) 0%, transparent 60%); }
        .container { text-align: center; background: rgba(15, 18, 25, 0.9); padding: 40px; border-radius: 16px; border: 1px solid rgba(0, 229, 255, 0.2); max-width: 700px; width: 100%; }
        h1 { color: #00e5ff; text-transform: uppercase; letter-spacing: 3px; }
        p { color: #8a93a6; }
        .code-container { background: #000; border-radius: 10px; border: 1px solid #1a1f2b; text-align: left; }
        .code-header { background: #0a0c10; padding: 10px 20px; display: flex; justify-content: space-between; border-bottom: 1px solid #1a1f2b; }
        .copy-btn { background: #00e5ff; color: #000; border: none; padding: 8px 20px; border-radius: 6px; font-weight: 800; cursor: pointer; }
        .code-content { padding: 25px 20px; font-family: monospace; color: #00ffaa; font-size: 14px; line-height: 1.8; word-break: break-all; }
    </style>
</head>
<body>
    <div class="container">
        <h1>${scriptType.toUpperCase()} LOADER</h1>
        <p>Copy the code below and execute it in your Roblox executor.</p>
        <div class="code-container">
            <div class="code-header">
                <span style="color:#8a93a6;font-size:12px;">ROBLOX SCRIPT</span>
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
                btn.innerText = 'Copied!';
                setTimeout(() => { btn.innerText = 'Copy Code'; }, 2000);
            });
        }
    </script>
</body>
</html>`);
        }

        // ==========================================
        // WIDOK DLA ROBLOX (FAZA 1 - POBRANIE STATIC CONTENT)
        // ==========================================
        // Ustalamy, który plik static_content ma pobrać loader
        let staticFile = "static_content_1"; // free
        if (scriptType === "premium") staticFile = "static_content_2";
        if (scriptType === "beta") staticFile = "static_content_3";

        // Generujemy kod Lua, który pobierze odpowiedni plik z GitHuba (Raw)
        const luaLoader = `
-- Archnemesis Faza 1: Pobieranie Static Content
local static_url = "https://raw.githubusercontent.com/TWOJ_NICK/projectarch/main/static_content/${staticFile}.lua"

local success, err = pcall(function()
    loadstring(game:HttpGet(static_url, true))()
end)

if not success then
    warn("[Archnemesis] Failed to load static content: " .. tostring(err))
end
        `;

        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        return res.status(200).send(luaLoader);

    } catch (error) {
        console.error('Loader Error:', error);
        res.setHeader('Content-Type', 'text/plain');
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
