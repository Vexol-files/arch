// api/bot/admin_bot.js
import crypto from 'crypto';

export default async function handler(req, res) {
    if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

    // 1. Weryfikacja ciasteczka
    const cookies = req.headers.cookie || '';
    const match = cookies.match(/arch_session=([^;]+)/);
    if (!match) return res.status(401).json({ error: 'No session. Please login.' });

    // 2. Weryfikacja podpisu
    const [payload, signature] = match[1].split('.');
    const secret = process.env.CLIENT_SECRET;
    const expectedSignature = crypto.createHmac('sha256', secret).update(payload).digest('base64url');

    if (signature !== expectedSignature) {
        return res.status(401).json({ error: 'Invalid session signature' });
    }

    // 3. Dekodowanie danych
    const sessionData = JSON.parse(Buffer.from(payload, 'base64url').toString());
    if (!sessionData.isAdmin) {
        return res.status(403).json({ error: 'Forbidden: You are not an admin.' });
    }

    // 4. Wykonywanie akcji
    const { action, ...params } = req.body;
    const BOT_TOKEN = process.env.BOT_TOKEN;
    const GUILD_ID = process.env.GUILD_ID;
    const headers = { 'Authorization': `Bot ${BOT_TOKEN}`, 'Content-Type': 'application/json' };
    const base = 'https://discord.com/api/v10';

    try {
        let response;

        switch (action) {
            // --- WYSZUKIWANIE I LISTY ---
            case 'search_users': {
                const membersRes = await fetch(`${base}/guilds/${GUILD_ID}/members?limit=1000`, { headers });
                const members = await membersRes.json();
                const query = params.query.toLowerCase();
                const results = members
                    .filter(m => m.user.username.toLowerCase().includes(query) || (m.nick && m.nick.toLowerCase().includes(query)))
                    .slice(0, 10)
                    .map(m => ({
                        id: m.user.id,
                        username: m.user.username,
                        displayName: m.nick || m.user.username,
                        avatar: m.user.avatar ? `https://cdn.discordapp.com/avatars/${m.user.id}/${m.user.avatar}.png` : null
                    }));
                return res.json({ success: true, users: results });
            }
            case 'get_channels': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/channels`, { headers });
                if (!response.ok) throw new Error('Failed to fetch channels');
                const channels = await response.json();
                const textChannels = channels.filter(c => c.type === 0).map(c => ({ id: c.id, name: c.name }));
                return res.json({ success: true, channels: textChannels });
            }
            case 'get_roles': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/roles`, { headers });
                if (!response.ok) throw new Error('Failed to fetch roles');
                const roles = await response.json();
                const filteredRoles = roles.filter(r => r.name !== '@everyone').map(r => ({ id: r.id, name: r.name }));
                return res.json({ success: true, roles: filteredRoles });
            }

            // --- MODERACJA ---
            case 'ban': response = await fetch(`${base}/guilds/${GUILD_ID}/bans/${params.userId}`, { method: 'PUT', headers, body: JSON.stringify({ reason: params.reason || 'Admin Panel' }) }); break;
            case 'kick': response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}`, { method: 'DELETE', headers, body: JSON.stringify({ reason: params.reason || 'Admin Panel' }) }); break;
            case 'unban': response = await fetch(`${base}/guilds/${GUILD_ID}/bans/${params.userId}`, { method: 'DELETE', headers }); break;
            case 'timeout': {
                const until = new Date(Date.now() + (params.duration || 600000)).toISOString();
                response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}`, { method: 'PATCH', headers, body: JSON.stringify({ communication_disabled_until: until }) });
                break;
            }

            // --- ROLE ---
            case 'add_role': response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}/roles/${params.roleId}`, { method: 'PUT', headers }); break;
            case 'remove_role': response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}/roles/${params.roleId}`, { method: 'DELETE', headers }); break;

            // --- WIADOMOŚCI ---
            case 'dm': {
                const dmRes = await fetch(`${base}/users/@me/channels`, { method: 'POST', headers, body: JSON.stringify({ recipient_id: params.userId }) });
                if (!dmRes.ok) throw new Error('Cannot DM user (closed DMs)');
                const dm = await dmRes.json();
                response = await fetch(`${base}/channels/${dm.id}/messages`, { method: 'POST', headers, body: JSON.stringify({ content: params.message }) });
                break;
            }
            case 'say': response = await fetch(`${base}/channels/${params.channelId}/messages`, { method: 'POST', headers, body: JSON.stringify({ content: params.message }) }); break;

            // --- KANAŁY ---
            case 'delete_channel': response = await fetch(`${base}/channels/${params.channelId}`, { method: 'DELETE', headers }); break;

            default: return res.status(400).json({ error: 'Unknown action' });
        }

        if (!response.ok) {
            const errorData = await response.json().catch(() => ({}));
            throw new Error(errorData.message || `Discord API Error: ${response.status}`);
        }
        
        let data = {};
        if (response.status !== 204) data = await response.json().catch(() => ({}));
        res.json({ success: true, data });

    } catch (error) {
        console.error(`[Admin Error] ${action}:`, error.message);
        res.status(500).json({ error: error.message });
    }
}
