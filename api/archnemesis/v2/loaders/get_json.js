// api/archnemesis/v2/loaders/get_json.js
export default async function handler(req, res) {
    const { token, file } = req.query;
    if (!token || !file) return res.status(400).send('Missing parameters');

    const configs = {
        json1: {
            api_url: "https://projectarch.vercel.app/api/archnemesis/v2/keys/router",
            script_type: "premium"
        },
        json2: {
            script_type: "premium"
        }
    };

    const jsonData = configs[file];
    if (!jsonData) return res.status(404).send('Unknown file');

    res.setHeader('Content-Type', 'application/json');
    return res.status(200).send(JSON.stringify(jsonData));
}
