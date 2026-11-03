import { MongoClient } from 'mongodb';
const client = new MongoClient(process.env.MONGODB_URI);

export default async function handler(req, res) {
    const { sess } = req.query;
    if (!sess) return res.status(400).send('Missing session');

    try {
        await client.connect();
        const db = client.db('loader_system');
        const sessionsCollection = db.collection('sessions');

        const session = await sessionsCollection.findOne({ session_id: sess });
        if (!session) return res.status(404).send('Session not found');
        
        // Sprawdzamy, czy nie minęło 5 sekund
        if (new Date() > new Date(session.expires_at)) {
            return res.status(403).send('Session expired');
        }

        const map = session.token_map;
        
        // USUWAMY SESJĘ (Burn after reading)
        await sessionsCollection.deleteOne({ session_id: sess });

        return res.status(200).json(map);
    } catch (error) {
        return res.status(500).send('Error');
    }
}
