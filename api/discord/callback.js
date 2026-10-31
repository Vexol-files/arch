// api/discord/callback.js

export default async function handler(req, res) {
    const { code } = req.query;
    if (!code) return res.status(400).send('Brak kodu autoryzacji.');

    const CLIENT_ID = process.env.CLIENT_ID;
    const CLIENT_SECRET = process.env.CLIENT_SECRET;
    const BOT_TOKEN = process.env.BOT_TOKEN;
    const GUILD_ID = process.env.GUILD_ID;
    const ADMIN_ROLE = process.env.ADMIN_ROLE; // <-- Zmienione na ADMIN_ROLE
    const REDIRECT_URI = 'https://projectarch.vercel.app/api/discord/callback';
    const PANEL_URL = 'https://projectarch.vercel.app/panel.html';
    const LOGIN_URL = 'https://projectarch.vercel.app/login.html';

    try {
        // 1. Wymieniamy kod na token dostępu
        const tokenRes = await fetch('https://discord.com/api/oauth2/token', {
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
        if (!tokenRes.ok) throw new Error('Token exchange failed');
        const tokenData = await tokenRes.json();

        // 2. Pobieramy dane użytkownika
        const userRes = await fetch('https://discord.com/api/users/@me', {
            headers: { Authorization: `Bearer ${tokenData.access_token}` }
        });
        if (!userRes.ok) throw new Error('User fetch failed');
        const user = await userRes.json();

        // 3. Pobieramy role użytkownika
        let userRoles = [];
        let isAdmin = false;
        try {
            const memberRes = await fetch(`https://discord.com/api/guilds/${GUILD_ID}/members/${user.id}`, {
                headers: { Authorization: `Bot ${BOT_TOKEN}` }
            });
            if (memberRes.ok) {
                const member = await memberRes.json();
                const rolesRes = await fetch(`https://discord.com/api/guilds/${GUILD_ID}/roles`, {
                    headers: { Authorization: `Bot ${BOT_TOKEN}` }
                });
                const allRoles = await rolesRes.json();
                userRoles = allRoles
                    .filter(r => member.roles.includes(r.id) && r.name !== '@everyone')
                    .sort((a, b) => b.position - a.position)
                    .map(r => ({ id: r.id, name: r.name, color: r.color }));
                
                // Sprawdzamy, czy użytkownik ma rolę ADMIN_ROLE (po ID)
                isAdmin = userRoles.some(r => r.id === ADMIN_ROLE);
            }
        } catch (e) {
            console.error('Role error:', e);
        }

        // 4. Przygotowanie danych do cookie (userId + isAdmin)
        const sessionData = {
            userId: user.id,
            isAdmin: isAdmin
        };
        
        // Podpisujemy cookie za pomocą wbudowanego crypto i CLIENT_SECRET
        const crypto = await import('crypto');
        const secret = process.env.CLIENT_SECRET;
        
        const payload = Buffer.from(JSON.stringify(sessionData)).toString('base64url');
        const signature = crypto.createHmac('sha256', secret).update(payload).digest('base64url');
        const cookieValue = `${payload}.${signature}`;

        // 5. Ustawiamy bezpieczne ciasteczko
        res.setHeader('Set-Cookie', `arch_session=${cookieValue}; HttpOnly; Secure; SameSite=Lax; Path=/; Max-Age=7200`);

        // 6. Przekierowujemy na panel.html z danymi profilu
        const profileData = {
            id: user.id,
            globalName: user.global_name || user.username,
            email: user.email,
            avatar: user.avatar ? `https://cdn.discordapp.com/avatars/${user.id}/${user.avatar}.png` : null,
            createdAt: new Date(user.id / 4194304 + 1420070400000).toLocaleDateString('en-US'),
            guildId: GUILD_ID,
            roles: userRoles,
            isAdmin: isAdmin
        };
        const encodedData = Buffer.from(JSON.stringify(profileData)).toString('base64');
        
        return res.redirect(302, `${PANEL_URL}?data=${encodedData}`);

    } catch (error) {
        console.error('Login error:', error);
        return res.redirect(302, `${LOGIN_URL}?error=auth_failed`);
    }
}
