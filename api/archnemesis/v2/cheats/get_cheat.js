// api/archnemesis/v2/cheats/get_cheat.js
import { MongoClient } from 'mongodb';
const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { sess, token } = req.query;
    if (!sess) return res.status(400).send('Missing session');

    try {
        await client.connect();
        const db = client.db('loader_system');
        
        // Sprawdzamy sesję
        const session = await db.collection('sessions').findOne({ session_id: sess });
        if (!session) return res.status(404).send('Session not found');

        // Pobieramy typ skryptu (np. "premium")
        const scriptType = session.script_type || "free";

        // Definiujemy linki do cheatów na GitHubie
        const cheatUrls = {
            "free": "https://raw.githubusercontent.com/Vexol-files/arch/main/cheats/free.lua",
            "premium": "https://raw.githubusercontent.com/Vexol-files/arch/main/cheats/premium.lua",
            "beta": "https://raw.githubusercontent.com/Vexol-files/arch/main/cheats/beta.lua",
            "unnamed": "https://raw.githubusercontent.com/Vexol-files/arch/main/cheats/unnamed.lua"
        };

        const cheatUrl = cheatUrls[scriptType] || cheatUrls["free"];

        // Pobieramy kod z GitHuba
        const fetchRes = await fetch(cheatUrl);
        if (!fetchRes.ok) throw new Error("Failed to fetch from GitHub");
        const cheatCode = await fetchRes.text();

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(cheatCode);
    } catch (error) {
        return res.status(500).send('Error fetching cheat');
    }
}
