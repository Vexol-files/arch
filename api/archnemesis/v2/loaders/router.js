// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';
import crypto from 'crypto';

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
        // WIDOK DLA PRZEGLĄDARKI (HTML)
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
        // WIDOK DLA ROBLOX (FAZA 1 - POBIERANIE Z GITHUBA)
        // ==========================================
        
        // 1. Generujemy unikalny token dla tego uruchomienia
        const runToken = crypto.randomBytes(16).toString('hex');
        const sessionId = crypto.randomBytes(16).toString('hex');

        // 2. Zapisujemy token i sesję w bazie
        await db.collection('run_tokens').insertOne({
            token: runToken,
            session_id: sessionId,
            script_type: scriptType,
            created_at: new Date(),
            used: false
        });
        
        await db.collection('sessions').insertOne({ session_id: sessionId, used_stages: [] });

        // 3. POBIERAMY ZOBFUSKOWANY LOADER Z GITHUBA
        // ZMIEŃ TEN LINK NA SWÓJ WŁAŚCIWY! (np. do repo arch lub archenmesis-kick)
        const GITHUB_RAW_URL = "https://raw.githubusercontent.com/Vexol-files/arch/main/load_main_loader.lua";
        
        let loaderCode = "";
        try {
            const githubRes = await fetch(GITHUB_RAW_URL);
            if (!githubRes.ok) throw new Error("Failed to fetch from GitHub");
            loaderCode = await githubRes.text();
        } catch (fetchErr) {
            console.error('GitHub Fetch Error:', fetchErr);
            return res.status(500).send('-- Error: Could not load VM script from GitHub');
        }

        // 4. PODMIENIAMY PLACEHOLDERY
        // Upewnij się, że w Twoim loader.lua (przed obfuskacją) masz:
        // _G["_ArN_Session"] = "__SESSION_ID__"
        // _G["_ArN_Token"] = "__RUN_TOKEN__"
        
        loaderCode = loaderCode
            .replace(/__SESSION_ID__/g, sessionId)
            .replace(/__RUN_TOKEN__/g, runToken);

        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        return res.status(200).send(loaderCode);

    } catch (error) {
        console.error('Loader Error:', error);
        res.setHeader('Content-Type', 'text/plain');
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
