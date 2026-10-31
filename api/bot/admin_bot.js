// api/bot/admin_bot.js

export default async function handler(req, res) {
    // 1. Weryfikacja metody
    if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

    // 2. Weryfikacja klucza API (zabezpieczenie przed niepowołanym dostępem)
    if (req.headers['x-api-key'] !== process.env.ADMIN_API_KEY) {
        return res.status(401).json({ error: 'Unauthorized: Invalid API Key' });
    }

    const { action, ...params } = req.body;
    const BOT_TOKEN = process.env.BOT_TOKEN;
    const GUILD_ID = process.env.GUILD_ID;
    const headers = { 'Authorization': `Bot ${BOT_TOKEN}`, 'Content-Type': 'application/json' };
    const base = 'https://discord.com/api/v10';

    try {
        let response;

        switch (action) {
            // --- UŻYTKOWNICY I MODERACJA ---
            case 'find_user': {
                // Discord API nie ma bezpośredniego wyszukiwania po nazwie, więc pobieramy listę i filtrujemy
                const membersRes = await fetch(`${base}/guilds/${GUILD_ID}/members?limit=1000`, { headers });
                const members = await membersRes.json();
                const found = members.find(m => m.user.id === params.query || m.user.username.toLowerCase().includes(params.query.toLowerCase()) || (m.nick && m.nick.toLowerCase().includes(params.query.toLowerCase())));
                if (!found) return res.status(404).json({ error: 'User not found on server' });
                return res.json({ success: true, user: found });
            }
            case 'ban': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/bans/${params.userId}`, { method: 'PUT', headers, body: JSON.stringify({ delete_message_seconds: 0, reason: params.reason || 'Banned via Admin Panel' }) });
                break;
            }
            case 'kick': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}`, { method: 'DELETE', headers, body: JSON.stringify({ reason: params.reason || 'Kicked via Admin Panel' }) });
                break;
            }
            case 'timeout': {
                const durationMs = params.duration || 600000; // Domyślnie 10 minut
                const until = new Date(Date.now() + durationMs).toISOString();
                response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}`, { method: 'PATCH', headers, body: JSON.stringify({ communication_disabled_until: until }) });
                break;
            }

            // --- ZARZĄDZANIE ROLAMI ---
            case 'add_role': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}/roles/${params.roleId}`, { method: 'PUT', headers });
                break;
            }
            case 'remove_role': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}/roles/${params.roleId}`, { method: 'DELETE', headers });
                break;
            }
            case 'create_role': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/roles`, { method: 'POST', headers, body: JSON.stringify({ name: params.name, color: params.color || 0, permissions: '0' }) });
                break;
            }
            case 'delete_role': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/roles/${params.roleId}`, { method: 'DELETE', headers });
                break;
            }

            // --- WIADOMOŚCI ---
            case 'dm': {
                // Najpierw tworzymy kanał DM, potem wysyłamy wiadomość
                const dmRes = await fetch(`${base}/users/@me/channels`, { method: 'POST', headers, body: JSON.stringify({ recipient_id: params.userId }) });
                if (!dmRes.ok) throw new Error('User has DMs closed or invalid ID');
                const dmChannel = await dmRes.json();
                response = await fetch(`${base}/channels/${dmChannel.id}/messages`, { method: 'POST', headers, body: JSON.stringify({ content: params.message }) });
                break;
            }
            case 'say': {
                response = await fetch(`${base}/channels/${params.channelId}/messages`, { method: 'POST', headers, body: JSON.stringify({ content: params.message }) });
                break;
            }
            case 'edit_message': {
                response = await fetch(`${base}/channels/${params.channelId}/messages/${params.messageId}`, { method: 'PATCH', headers, body: JSON.stringify({ content: params.newContent }) });
                break;
            }
            case 'delete_message': {
                response = await fetch(`${base}/channels/${params.channelId}/messages/${params.messageId}`, { method: 'DELETE', headers });
                break;
            }

            // --- ZARZĄDZANIE KANAŁAMI ---
            case 'create_channel': {
                // type: 0 = text, 2 = voice, 4 = category
                response = await fetch(`${base}/guilds/${GUILD_ID}/channels`, { method: 'POST', headers, body: JSON.stringify({ name: params.name, type: params.type || 0, topic: params.topic || '', parent_id: params.parentId || null }) });
                break;
            }
            case 'delete_channel': {
                response = await fetch(`${base}/channels/${params.channelId}`, { method: 'DELETE', headers });
                break;
            }
            case 'edit_channel': {
                response = await fetch(`${base}/channels/${params.channelId}`, { method: 'PATCH', headers, body: JSON.stringify({ name: params.name, topic: params.topic }) });
                break;
            }

            // --- INFORMACJE O SERWERZE ---
            case 'get_guild': {
                response = await fetch(`${base}/guilds/${GUILD_ID}?with_counts=true`, { headers });
                break;
            }
            case 'get_roles': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/roles`, { headers });
                break;
            }
            case 'get_channels': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/channels`, { headers });
                break;
            }
            case 'get_bans': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/bans`, { headers });
                break;
            }
            case 'unban': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/bans/${params.userId}`, { method: 'DELETE', headers });
                break;
            }

            default:
                return res.status(400).json({ error: 'Unknown action' });
        }

        // Obsługa odpowiedzi
        if (!response.ok) {
            const errorData = await response.json().catch(() => ({}));
            throw new Error(errorData.message || `Discord API Error: ${response.status}`);
        }

        let data = {};
        if (response.status !== 204) {
            data = await response.json().catch(() => ({}));
        }
        res.json({ success: true, data });

    } catch (error) {
        console.error(`[Admin Bot Error] Action: ${action} | Message:`, error.message);
        res.status(500).json({ error: error.message });
    }
}
