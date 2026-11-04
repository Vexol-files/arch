// generate_loader.js
import { MongoClient } from 'mongodb';
import crypto from 'crypto';
const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { token } = req.query;
    if (!token) return res.status(400).send('Missing token');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const sessionsCollection = db.collection('sessions');

        const sessionId = crypto.randomBytes(16).toString('hex');
        await sessionsCollection.insertOne({ session_id: sessionId, used_stages: [] });

        // Pobierz zobfuskowany loader z GitHuba
        const loaderRes = await fetch('https://raw.githubusercontent.com/Vexol-files/arch/refs/heads/main/loader.lua');
        if (!loaderRes.ok) throw new Error('Failed to fetch loader');
        let loaderCode = await loaderRes.text();

        // Wstrzyknij sessionId i token (podmiana placeholderów)
        loaderCode = loaderCode
            .replace(/__SESSION_ID__/g, sessionId)
            .replace(/__TOKEN__/g, token);

        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(loaderCode);

    } catch (error) {
        console.error(error);
        res.status(500).send('Error');
    }
}
