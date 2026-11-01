// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    const { file } = req.query;

    // 1. Blokada dla zwykłych przeglądarek (sprawdzamy User-Agent)
    const userAgent = req.headers['user-agent'] || '';
    if (userAgent.includes('Mozilla') || userAgent.includes('Chrome') || userAgent.includes('Safari')) {
        return res.status(403).send('-- Error: Access Denied. This endpoint is for the loader only.');
    }

    if (!file) return res.status(400).send('-- Error: Missing file parameter');

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const updatesCollection = db.collection('updates');
        
        // Ustalamy typ na podstawie nazwy pliku (np. premium.lua -> premium)
        const scriptType = file.replace('.lua', '');

        // Pobieramy skrypt z bazy
        const scriptData = await updatesCollection.findOne({ type: scriptType });
        if (!scriptData) return res.status(404).send('-- Error: Script not found');

        // 2. Generujemy kod Loadera, który od razu przejdzie do weryfikacji
        // Ten kod zostanie pobrany przez game:HttpGet
        const loaderCode = `
            -- Archnemesis Loader (${scriptType})
            local HttpService = game:GetService("HttpService")
            local request = syn and syn.request or http_request or request
            
            -- Pobieramy klucz od użytkownika (w przyszłości możesz tu dodać UI)
            local script_key = "WPISZ_TUTAJ_KLUCZ" 
            local hwid = "TWOJE_HWID" -- W przyszłości: gethwid()
            
            -- Weryfikacja klucza
            local verifyRes = request({
                Url = "https://projectarch.vercel.app/api/archnemesis/v2/keys/router?action=verify_key&script_key=" .. script_key .. "&hwid=" .. hwid,
                Method = "GET"
            })
            
            local verifyData = HttpService:JSONDecode(verifyRes.Body)
            if not verifyData.success then
                warn("[Archnemesis] Błąd weryfikacji: " .. tostring(verifyData.error))
                return
            end
            
            -- Pobieranie właściwego skryptu
            local scriptRes = request({
                Url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/router?action=raw_script&script_key=" .. script_key,
                Method = "GET"
            })
            
            -- Uruchomienie
            loadstring(scriptRes.Body)()
        `;

        // Ustawiamy nagłówek, żeby przeglądarka wiedziała, że to tekst, a nie plik do pobrania
        res.setHeader('Content-Type', 'text/plain');
        return res.status(200).send(loaderCode);

    } catch (error) {
        console.error('Loader Error:', error);
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
