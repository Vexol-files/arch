_G["_ArN_Session"] = "${sessionId}"
_G["_ArN_Token"] = "${runToken}"

local _req = syn and syn.request or http_request or request
local _gen_url = "https://projectarch.vercel.app/api/archnemesis/v2/loaders/generate_loader?token=${runToken}&sess=${sessionId}"
local _gen_code = _req({Url = _gen_url, Method = "GET"})

if not _gen_code or not _gen_code.Body or #_gen_code.Body < 50 then
    game.Players.LocalPlayer:Kick("Failed to download loader.")
    return
end

local _realLoadstring = loadstring
for k, v in pairs(_G) do
    if type(v) == "function" and debug.getinfo(v).what == "C" and k == "loadstring" then
        _realLoadstring = v
        break
    end
end
_realLoadstring(_gen_code.Body)()
