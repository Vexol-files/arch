// api/archnemesis/v2/cheats/get_cheat.js
import { MongoClient } from 'mongodb';
const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { sess } = req.query;
    if (!sess) return res.status(400).send('Missing session');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const session = await db.collection('sessions').findOne({ session_id: sess });
        
        if (!session) {
            return res.status(404).send('Session not found');
        }

        const scriptType = session.script_type || "free";
        
        // LOGOWANIE (zobaczysz to w Vercel -> Logs)
        console.log(`[GET_CHEAT] Session: ${sess}, ScriptType: ${scriptType}`);

        const cheatUrls = {
            "free": "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/cheats/free.lua",
            "premium": "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/cheats/premium.lua",
            "beta": "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/cheats/beta.lua",
            "unnamed": "https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/cheats/unnamed.lua"
        };

        const cheatUrl = cheatUrls[scriptType] || cheatUrls["free"];

        const luaCode = `loadstring(game:HttpGet("${cheatUrl}"))()`;

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(luaCode);

    } catch (error) {
        console.error('Get Cheat Error:', error);
        return res.status(500).send('Error: ' + error.message);
    }
}
