// api/discord/callback.js

export default async function handler(req, res) {
    const { code } = req.query;

    if (!code) {
        return res.status(400).send('Brak kodu autoryzacji z Discorda.');
    }

    const CLIENT_ID = process.env.CLIENT_ID;
    const CLIENT_SECRET = process.env.CLIENT_SECRET;
    const BOT_TOKEN = process.env.BOT_TOKEN;
    const GUILD_ID = process.env.GUILD_ID;
    const REDIRECT_URI = 'https://projectarch.vercel.app/api/discord/callback';
    const PANEL_URL = 'https://projectarch.vercel.app/panel.html';
    const LOGIN_URL = 'https://projectarch.vercel.app/login.html';

    try {
        // 1. Wymieniamy kod na token dostępu
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

        if (!tokenResponse.ok) {
            const errorText = await tokenResponse.text();
            console.error('Błąd tokenu:', errorText);
            throw new Error(`Błąd wymiany kodu na token: ${errorText}`);
        }
        
        const tokenData = await tokenResponse.json();
        const accessToken = tokenData.access_token;

        // 2. Pobieramy dane użytkownika (ID, nazwa, email, avatar)
        const userResponse = await fetch('https://discord.com/api/users/@me', {
            headers: { Authorization: `Bearer ${accessToken}` }
        });
        
        if (!userResponse.ok) throw new Error('Błąd pobierania danych użytkownika');
        const user = await userResponse.json();

        // 3. Pobieramy informacje o rolach użytkownika
        let userRoles = [];
        try {
            const memberResponse = await fetch(`https://discord.com/api/guilds/${GUILD_ID}/members/${user.id}`, {
                headers: { Authorization: `Bot ${BOT_TOKEN}` }
            });
            
            if (memberResponse.ok) {
                const member = await memberResponse.json();
                
                const rolesResponse = await fetch(`https://discord.com/api/guilds/${GUILD_ID}/roles`, {
                    headers: { Authorization: `Bot ${BOT_TOKEN}` }
                });
                const allRoles = await rolesResponse.json();

                // Filtrujemy role użytkownika, sortujemy od najwyższej
                // DODANO: id roli, aby panel mógł sprawdzić uprawnienia
                userRoles = allRoles
                    .filter(role => member.roles.includes(role.id) && role.name !== '@everyone')
                    .sort((a, b) => b.position - a.position)
                    .map(role => ({
                        id: role.id,        // <-- Kluczowe dla panelu admina!
                        name: role.name,
                        color: role.color
                    }));
            } else {
                console.warn(`Użytkownik ${user.id} nie jest na serwerze lub bot nie ma uprawnień.`);
            }
        } catch (roleError) {
            console.error('Błąd pobierania ról:', roleError);
        }

        // 4. Przygotowujemy dane do przekazania
        const profileData = {
            id: user.id,
            username: user.username,
            globalName: user.global_name || user.username,
            email: user.email || 'Brak dostępu do e-maila',
            avatar: user.avatar ? `https://cdn.discordapp.com/avatars/${user.id}/${user.avatar}.png` : null,
            createdAt: new Date(user.id / 4194304 + 1420070400000).toLocaleDateString('en-US'), // Zmieniono na EN
            guildId: GUILD_ID,
            roles: userRoles
        };

        // 5. Kodujemy dane w Base64
        const encodedData = Buffer.from(JSON.stringify(profileData)).toString('base64');

        // 6. Przekierowujemy na panel.html
        return res.redirect(302, `${PANEL_URL}?data=${encodedData}`);

    } catch (error) {
        console.error('Błąd logowania Discord:', error.message);
        return res.redirect(302, `${LOGIN_URL}?error=auth_failed`);
    }
}
