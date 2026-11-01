// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    const { file } = req.query;
    if (!file) return res.status(400).send('Missing file parameter');

    const scriptType = file.replace('.lua', '');
    const userAgent = req.headers['user-agent'] || '';

    // Sprawdzamy, czy to przeglądarka
    const isBrowser = userAgent.includes('Mozilla') || userAgent.includes('Chrome') || userAgent.includes('Safari');

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const updatesCollection = db.collection('updates');
        
        const scriptData = await updatesCollection.findOne({ type: scriptType });
        if (!scriptData) return res.status(404).send('Script not found in database');

        // ==========================================
        // WIDOK DLA PRZEGLĄDARKI (ŁADNY HTML)
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
        body {
            background-color: #020203;
            color: #fff;
            font-family: 'Segoe UI', system-ui, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: radial-gradient(circle at center, rgba(0, 229, 255, 0.1) 0%, transparent 60%);
        }
        .container {
            text-align: center;
            background: rgba(15, 18, 25, 0.8);
            padding: 40px;
            border-radius: 12px;
            border: 1px solid rgba(0, 229, 255, 0.2);
            box-shadow: 0 10px 40px rgba(0,0,0,0.5), 0 0 20px rgba(0, 229, 255, 0.1);
            max-width: 600px;
            width: 100%;
        }
        h1 {
            color: #00e5ff;
            margin-bottom: 10px;
            font-size: 24px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        p {
            color: #8a93a6;
            margin-bottom: 30px;
            font-size: 14px;
        }
        .code-box {
            background: #000;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #333;
            font-family: 'Consolas', monospace;
            text-align: left;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .code-text {
            color: #00ffaa;
            font-size: 14px;
            overflow-x: auto;
            white-space: nowrap;
            user-select: all;
        }
        .copy-btn {
            background: #00e5ff;
            color: #000;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            margin-left: 10px;
            transition: 0.2s;
        }
        .copy-btn:hover {
            background: #fff;
            box-shadow: 0 0 15px #00e5ff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${scriptType.toUpperCase()} LOADER</h1>
        <p>This script is protected. Copy the code below to use it in your executor.</p>
        
        <div class="code-box">
            <span class="code-text" id="code1">script_key="_YOUR_SCRIPT_KEY_HERE";</span>
            <button class="copy-btn" onclick="copy('code1', this)">Copy</button>
        </div>
        
        <div class="code-box">
            <span class="code-text" id="code2">loadstring(game:HttpGet("https://projectarch.vercel.app/api/archnemesis/v2/loaders/${file}", true))()</span>
            <button class="copy-btn" onclick="copy('code2', this)">Copy</button>
        </div>
    </div>

    <script>
        function copy(id, btn) {
            const text = document.getElementById(id).innerText;
            navigator.clipboard.writeText(text).then(() => {
                const original = btn.innerText;
                btn.innerText = 'Copied!';
                setTimeout(() => btn.innerText = original, 2000);
            });
        }
    </script>
</body>
</html>
            `);
        }

        // ==========================================
        // WIDOK DLA ROBLOX (CZYSTY KOD LUA)
        // ==========================================
        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        return res.status(200).send(scriptData.Script);

    } catch (error) {
        console.error('Loader Error:', error);
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
