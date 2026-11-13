// api/archnemesis/v2/loaders/get_json.js
import { MongoClient } from 'mongodb';

export default async function handler(req, res) {
    const { token, file } = req.query;
    
    // Sprawdzamy, czy są wymagane parametry
    if (!token || !file) {
        return res.status(400).send('Missing parameters');
    }

    let client;
    try {
        // 1. Łączymy się z bazą danych
        client = new MongoClient(process.env.MONGODB_URI);
        await client.connect();
        const db = client.db('loader_system');
        
        // 2. Szukamy tokenu w bazie, żeby sprawdzić, jaka to wersja (free/premium/beta/unnamed)
        const tokenData = await db.collection('run_tokens').findOne({ token: token });
        
        // Jeśli nie znajdziemy tokenu, domyślnie zakładamy wersję "free"
        const scriptType = tokenData ? tokenData.script_type : "free";

        // 3. Definiujemy zawartość plików JSON
        const configs = {
            json1: {
                api_url: "https://projectarch.vercel.app/api/archnemesis/v2/keys/router",
                script_type: scriptType
            },
            json2: {
                script_type: scriptType
            }
        };

        // 4. Sprawdzamy, czy pytają o prawidłowy plik (json1 lub json2)
        const jsonData = configs[file];
        if (!jsonData) {
            return res.status(404).send('Unknown file');
        }

        // 5. Zwracamy dane jako JSON
        res.setHeader('Content-Type', 'application/json');
        return res.status(200).send(JSON.stringify(jsonData));

    } catch (error) {
        console.error('Get JSON Error:', error);
        return res.status(500).send('Error');
    } finally {
        // Zawsze zamykamy połączenie z bazą, żeby nie przekroczyć limitów
        if (client) await client.close();
    }
}
