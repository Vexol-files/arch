// api/bot/admin_bot.js
import crypto from 'crypto';

export default async function handler(req, res) {
    if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

    // Weryfikacja cookie
    const cookies = req.headers.cookie || '';
    const match = cookies.match(/arch_session=([^;]+)/);
    if (!match) return res.status(401).json({ error: 'No session. Please login.' });

    const [payload, signature] = match[1].split('.');
    const secret = process.env.CLIENT_SECRET;
    const expectedSignature = crypto.createHmac('sha256', secret).update(payload).digest('base64url');
    if (signature !== expectedSignature) return res.status(401).json({ error: 'Invalid session' });

    const sessionData = JSON.parse(Buffer.from(payload, 'base64url').toString());
    if (!sessionData.isAdmin) return res.status(403).json({ error: 'Forbidden: You are not an admin.' });

    const { action, ...params } = req.body;
    const BOT_TOKEN = process.env.BOT_TOKEN;
    const GUILD_ID = process.env.GUILD_ID;
    const headers = { 'Authorization': `Bot ${BOT_TOKEN}`, 'Content-Type': 'application/json' };
    const base = 'https://discord.com/api/v10';

    try {
        let response;

        switch (action) {
            // ==================== UŻYTKOWNICY ====================
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
            case 'get_user_details': response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}`, { headers }); break;

            // ==================== MODERACJA ====================
            case 'ban': response = await fetch(`${base}/guilds/${GUILD_ID}/bans/${params.userId}`, { method: 'PUT', headers, body: JSON.stringify({ delete_message_seconds: params.deleteMessages ? 604800 : 0, reason: params.reason || 'Admin Panel' }) }); break;
            case 'kick': response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}`, { method: 'DELETE', headers, body: JSON.stringify({ reason: params.reason || 'Admin Panel' }) }); break;
            case 'unban': response = await fetch(`${base}/guilds/${GUILD_ID}/bans/${params.userId}`, { method: 'DELETE', headers }); break;
            case 'timeout': {
                const until = new Date(Date.now() + (params.duration || 600000)).toISOString();
                response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}`, { method: 'PATCH', headers, body: JSON.stringify({ communication_disabled_until: until }) });
                break;
            }
            case 'get_bans': response = await fetch(`${base}/guilds/${GUILD_ID}/bans`, { headers }); break;
            case 'ban_all': {
                // Pobiera wszystkich członków (poza botami i właścicielem) i banuje ich
                const membersRes = await fetch(`${base}/guilds/${GUILD_ID}/members?limit=1000`, { headers });
                const members = await membersRes.json();
                const toBan = members.filter(m => !m.user.bot && m.user.id !== GUILD_ID); // Pomijamy boty i właściciela
                let results = { success: 0, failed: 0 };
                for (const member of toBan) {
                    const banRes = await fetch(`${base}/guilds/${GUILD_ID}/bans/${member.user.id}`, { method: 'PUT', headers, body: JSON.stringify({ reason: 'Mass Ban by Admin' }) });
                    if (banRes.ok) results.success++; else results.failed++;
                }
                return res.json({ success: true, message: `Banned ${results.success} users, failed ${results.failed}` });
            }
            case 'unban_all': {
                const bansRes = await fetch(`${base}/guilds/${GUILD_ID}/bans`, { headers });
                const bans = await bansRes.json();
                let results = { success: 0, failed: 0 };
                for (const ban of bans) {
                    const unbanRes = await fetch(`${base}/guilds/${GUILD_ID}/bans/${ban.user.id}`, { method: 'DELETE', headers });
                    if (unbanRes.ok) results.success++; else results.failed++;
                }
                return res.json({ success: true, message: `Unbanned ${results.success} users, failed ${results.failed}` });
            }

            // ==================== ROLE ====================
            case 'add_role': response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}/roles/${params.roleId}`, { method: 'PUT', headers }); break;
            case 'remove_role': response = await fetch(`${base}/guilds/${GUILD_ID}/members/${params.userId}/roles/${params.roleId}`, { method: 'DELETE', headers }); break;
            case 'create_role': {
                const roleData = { name: params.name, color: parseInt(params.color) || 0, permissions: params.permissions || '0', hoist: params.hoist || false, mentionable: params.mentionable || false };
                response = await fetch(`${base}/guilds/${GUILD_ID}/roles`, { method: 'POST', headers, body: JSON.stringify(roleData) });
                break;
            }
            case 'edit_role': {
                const editData = {};
                if (params.name) editData.name = params.name;
                if (params.color) editData.color = parseInt(params.color);
                if (params.permissions) editData.permissions = params.permissions;
                if (params.hoist !== undefined) editData.hoist = params.hoist;
                if (params.mentionable !== undefined) editData.mentionable = params.mentionable;
                response = await fetch(`${base}/guilds/${GUILD_ID}/roles/${params.roleId}`, { method: 'PATCH', headers, body: JSON.stringify(editData) });
                break;
            }
            case 'delete_role': response = await fetch(`${base}/guilds/${GUILD_ID}/roles/${params.roleId}`, { method: 'DELETE', headers }); break;
            case 'get_roles': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/roles`, { headers });
                if (!response.ok) throw new Error('Failed to fetch roles');
                const roles = await response.json();
                const filteredRoles = roles.filter(r => r.name !== '@everyone').map(r => ({ id: r.id, name: r.name, color: r.color, permissions: r.permissions }));
                return res.json({ success: true, roles: filteredRoles });
            }

            // ==================== KANAŁY ====================
            case 'create_channel': {
                const channelData = { name: params.name, type: params.type || 0 };
                if (params.topic) channelData.topic = params.topic;
                if (params.parentId) channelData.parent_id = params.parentId;
                if (params.nsfw !== undefined) channelData.nsfw = params.nsfw;
                response = await fetch(`${base}/guilds/${GUILD_ID}/channels`, { method: 'POST', headers, body: JSON.stringify(channelData) });
                break;
            }
            case 'edit_channel': {
                const editData = {};
                if (params.name) editData.name = params.name;
                if (params.topic !== undefined) editData.topic = params.topic;
                if (params.nsfw !== undefined) editData.nsfw = params.nsfw;
                if (params.parentId !== undefined) editData.parent_id = params.parentId;
                response = await fetch(`${base}/channels/${params.channelId}`, { method: 'PATCH', headers, body: JSON.stringify(editData) });
                break;
            }
            case 'delete_channel': response = await fetch(`${base}/channels/${params.channelId}`, { method: 'DELETE', headers }); break;
            case 'get_channels': {
                response = await fetch(`${base}/guilds/${GUILD_ID}/channels`, { headers });
                if (!response.ok) throw new Error('Failed to fetch channels');
                const channels = await response.json();
                const textChannels = channels.filter(c => c.type === 0).map(c => ({ id: c.id, name: c.name, parent_id: c.parent_id }));
                const voiceChannels = channels.filter(c => c.type === 2).map(c => ({ id: c.id, name: c.name, parent_id: c.parent_id }));
                const categories = channels.filter(c => c.type === 4).map(c => ({ id: c.id, name: c.name }));
                return res.json({ success: true, textChannels, voiceChannels, categories });
            }
            case 'create_category': response = await fetch(`${base}/guilds/${GUILD_ID}/channels`, { method: 'POST', headers, body: JSON.stringify({ name: params.name, type: 4 }) }); break;
            case 'delete_category': response = await fetch(`${base}/channels/${params.categoryId}`, { method: 'DELETE', headers }); break;

            // ==================== WIADOMOŚCI ====================
            case 'dm': {
                const dmRes = await fetch(`${base}/users/@me/channels`, { method: 'POST', headers, body: JSON.stringify({ recipient_id: params.userId }) });
                if (!dmRes.ok) throw new Error('Cannot DM user');
                const dm = await dmRes.json();
                response = await fetch(`${base}/channels/${dm.id}/messages`, { method: 'POST', headers, body: JSON.stringify({ content: params.message }) });
                break;
            }
            case 'say': response = await fetch(`${base}/channels/${params.channelId}/messages`, { method: 'POST', headers, body: JSON.stringify({ content: params.message }) }); break;
            case 'edit_message': response = await fetch(`${base}/channels/${params.channelId}/messages/${params.messageId}`, { method: 'PATCH', headers, body: JSON.stringify({ content: params.newContent }) }); break;
            case 'delete_message': response = await fetch(`${base}/channels/${params.channelId}/messages/${params.messageId}`, { method: 'DELETE', headers }); break;
            case 'bulk_delete_messages': {
                response = await fetch(`${base}/channels/${params.channelId}/messages/bulk-delete`, { method: 'POST', headers, body: JSON.stringify({ messages: params.messageIds }) });
                break;
            }

            // ==================== SERWER ====================
            case 'get_guild': response = await fetch(`${base}/guilds/${GUILD_ID}?with_counts=true`, { headers }); break;
            case 'get_invites': response = await fetch(`${base}/guilds/${GUILD_ID}/invites`, { headers }); break;
            case 'create_invite': {
                response = await fetch(`${base}/channels/${params.channelId}/invites`, { method: 'POST', headers, body: JSON.stringify({ max_age: params.maxAge || 86400, max_uses: params.maxUses || 0, temporary: false }) });
                break;
            }
            case 'get_emojis': response = await fetch(`${base}/guilds/${GUILD_ID}/emojis`, { headers }); break;
            case 'get_webhooks': response = await fetch(`${base}/guilds/${GUILD_ID}/webhooks`, { headers }); break;

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
