// api/discord/callback.js

export default async function handler(req, res) {
    // 1. Pobieramy kod autoryzacyjny z URL (Discord go tu przysyła)
    const { code } = req.query;

    if (!code) {
        return res.status(400).send('Brak kodu autoryzacji z Discorda.');
    }

    // --- KONFIGURACJA (pobierana z Vercel Environment Variables) ---
    const CLIENT_ID = process.env.CLIENT_ID;
    const CLIENT_SECRET = process.env.CLIENT_SECRET;
    const BOT_TOKEN = process.env.BOT_TOKEN;
    const GUILD_ID = process.env.GUILD_ID;
    // Ten adres musi być DOKŁADNIE taki sam jak w Discord Developer Portal i w login.html
    const REDIRECT_URI = 'https://projectarch.vercel.app/api/discord/callback';

    try {
        // 2. Wymieniamy kod na token dostępu
        const tokenResponse = await fetch('https://discord.com/api/oauth2/token', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
                client_id: CLIENT_ID,
                client_secret: CLIENT_SECRET,
                grant_type: 'authorization_code',
                code: code,
                redirect_uri: REDIRECT_URI
            })
        });

        if (!tokenResponse.ok) throw new Error('Błąd wymiany kodu na token');
        const tokenData = await tokenResponse.json();
        const accessToken = tokenData.access_token;

        // 3. Pobieramy dane użytkownika (ID, nazwa, email, avatar)
        const userResponse = await fetch('https://discord.com/api/users/@me', {
            headers: { Authorization: `Bearer ${accessToken}` }
        });
        const user = await userResponse.json();

        // 4. Pobieramy informacje o rolach użytkownika na Twoim serwerze
        let userRoles = [];
        try {
            // Pobieramy członka serwera (używamy tokenu bota)
            const memberResponse = await fetch(`https://discord.com/api/guilds/${GUILD_ID}/members/${user.id}`, {
                headers: { Authorization: `Bot ${BOT_TOKEN}` }
            });
            
            if (memberResponse.ok) {
                const member = await memberResponse.json();
                
                // Pobieramy wszystkie role z serwera
                const rolesResponse = await fetch(`https://discord.com/api/guilds/${GUILD_ID}/roles`, {
                    headers: { Authorization: `Bot ${BOT_TOKEN}` }
                });
                const allRoles = await rolesResponse.json();

                // Filtrujemy role, które ma użytkownik (i nie są to role @everyone)
                userRoles = allRoles
                    .filter(role => member.roles.includes(role.id) && role.name !== '@everyone')
                    .sort((a, b) => b.position - a.position) // Sortujemy od najwyższej
                    .map(role => ({
                        name: role.name,
                        color: role.color
                    }));
            }
        } catch (roleError) {
            console.error('Błąd pobierania ról (użytkownik może nie być na serwerze):', roleError);
            // Jeśli użytkownika nie ma na serwerze, po prostu nie będzie miał ról
        }

        // 5. Przygotowujemy dane do przekazania na panel.html
        const profileData = {
            id: user.id,
            username: user.username,
            globalName: user.global_name || user.username,
            email: user.email || 'Brak dostępu do e-maila',
            avatar: user.avatar ? `https://cdn.discordapp.com/avatars/${user.id}/${user.avatar}.png` : null,
            createdAt: new Date(user.id / 4194304 + 1420070400000).toLocaleDateString('pl-PL'),
            guildId: GUILD_ID,
            roles: userRoles
        };

        // 6. Kodujemy dane w Base64, aby bezpiecznie przekazać je w URL
        const encodedData = Buffer.from(JSON.stringify(profileData)).toString('base64');

        // 7. Przekierowujemy użytkownika na panel.html z danymi
        res.redirect(302, `/panel.html?data=${encodedData}`);

    } catch (error) {
        console.error('Błąd logowania Discord:', error);
        // W razie błędu przekierowujemy na stronę błędu lub główną
        res.redirect(302, '/login.html?error=auth_failed');
    }
}
