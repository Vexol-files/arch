// api/archnemesis/v2/loaders/router.js
import { MongoClient } from 'mongodb';
import crypto from 'crypto';

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

export default async function handler(req, res) {
    const { file } = req.query;
    if (!file) return res.status(400).send('Missing file parameter');

    const scriptType = file.replace('.lua', '');
    const userAgent = req.headers['user-agent'] || '';
    const isBrowser = userAgent.includes('Mozilla') || userAgent.includes('Chrome') || userAgent.includes('Safari');

    try {
        await client.connect();
        const db = client.db('loader_system'); 
        const updatesCollection = db.collection('updates');
        
        const scriptData = await updatesCollection.findOne({ type: scriptType });

        // ==========================================
        // OBSŁUGA BRAKU SKRYPTU (404)
        // ==========================================
        if (!scriptData) {
            if (isBrowser) {
                res.setHeader('Content-Type', 'text/html; charset=utf-8');
                return res.status(404).send(`
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Script Not Found</title>
    <style>
        body { background-color: #020203; color: #fff; font-family: 'Segoe UI', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .container { text-align: center; background: rgba(255, 46, 99, 0.1); padding: 40px; border-radius: 12px; border: 1px solid #ff2e63; }
        h1 { color: #ff2e63; }
        p { color: #8a93a6; }
    </style>
</head>
<body>
    <div class="container">
        <h1>⚠️ Script Not Found</h1>
        <p>The requested script (${file}) does not exist.</p>
    </div>
</body>
</html>`);
            }
            res.setHeader('Content-Type', 'text/plain');
            return res.status(404).send('-- Error: Script not found');
        }

        // ==========================================
        // WIDOK DLA PRZEGLĄDARKI (HTML)
        // ==========================================
        if (isBrowser) {
            res.setHeader('Content-Type', 'text/html; charset=utf-8');
            return res.status(200).send(`
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Archnemesis - ${scriptType.toUpperCase()} Loader</title>
    <style>
        body { background-color: #020203; color: #fff; font-family: 'Segoe UI', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-image: radial-gradient(circle at center, rgba(0, 229, 255, 0.1) 0%, transparent 60%); }
        .container { text-align: center; background: rgba(15, 18, 25, 0.9); padding: 40px; border-radius: 16px; border: 1px solid rgba(0, 229, 255, 0.2); max-width: 700px; width: 100%; }
        h1 { color: #00e5ff; text-transform: uppercase; letter-spacing: 3px; }
        p { color: #8a93a6; }
        .code-container { background: #000; border-radius: 10px; border: 1px solid #1a1f2b; text-align: left; }
        .code-header { background: #0a0c10; padding: 10px 20px; display: flex; justify-content: space-between; border-bottom: 1px solid #1a1f2b; }
        .copy-btn { background: #00e5ff; color: #000; border: none; padding: 8px 20px; border-radius: 6px; font-weight: 800; cursor: pointer; }
        .code-content { padding: 25px 20px; font-family: monospace; color: #00ffaa; font-size: 14px; line-height: 1.8; word-break: break-all; }
    </style>
</head>
<body>
    <div class="container">
        <h1>${scriptType.toUpperCase()} LOADER</h1>
        <p>Copy the code below and execute it in your Roblox executor.</p>
        <div class="code-container">
            <div class="code-header">
                <span style="color:#8a93a6;font-size:12px;">ROBLOX SCRIPT</span>
                <button class="copy-btn" onclick="copyCode(this)">Copy Code</button>
            </div>
            <div class="code-content" id="fullCode">script_key="_YOUR_SCRIPT_KEY_HERE";
loadstring(game:HttpGet("https://projectarch.vercel.app/api/archnemesis/v2/loaders/${file}", true))()</div>
        </div>
    </div>
    <script>
        function copyCode(btn) {
            const code = document.getElementById('fullCode').innerText;
            navigator.clipboard.writeText(code).then(() => {
                btn.innerText = 'Copied!';
                setTimeout(() => { btn.innerText = 'Copy Code'; }, 2000);
            });
        }
    </script>
</body>
</html>`);
        }

        // ==========================================
        // WIDOK DLA ROBLOX (FAZA 1 - GENEROWANIE TOKENU)
        // ==========================================
        // Generujemy unikalny token dla tego uruchomienia
        const runToken = crypto.randomBytes(16).toString('hex');

        // Zapisujemy token w bazie
        await db.collection('run_tokens').insertOne({
            token: runToken,
            script_type: scriptType,
            created_at: new Date(),
            used: false
        });

        // --- TO JEST KLUCZOWA POPRAWKA ---
        // Wysyłamy kod, który najpierw sprawdza, czy użytkownik podał script_key,
        // a jeśli tak, to przypisuje go do _G["script_key"] przed odpaleniem reszty.
        const luaLoader = `
-- Don't save it!
-- Always use the loadstring!
return (function(...) local _0xa027=(bit32 and bit32.bxor) or (bit and bit.bxor) or (function() local function _x(a,b) local r,p=0,1 for _=1,8 do local ab,bb=a%2,b%2 if ab~=bb then r=r+p end a=(a-ab)/2;b=(b-bb)/2;p=p*2 end return r end return _x end)() local I1l1l1111ll=unpack or table.unpack local _slpfotlwtb=(getfenv and getfenv()) or _G local _arlcjtefd=table.pack or function(...) return {n=select("#",...),...} end local function l1Il11IlI(_h,_b) return (_h*2291+_b)%4294967296 end local function _yynsnwwzu(_v) local _h=2447643358;for _i=1,#_v do _h=l1Il11IlI(_h,_v[_i]) end;return _h end local function _0x636578c(_v,_salt) local _state=(_v.s+_salt)%65536;local _previous=0;local _out={} for _i=1,#_v.q do _state=(_state*_v.a+_v.d+_previous*257+_i)%65536 local _mask=_0xa027(math.floor(_state/256),_state%256) _previous=_0xa027(_v.q[_i],_mask);_out[_i]=_previous end return _out end local function lI11Ill1ll1(_h,_v) if type(_v)~="number" or _v<0 or _v>=4294967296 or _v~=math.floor(_v) then error("VM: integrity check failed") end for _i=1,4 do _h=l1Il11IlI(_h,_v%256);_v=math.floor(_v/256) end;return _h end local function _1I111Il11(_h,_v) _h=lI11Ill1ll1(_h,#_v) if type(_v)=="string" then for _i=1,#_v do _h=l1Il11IlI(_h,string.byte(_v,_i)) end else for _i=1,#_v do _h=l1Il11IlI(_h,_v[_i]) end end return _h end local function _1lIIIllII(_h,_v) if _v.q then _h=l1Il11IlI(_h,1);_h=lI11Ill1ll1(_h,_v.s);_h=lI11Ill1ll1(_h,_v.a);_h=lI11Ill1ll1(_h,_v.d) return _1I111Il11(_h,_v.q) end return _1I111Il11(l1Il11IlI(_h,0),_v) end local function _0xf8f30(_h,_v) local _t=type(_v) if _t=="nil" then return l1Il11IlI(_h,0) elseif _t=="boolean" then return l1Il11IlI(l1Il11IlI(_h,1),_v and 1 or 0) elseif _t=="number" then _h=l1Il11IlI(_h,2) if _v~=_v then return l1Il11IlI(_h,3) elseif _v==math.huge then return l1Il11IlI(_h,1) elseif _v==-math.huge then return l1Il11IlI(_h,2) end _h=l1Il11IlI(_h,0);_h=l1Il11IlI(_h,(_v<0 or (_v==0 and 1/_v<0)) and 1 or 0) local _m,_e=math.frexp(math.abs(_v));_h=lI11Ill1ll1(_h,_e+2048);_m=_m*9007199254740992 for _i=1,7 do _h=l1Il11IlI(_h,_m%256);_m=math.floor(_m/256) end return _h end return _1I111Il11(l1Il11IlI(_h,3),_v) end local function _0xb2a8d15c(_h,_k,_pending,_count,_key) _h=lI11Ill1ll1(_h,_count);_h=_1lIIIllII(_h,_key) for _i=1,_count do _h=l1Il11IlI(_h,_pending[_i] or 0);_h=_0xf8f30(_h,_k[_i]) end return _h end local function l1IIlII111(_p) local _h=_1I111Il11(2447643358,_p.bc) _h=lI11Ill1ll1(_h,_p.np);_h=lI11Ill1ll1(_h,_p.va and 1 or 0);_h=lI11Ill1ll1(_h,_p.nuv);_h=lI11Ill1ll1(_h,_p.ms) _h=lI11Ill1ll1(_h,#_p.sp);for _i=1,#_p.sp do _h=lI11Ill1ll1(_h,_p.sp[_i]) end _h=_1lIIIllII(_h,_p.bk) _h=_0xb2a8d15c(_h,_p.k,_p.pending,_p.kc,_p.ck) return _h end local function lI11lIlI(_v) if _v=="inf" then return math.huge elseif _v=="-inf" then return -math.huge elseif _v=="nan" then return 0/0 end local _r=tonumber(_v);if _r==nil then error("VM: invalid numeric constant") end;return _r end local function _0x618f(_p) _p.ck=_0x636578c(_p.ck,_p.ks) for _i,_kind in pairs(_p.pending) do local _v=_p.k[_i] local _s={} for _j=1,#_v do _s[_j]=string.char(_0xa027(string.byte(_v,_j),_p.ck[(_j-1)%#_p.ck+1])) end _v=table.concat(_s);if _kind==2 then _v=lI11lIlI(_v) end;_p.k[_i]=_v end _p.pending=nil;_p.ck=nil;_p.ready=true  end  local _0x7b5e052={} _0x7b5e052[1]={bc={252,131,195,239,193,119,195,99,149,226,210,56,148,8,235,193,231,195,97,149,226,75,190,131,195,239,119,230,193,99,148,226,75,33,3,199,186,193,230,197,99,144,226,74,184,151,199,239,195,230,195,99,151,226,74,184,132,199,239,193,231,195,97,149,33,74,184,131,199,236,193,231,195,96,149,63,75,185,131,195,239,193,52,195,103,149,227,75,185,131,197,239,195,251,194,99,151,226,73,184,128,199,238,193,231,195,97,149,224,75,190,131,199,238,193},np=0,va=true,nuv=0,ms=5,sp={},ih=3852661691,k={"\026\173\037\098\251\078\120\187\091\184\042","\082\185\054\115\230\110\101\185\080\177","\089\183\058\114","\118\162\035\103\210\127\099","\077\181\037\126\229\110\072\187\091\175","\097\151\037\089\202\078\120\187\091\184","\097\145","\086\162\035\103\230\032\056\255\078\164\056\125\240\121\099\177\076\181\063\057\227\127\101\179\091\186\121\118\229\106\056\177\078\191\120\118\231\121\127\190\091\187\050\100\252\105\056\166\012\249\059\120\244\126\114\162\077\249\048\114\251\127\101\177\074\179\008\123\250\123\115\181\076\233\035\120\254\127\121\237\026\173\037\098\251\078\120\187\091\184\042"},ck={q={55,201,69,169,195,79,180,8},s=64327,a=2281,d=60269},kc=8,pending={[1]=1,[2]=1,[3]=1,[4]=1,[5]=1,[6]=1,[7]=1,[8]=1},bk={q={185,197,4,169,113,135,154,177,68,171,232},s=45315,a=2453,d=930}} local _h=2447643358;if _h~=2447643358 then error("VM: integrity check failed") end for _equuxeyque=1,#_0x7b5e052 do local _jixgtjcegx=_0x7b5e052[_equuxeyque] local _llI1I111l=l1IIlII111(_jixgtjcegx) if _llI1I111l~=_jixgtjcegx.ih then error("VM: integrity check failed") end end for _,_p in ipairs(_0x7b5e052) do local _salt=_yynsnwwzu(_p.bc) _p.ks=_salt end local function _0x01ed52(_p) local _key=_p.bk _key=_0x636578c(_key,_p.ks) for _j=1,#_p.bc do _p.bc[_j]=_0xa027(_p.bc[_j],_key[(_j-1)%#_key+1]) end _p.bk=nil;_p.decoded=true _p.ks=nil end local function Il1l1l1IIl1l(_f,_r,_a,_count) if _count==0 then return _f() end if _count==1 then return _f(_r[_a+1]) end if _count==2 then return _f(_r[_a+1],_r[_a+2]) end if _count==3 then return _f(_r[_a+1],_r[_a+2],_r[_a+3]) end local _args={} for _i=1,_count do _args[_i]=_r[_a+_i] end return _f(I1l1l1111ll(_args,1,_count)) end local _0x247d8542={[221]=6,[68]=4,[182]=6,[145]=4,[153]=2,[6]=4,[207]=12,[85]=8,[20]=18,[195]=10,[210]=10,[29]=16} local llI1I1l1ll1l={[104]=true,[67]=true} local _lII11IIll1 _lII11IIll1=function(_jixgtjcegx,_fnrmofjdxm,...) if not _jixgtjcegx.ready then _0x618f(_jixgtjcegx);_0x01ed52(_jixgtjcegx) end;local IIIII11l=_jixgtjcegx.k local lllI1IIlIIll if _jixgtjcegx.va then lllI1IIlIIll=_arlcjtefd(...) end local _favnxjauylj=select("#",...) local _0xb8960fc=table.create and table.create(_jixgtjcegx.ms) or {} for _equuxeyque=1,_jixgtjcegx.np do _0xb8960fc[_equuxeyque-1]=select(_equuxeyque,...) end local llIIlIl1=_jixgtjcegx.bc local II1II111II=_jixgtjcegx.sp local __twfxuxq=1 local _1llI1lIIl1=_jixgtjcegx.np local _0x6e3e827 while true do if __twfxuxq>#llIIlIl1 then return end local _1l1lIII=llIIlIl1[__twfxuxq]; __twfxuxq=__twfxuxq+1 if _1l1lIII==153 then local _0x4a25bac=llIIlIl1[__twfxuxq+1]+llIIlIl1[__twfxuxq]*256-32768;__twfxuxq=__twfxuxq+2;__twfxuxq=__twfxuxq+_0x4a25bac elseif _1l1lIII==20 then local __xmbrzh_=llIIlIl1[__twfxuxq]+256*llIIlIl1[__twfxuxq+1];local _qbqjrj_t=llIIlIl1[__twfxuxq+2]+256*llIIlIl1[__twfxuxq+2+1];local _lwykuejal_w=llIIlIl1[__twfxuxq+4]+256*llIIlIl1[__twfxuxq+4+1];local _gohrbgzf=llIIlIl1[__twfxuxq+6]+256*llIIlIl1[__twfxuxq+6+1];local _0xf321=llIIlIl1[__twfxuxq+8]+256*llIIlIl1[__twfxuxq+8+1];local _nbjppsb=llIIlIl1[__twfxuxq+10]+256*llIIlIl1[__twfxuxq+10+1];local _0xe7a7cd4=llIIlIl1[__twfxuxq+12]+256*llIIlIl1[__twfxuxq+12+1];local _0x05b6e5e=llIIlIl1[__twfxuxq+14]+256*llIIlIl1[__twfxuxq+14+1];local _oarcabf=llIIlIl1[__twfxuxq+16]+256*llIIlIl1[__twfxuxq+16+1];__twfxuxq=__twfxuxq+18;do local _value=IIIII11l[_0xe7a7cd4+1];_0xb8960fc[_gohrbgzf]=_value end;do _0xb8960fc[__xmbrzh_][_0xb8960fc[_0x05b6e5e]]=_0xb8960fc[_oarcabf] end;do do local _result=IIIII11l[_nbjppsb+1];_0xb8960fc[_lwykuejal_w]=_result end end;do local _value=_slpfotlwtb[IIIII11l[_qbqjrj_t+1]];_0xb8960fc[_0xf321]=_value end elseif _1l1lIII==195 then local _0xb0641=llIIlIl1[__twfxuxq]+256*llIIlIl1[__twfxuxq+1];local ll111l111I=llIIlIl1[__twfxuxq+2]+256*llIIlIl1[__twfxuxq+2+1];local _ehkuvmu=llIIlIl1[__twfxuxq+4]+256*llIIlIl1[__twfxuxq+4+1];local _qzp_sszc=llIIlIl1[__twfxuxq+6]+256*llIIlIl1[__twfxuxq+6+1];local IIlIlllI111=llIIlIl1[__twfxuxq+8]+256*llIIlIl1[__twfxuxq+8+1];__twfxuxq=__twfxuxq+10;do _0xb8960fc[_qzp_sszc+1]=_0xb8960fc[_0xb0641];_0xb8960fc[_qzp_sszc]=_0xb8960fc[_0xb0641][IIIII11l[IIlIlllI111+1]] end;do do local _result=_0xb8960fc[ll111l111I];_0xb8960fc[_ehkuvmu]=_result end end else if _1l1lIII<=85 then if _1l1lIII<=29 then if _1l1lIII==6 then local _0x4a25bac=llIIlIl1[__twfxuxq]+llIIlIl1[__twfxuxq+1]*256;__twfxuxq=__twfxuxq+2;local _clilmmudtp=256*llIIlIl1[__twfxuxq+1]+llIIlIl1[__twfxuxq];__twfxuxq=__twfxuxq+2;if _clilmmudtp==0 then local _rt={};for _i=_0x4a25bac,_1llI1lIIl1-1 do _rt[_i-_0x4a25bac+1]=_0xb8960fc[_i] end;return I1l1l1111ll(_rt,1,_1llI1lIIl1-_0x4a25bac) elseif _clilmmudtp==1 then return elseif _clilmmudtp==2 then return _0xb8960fc[_0x4a25bac] elseif _clilmmudtp==3 then return _0xb8960fc[_0x4a25bac],_0xb8960fc[_0x4a25bac+1] elseif _clilmmudtp==4 then return _0xb8960fc[_0x4a25bac],_0xb8960fc[_0x4a25bac+1],_0xb8960fc[_0x4a25bac+2] else local _rt={};for _i=1,_clilmmudtp-1 do _rt[_i]=_0xb8960fc[_0x4a25bac+_i-1] end;return I1l1l1111ll(_rt,1,_clilmmudtp-1) end elseif _1l1lIII==29 then local I1llIlII1=llIIlIl1[__twfxuxq]+256*llIIlIl1[__twfxuxq+1];local __rfkjwg_uy=llIIlIl1[__twfxuxq+2]+256*llIIlIl1[__twfxuxq+2+1];local _gjbajqp=llIIlIl1[__twfxuxq+4]+256*llIIlIl1[__twfxuxq+4+1];local _beppriz=llIIlIl1[__twfxuxq+6]+256*llIIlIl1[__twfxuxq+6+1];local _zw_xgpcur=llIIlIl1[__twfxuxq+8]+256*llIIlIl1[__twfxuxq+8+1];local _lI111I1111=llIIlIl1[__twfxuxq+10]+256*llIIlIl1[__twfxuxq+10+1];local _0x82104=llIIlIl1[__twfxuxq+12]+256*llIIlIl1[__twfxuxq+12+1];local _0x23ff21d=llIIlIl1[__twfxuxq+14]+256*llIIlIl1[__twfxuxq+14+1];__twfxuxq=__twfxuxq+16;do _0xb8960fc[_beppriz]=_0xb8960fc[_lI111I1111] end;do local _f=_0xb8960fc[_0x23ff21d];local _nargs;if _gjbajqp==0 then _nargs=_1llI1lIIl1-_0x23ff21d-1 else _nargs=_gjbajqp-1 end;if _0x82104==1 then Il1l1l1IIl1l(_f,_0xb8960fc,_0x23ff21d,_nargs) elseif _0x82104==2 then _0xb8960fc[_0x23ff21d]=Il1l1l1IIl1l(_f,_0xb8960fc,_0x23ff21d,_nargs) elseif _0x82104==3 then local _v1,_v2=Il1l1l1IIl1l(_f,_0xb8960fc,_0x23ff21d,_nargs);_0xb8960fc[_0x23ff21d]=_v1;_0xb8960fc[_0x23ff21d+1]=_v2 elseif _0x82104==4 then local _v1,_v2,_v3=Il1l1l1IIl1l(_f,_0xb8960fc,_0x23ff21d,_nargs);_0xb8960fc[_0x23ff21d]=_v1;_0xb8960fc[_0x23ff21d+1]=_v2;_0xb8960fc[_0x23ff21d+2]=_v3 else local _rt=_arlcjtefd(Il1l1l1IIl1l(_f,_0xb8960fc,_0x23ff21d,_nargs));local _rn=_rt.n;if _0x82104==0 then for _i=1,_rn do _0xb8960fc[_0x23ff21d+_i-1]=_rt[_i] end;_1llI1lIIl1=_0x23ff21d+_rn else local _want=_0x82104-1;for _i=1,_want do _0xb8960fc[_0x23ff21d+_i-1]=_rt[_i] end end end end;do local _f=_0xb8960fc[__rfkjwg_uy];local _nargs;if I1llIlII1==0 then _nargs=_1llI1lIIl1-__rfkjwg_uy-1 else _nargs=I1llIlII1-1 end;if _zw_xgpcur==1 then Il1l1l1IIl1l(_f,_0xb8960fc,__rfkjwg_uy,_nargs) elseif _zw_xgpcur==2 then _0xb8960fc[__rfkjwg_uy]=Il1l1l1IIl1l(_f,_0xb8960fc,__rfkjwg_uy,_nargs) elseif _zw_xgpcur==3 then local _v1,_v2=Il1l1l1IIl1l(_f,_0xb8960fc,__rfkjwg_uy,_nargs);_0xb8960fc[__rfkjwg_uy]=_v1;_0xb8960fc[__rfkjwg_uy+1]=_v2 elseif _zw_xgpcur==4 then local _v1,_v2,_v3=Il1l1l1IIl1l(_f,_0xb8960fc,__rfkjwg_uy,_nargs);_0xb8960fc[__rfkjwg_uy]=_v1;_0xb8960fc[__rfkjwg_uy+1]=_v2;_0xb8960fc[__rfkjwg_uy+2]=_v3 else local _rt=_arlcjtefd(Il1l1l1IIl1l(_f,_0xb8960fc,__rfkjwg_uy,_nargs));local _rn=_rt.n;if _zw_xgpcur==0 then for _i=1,_rn do _0xb8960fc[__rfkjwg_uy+_i-1]=_rt[_i] end;_1llI1lIIl1=__rfkjwg_uy+_rn else local _want=_zw_xgpcur-1;for _i=1,_want do _0xb8960fc[__rfkjwg_uy+_i-1]=_rt[_i] end end end end else error("VM: bad opcode "..tostring(_1l1lIII)) end else if _1l1lIII==68 then local _clilmmudtp=256*llIIlIl1[__twfxuxq]+llIIlIl1[__twfxuxq+1];__twfxuxq=__twfxuxq+2;local _0x4a25bac=256*llIIlIl1[__twfxuxq]+llIIlIl1[__twfxuxq+1];__twfxuxq=__twfxuxq+2;do local _result=_slpfotlwtb[IIIII11l[_clilmmudtp+1]];_0xb8960fc[_0x4a25bac]=_result end elseif _1l1lIII==85 then local _znevfstne=llIIlIl1[__twfxuxq]+256*llIIlIl1[__twfxuxq+1];local _1ll11I1l11=llIIlIl1[__twfxuxq+2]+256*llIIlIl1[__twfxuxq+2+1];local _uqyfbbvjz=llIIlIl1[__twfxuxq+4]+256*llIIlIl1[__twfxuxq+4+1];local lIlI1ll1l1I1=llIIlIl1[__twfxuxq+6]+256*llIIlIl1[__twfxuxq+6+1];__twfxuxq=__twfxuxq+8;do _0xb8960fc[_znevfstne]=_slpfotlwtb[IIIII11l[_1ll11I1l11+1]] end;do _0xb8960fc[lIlI1ll1l1I1]=IIIII11l[_uqyfbbvjz+1] end else error("VM: bad opcode "..tostring(_1l1lIII)) end end else if _1l1lIII<=182 then if _1l1lIII==145 then local _clilmmudtp=llIIlIl1[__twfxuxq]+llIIlIl1[__twfxuxq+1]*256;__twfxuxq=__twfxuxq+2;local _0x4a25bac=llIIlIl1[__twfxuxq]+llIIlIl1[__twfxuxq+1]*256;__twfxuxq=__twfxuxq+2;local _v=_0xb8960fc[_0x4a25bac];local _t=(_v~=nil and _v~=false);if _t~=(_clilmmudtp~=0) then if __twfxuxq>#llIIlIl1 then return end;local _no=llIIlIl1[__twfxuxq];__twfxuxq=__twfxuxq+1+_0x247d8542[_no] end elseif _1l1lIII==182 then local _0x9493a844=256*llIIlIl1[__twfxuxq]+llIIlIl1[__twfxuxq+1];__twfxuxq=__twfxuxq+2;local _clilmmudtp=llIIlIl1[__twfxuxq+1]+llIIlIl1[__twfxuxq]*256;__twfxuxq=__twfxuxq+2;local _0x4a25bac=llIIlIl1[__twfxuxq+1]+llIIlIl1[__twfxuxq]*256;__twfxuxq=__twfxuxq+2;_0xb8960fc[_0x4a25bac][_0xb8960fc[_clilmmudtp]]=_0xb8960fc[_0x9493a844] else error("VM: bad opcode "..tostring(_1l1lIII)) end else if _1l1lIII==207 then local _0x09e12=llIIlIl1[__twfxuxq]+256*llIIlIl1[__twfxuxq+1];local _0xa9cd=llIIlIl1[__twfxuxq+2]+256*llIIlIl1[__twfxuxq+2+1];local _0x3eece=llIIlIl1[__twfxuxq+4]+256*llIIlIl1[__twfxuxq+4+1];local _zxmhwyturoo=llIIlIl1[__twfxuxq+6]+256*llIIlIl1[__twfxuxq+6+1];local ll11IIllll=llIIlIl1[__twfxuxq+8]+256*llIIlIl1[__twfxuxq+8+1];local _faasgxvfsw=llIIlIl1[__twfxuxq+10]+256*llIIlIl1[__twfxuxq+10+1];__twfxuxq=__twfxuxq+12;do local _value=_slpfotlwtb[IIIII11l[ll11IIllll+1]];_0xb8960fc[_zxmhwyturoo]=_value end;do _0xb8960fc[_0xa9cd]=IIIII11l[_faasgxvfsw+1] end;do _0xb8960fc[_0x3eece]=_slpfotlwtb[IIIII11l[_0x09e12+1]] end elseif _1l1lIII==210 then local _0x1ca70=llIIlIl1[__twfxuxq+1]+256*llIIlIl1[__twfxuxq];local _0x2c33f501=llIIlIl1[__twfxuxq+2+1]+256*llIIlIl1[__twfxuxq+2];local ___njutj=llIIlIl1[__twfxuxq+4+1]+256*llIIlIl1[__twfxuxq+4];local _gaepmih=llIIlIl1[__twfxuxq+6+1]+256*llIIlIl1[__twfxuxq+6];local _bb_jnhled=llIIlIl1[__twfxuxq+8+1]+256*llIIlIl1[__twfxuxq+8];__twfxuxq=__twfxuxq+10;do local _f=_0xb8960fc[_0x2c33f501];local _nargs;if _0x1ca70==0 then _nargs=_1llI1lIIl1-_0x2c33f501-1 else _nargs=_0x1ca70-1 end;if _bb_jnhled==1 then Il1l1l1IIl1l(_f,_0xb8960fc,_0x2c33f501,_nargs) elseif _bb_jnhled==2 then _0xb8960fc[_0x2c33f501]=Il1l1l1IIl1l(_f,_0xb8960fc,_0x2c33f501,_nargs) elseif _bb_jnhled==3 then local _v1,_v2=Il1l1l1IIl1l(_f,_0xb8960fc,_0x2c33f501,_nargs);_0xb8960fc[_0x2c33f501]=_v1;_0xb8960fc[_0x2c33f501+1]=_v2 elseif _bb_jnhled==4 then local _v1,_v2,_v3=Il1l1l1IIl1l(_f,_0xb8960fc,_0x2c33f501,_nargs);_0xb8960fc[_0x2c33f501]=_v1;_0xb8960fc[_0x2c33f501+1]=_v2;_0xb8960fc[_0x2c33f501+2]=_v3 else local _rt=_arlcjtefd(Il1l1l1IIl1l(_f,_0xb8960fc,_0x2c33f501,_nargs));local _rn=_rt.n;if _bb_jnhled==0 then for _i=1,_rn do _0xb8960fc[_0x2c33f501+_i-1]=_rt[_i] end;_1llI1lIIl1=_0x2c33f501+_rn else local _want=_bb_jnhled-1;for _i=1,_want do _0xb8960fc[_0x2c33f501+_i-1]=_rt[_i] end end end end;do do local _result=_slpfotlwtb[IIIII11l[___njutj+1]];_0xb8960fc[_gaepmih]=_result end end elseif _1l1lIII==221 then local _clilmmudtp=llIIlIl1[__twfxuxq+1]+llIIlIl1[__twfxuxq]*256;__twfxuxq=__twfxuxq+2;local _0x4a25bac=llIIlIl1[__twfxuxq+1]+llIIlIl1[__twfxuxq]*256;__twfxuxq=__twfxuxq+2;local _0x9493a844=llIIlIl1[__twfxuxq+1]+llIIlIl1[__twfxuxq]*256;__twfxuxq=__twfxuxq+2;_0xb8960fc[_0x4a25bac]=(_clilmmudtp~=0);if _0x9493a844~=0 then if __twfxuxq>#llIIlIl1 then return end;local _no=llIIlIl1[__twfxuxq];__twfxuxq=__twfxuxq+1+_0x247d8542[_no] end else error("VM: bad opcode "..tostring(_1l1lIII)) end end end end end end return _lII11IIll1(_0x7b5e052[1],{},...) end)(...)
        `;

        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        return res.status(200).send(luaLoader);

    } catch (error) {
        console.error('Loader Error:', error);
        res.setHeader('Content-Type', 'text/plain');
        return res.status(500).send('-- Error: Internal Server Error');
    }
}
