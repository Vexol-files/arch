// api/archnemesis/v2/script/temp/[id].js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    // Pobieramy ID z adresu URL (Vercel robi to automatycznie dla plików w nawiasach [id])
    const { id } = req.query; 
    
    // Usuwamy rozszerzenie .lua z ID
    const cleanId = id.replace('.lua', '');

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const tempCollection = db.collection('temp_scripts');

        // Szukamy tymczasowego linku w bazie
        const tempData = await tempCollection.findOne({ temp_id: cleanId });

        if (!tempData) {
            return res.status(404).send('-- Error: Invalid or expired temporary link');
        }

        // Sprawdzamy, czy link nie wygasł
        if (new Date() > new Date(tempData.expires_at)) {
            return res.status(403).send('-- Error: Temporary link expired');
        }

        // Zwracamy kod (albo Etap 2 z bazy, albo finalny skrypt)
        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(tempData.content || '-- Loading next stage...');

    } catch (error) {
        console.error('Temp Script Error:', error);
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
