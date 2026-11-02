// api/archnemesis/v2/loaders/get_json.js

export default async function handler(req, res) {
    const { file, token } = req.query;
    
    // W prawdziwym systemie sprawdziłbyś tutaj token w bazie MongoDB.
    // Dla testów zakładamy, że token jest poprawny.

    if (file === 'json1') {
        return res.status(200).send(generateJson({
            api_url: "https://projectarch.vercel.app/api/archnemesis/v2/keys/router",
            status: "online",
            version: "1.0.0"
        }));
    } 
    
    if (file === 'json2') {
        return res.status(200).send(generateJson({
            script_type: "premium",
            security_hash: "a1b2c3d4e5f6g7h8"
        }));
    }
    
    return res.status(400).send('{"error": "Unknown"}');
}

// Funkcja generująca JSON z 5000 linii śmieci
function generateJson(realData) {
    const junk = {};
    for (let i = 0; i < 5000; i++) {
        junk[`_fake_data_${i}`] = {
            id: Math.random().toString(36).substring(7),
            value: Math.random() * 1000,
            string: "Lorem_ipsum_" + i,
            array: [1, 2, 3, Math.random()]
        };
    }
    return JSON.stringify({ ...junk, ...realData });
}
