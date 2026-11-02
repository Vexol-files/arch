--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v24, v25)
	local v26 = {};
	for v41 = 1, #v24 do
		v6(v26, v0(v4(v1(v2(v24, v41, v41 + 1)), v1(v2(v25, 1 + (v41 % #v25), 1 + (v41 % #v25) + 1))) % 256));
	end
	return v5(v26);
end
local v8 = tonumber;
local v9 = string.byte;
local v10 = string.char;
local v11 = string.sub;
local v12 = string.gsub;
local v13 = string.rep;
local v14 = table.concat;
local v15 = table.insert;
local v16 = math.ldexp;
local v17 = getfenv or function()
	return _ENV;
end;
local v18 = setmetatable;
local v19 = pcall;
local v20 = select;
local v21 = unpack or table.unpack;
local v22 = tonumber;
local function v23(v27, v28, ...)
	local v29 = 1;
	local v30;
	v27 = v12(v11(v27, 15 - 10), v7("\187\227", "\17\149\205\69\77\136"), function(v42)
		if (v9(v42, 2) == 81) then
			local v102 = 0;
			while true do
				if (v102 == 0) then
					v30 = v8(v11(v42, 1, 1));
					return "";
				end
			end
		else
			local v103 = v10(v8(v42, 16));
			if v30 then
				local v109 = v13(v103, v30);
				v30 = nil;
				return v109;
			else
				return v103;
			end
		end
	end);
	local function v31(v43, v44, v45)
		if v45 then
			local v104 = (v43 / (2 ^ (v44 - (2 - 1)))) % (2 ^ (((v45 - 1) - (v44 - 1)) + 1));
			return v104 - (v104 % 1);
		else
			local v105 = 2 ^ (v44 - 1);
			return (((v43 % (v105 + v105)) >= v105) and 1) or 0;
		end
	end
	local function v32()
		local v46 = 0;
		local v47;
		while true do
			if (v46 == 0) then
				v47 = v9(v27, v29, v29);
				v29 = v29 + 1;
				v46 = 1;
			end
			if (v46 == 1) then
				return v47;
			end
		end
	end
	local function v33()
		local v48 = 0;
		local v49;
		local v50;
		while true do
			if (v48 == 1) then
				return (v50 * (493 - 237)) + v49;
			end
			if (v48 == 0) then
				v49, v50 = v9(v27, v29, v29 + 2);
				v29 = v29 + 2;
				v48 = 1;
			end
		end
	end
	local function v34()
		local v51 = 0;
		local v52;
		local v53;
		local v54;
		local v55;
		while true do
			if (v51 == 0) then
				v52, v53, v54, v55 = v9(v27, v29, v29 + (7 - 4));
				v29 = v29 + 4;
				v51 = 1;
			end
			if (1 == v51) then
				return (v55 * 16777216) + (v54 * 65536) + (v53 * 256) + v52;
			end
		end
	end
	local function v35()
		local v56 = v34();
		local v57 = v34();
		local v58 = 1;
		local v59 = (v31(v57, 1, 20) * (2 ^ 32)) + v56;
		local v60 = v31(v57, 640 - (555 + 64), 31);
		local v61 = ((v31(v57, 32) == 1) and -1) or 1;
		if (v60 == 0) then
			if (v59 == 0) then
				return v61 * (931 - (857 + 74));
			else
				local v110 = 0;
				while true do
					if (v110 == 0) then
						v60 = 1;
						v58 = 0;
						break;
					end
				end
			end
		elseif (v60 == 2047) then
			return ((v59 == 0) and (v61 * (1 / (568 - (367 + 201))))) or (v61 * NaN);
		end
		return v16(v61, v60 - 1023) * (v58 + (v59 / (2 ^ 52)));
	end
	local function v36(v62)
		local v63 = 0;
		local v64;
		local v65;
		while true do
			if (v63 == 3) then
				return v14(v65);
			end
			if (v63 == 1) then
				v64 = v11(v27, v29, (v29 + v62) - 1);
				v29 = v29 + v62;
				v63 = 2;
			end
			if (v63 == 0) then
				v64 = nil;
				if not v62 then
					v62 = v34();
					if (v62 == 0) then
						return "";
					end
				end
				v63 = 1;
			end
			if (v63 == 2) then
				v65 = {};
				for v111 = 1, #v64 do
					v65[v111] = v10(v9(v11(v64, v111, v111)));
				end
				v63 = 3;
			end
		end
	end
	local v37 = v34;
	local function v38(...)
		return {...}, v20("#", ...);
	end
	local function v39()
		local v66 = {};
		local v67 = {};
		local v68 = {};
		local v69 = {v66,v67,nil,v68};
		local v70 = v34();
		local v71 = {};
		for v79 = 1, v70 do
			local v80 = v32();
			local v81;
			if (v80 == (1 + 0)) then
				v81 = v32() ~= 0;
			elseif (v80 == 2) then
				v81 = v35();
			elseif (v80 == 3) then
				v81 = v36();
			end
			v71[v79] = v81;
		end
		v69[3] = v32();
		for v83 = 1, v34() do
			local v84 = 0;
			local v85;
			while true do
				if (v84 == 0) then
					v85 = v32();
					if (v31(v85, 1, 1) == 0) then
						local v117 = 0;
						local v118;
						local v119;
						local v120;
						while true do
							if (v117 == 2) then
								if (v31(v119, 1, 1) == 1) then
									v120[2] = v71[v120[2]];
								end
								if (v31(v119, 2, 2) == 1) then
									v120[3] = v71[v120[3]];
								end
								v117 = 3;
							end
							if (v117 == 3) then
								if (v31(v119, 3, 3) == 1) then
									v120[4] = v71[v120[4]];
								end
								v66[v83] = v120;
								break;
							end
							if (v117 == 1) then
								v120 = {v33(),v33(),nil,nil};
								if (v118 == 0) then
									v120[3] = v33();
									v120[4] = v33();
								elseif (v118 == 1) then
									v120[3] = v34();
								elseif (v118 == 2) then
									v120[3] = v34() - (2 ^ 16);
								elseif (v118 == (1 + 2)) then
									v120[880 - (282 + 595)] = v34() - (2 ^ 16);
									v120[4] = v33();
								end
								v117 = 2;
							end
							if (0 == v117) then
								v118 = v31(v85, 2, 3);
								v119 = v31(v85, 4, 6);
								v117 = 1;
							end
						end
					end
					break;
				end
			end
		end
		for v86 = 1638 - (1523 + 114), v34() do
			v67[v86 - (1 + 0)] = v39();
		end
		return v69;
	end
	local function v40(v73, v74, v75)
		local v76 = v73[1];
		local v77 = v73[2 - 0];
		local v78 = v73[1068 - (68 + 997)];
		return function(...)
			local v88 = v76;
			local v89 = v77;
			local v90 = v78;
			local v91 = v38;
			local v92 = 1;
			local v93 = -1;
			local v94 = {};
			local v95 = {...};
			local v96 = v20("#", ...) - 1;
			local v97 = {};
			local v98 = {};
			for v106 = 0, v96 do
				if (v106 >= v90) then
					v94[v106 - v90] = v95[v106 + 1];
				else
					v98[v106] = v95[v106 + 1];
				end
			end
			local v99 = (v96 - v90) + 1;
			local v100;
			local v101;
			while true do
				v100 = v88[v92];
				v101 = v100[1];
				if (v101 <= 21) then
					if (v101 <= 10) then
						if (v101 <= (1274 - (226 + 1044))) then
							if (v101 <= 1) then
								if (v101 > 0) then
									v98[v100[2]] = #v98[v100[3]];
								else
									local v131 = 0;
									local v132;
									local v133;
									local v134;
									while true do
										if (v131 == 2) then
											v100 = v88[v92];
											v98[v100[2]] = #v98[v100[3]];
											v92 = v92 + 1;
											v100 = v88[v92];
											v131 = 3;
										end
										if (4 == v131) then
											v133 = v98[v134];
											v132 = v98[v134 + 2];
											if (v132 > 0) then
												if (v133 > v98[v134 + 1]) then
													v92 = v100[3];
												else
													v98[v134 + 3] = v133;
												end
											elseif (v133 < v98[v134 + (4 - 3)]) then
												v92 = v100[3];
											else
												v98[v134 + 3] = v133;
											end
											break;
										end
										if (v131 == 3) then
											v98[v100[2]] = v100[3];
											v92 = v92 + 1;
											v100 = v88[v92];
											v134 = v100[2];
											v131 = 4;
										end
										if (v131 == 1) then
											v92 = v92 + 1;
											v100 = v88[v92];
											v98[v100[2]] = v100[3];
											v92 = v92 + 1;
											v131 = 2;
										end
										if (v131 == 0) then
											v132 = nil;
											v133 = nil;
											v134 = nil;
											v98[v100[2]] = v98[v100[3]];
											v131 = 1;
										end
									end
								end
							elseif (v101 <= 2) then
								for v165 = v100[2], v100[3] do
									v98[v165] = nil;
								end
							elseif (v101 == 3) then
								local v167 = v100[119 - (32 + 85)];
								local v168, v169 = v91(v98[v167](v21(v98, v167 + 1, v93)));
								v93 = (v169 + v167) - 1;
								local v170 = 0;
								for v258 = v167, v93 do
									v170 = v170 + 1;
									v98[v258] = v168[v170];
								end
							else
								local v171 = v100[2];
								local v172, v173 = v91(v98[v171](v21(v98, v171 + 1, v100[3])));
								v93 = (v173 + v171) - 1;
								local v174 = 0 + 0;
								for v261 = v171, v93 do
									v174 = v174 + 1;
									v98[v261] = v172[v174];
								end
							end
						elseif (v101 <= 7) then
							if (v101 <= 5) then
								local v135 = v100[2];
								v98[v135](v98[v135 + 1]);
							elseif (v101 == 6) then
								local v175;
								local v176, v177;
								local v178;
								v98[v100[2]] = v100[3];
								v92 = v92 + 1;
								v100 = v88[v92];
								v178 = v100[1 + 1];
								v98[v178] = v98[v178](v21(v98, v178 + 1, v100[3]));
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v100[3];
								v92 = v92 + 1;
								v100 = v88[v92];
								v178 = v100[2];
								v176, v177 = v91(v98[v178](v21(v98, v178 + (958 - (892 + 65)), v100[3])));
								v93 = (v177 + v178) - 1;
								v175 = 0;
								for v264 = v178, v93 do
									v175 = v175 + 1;
									v98[v264] = v176[v175];
								end
								v92 = v92 + 1;
								v100 = v88[v92];
								v178 = v100[2];
								v98[v178] = v98[v178](v21(v98, v178 + (2 - 1), v93));
								v92 = v92 + 1;
								v100 = v88[v92];
								if (v98[v100[2]] == v100[4]) then
									v92 = v92 + 1;
								else
									v92 = v100[3];
								end
							elseif v98[v100[2]] then
								v92 = v92 + 1;
							else
								v92 = v100[5 - 2];
							end
						elseif (v101 <= 8) then
							local v136 = 0;
							while true do
								if (v136 == 0) then
									v98[v100[2]] = v98[v100[3]][v100[4]];
									v92 = v92 + (1 - 0);
									v100 = v88[v92];
									v136 = 1;
								end
								if (v136 == 5) then
									v98[v100[2]] = v75[v100[3]];
									v92 = v92 + (181 - (67 + 113));
									v100 = v88[v92];
									v136 = 6;
								end
								if (v136 == 1) then
									v98[v100[2]] = v75[v100[3]];
									v92 = v92 + 1;
									v100 = v88[v92];
									v136 = 2;
								end
								if (v136 == 2) then
									v98[v100[2]] = v98[v100[3]][v100[4]];
									v92 = v92 + (351 - (87 + 263));
									v100 = v88[v92];
									v136 = 3;
								end
								if (v136 == 4) then
									v98[v100[2]] = v98[v100[3]][v100[4]];
									v92 = v92 + 1;
									v100 = v88[v92];
									v136 = 5;
								end
								if (v136 == 3) then
									v98[v100[2]] = v75[v100[3]];
									v92 = v92 + 1;
									v100 = v88[v92];
									v136 = 4;
								end
								if (v136 == 6) then
									if not v98[v100[2]] then
										v92 = v92 + 1 + 0;
									else
										v92 = v100[3];
									end
									break;
								end
							end
						elseif (v101 == (21 - 12)) then
							local v185 = 0;
							local v186;
							local v187;
							while true do
								if (v185 == 1) then
									for v408 = 1, #v97 do
										local v409 = v97[v408];
										for v427 = 0, #v409 do
											local v428 = v409[v427];
											local v429 = v428[1];
											local v430 = v428[2 + 0];
											if ((v429 == v98) and (v430 >= v186)) then
												local v436 = 0;
												while true do
													if (v436 == 0) then
														v187[v430] = v429[v430];
														v428[1] = v187;
														break;
													end
												end
											end
										end
									end
									break;
								end
								if (v185 == 0) then
									v186 = v100[2];
									v187 = {};
									v185 = 1;
								end
							end
						else
							local v188 = 0;
							local v189;
							while true do
								if (v188 == 0) then
									v189 = v100[2];
									v98[v189] = v98[v189](v21(v98, v189 + 1, v100[11 - 8]));
									break;
								end
							end
						end
					elseif (v101 <= (967 - (802 + 150))) then
						if (v101 <= 12) then
							if (v101 > 11) then
								local v137 = 0;
								local v138;
								local v139;
								local v140;
								while true do
									if (v137 == 1) then
										v140 = {};
										v139 = v18({}, {[v7("\152\248\242\89\118\215\152", "\224\199\167\155\55\18\178")]=function(v303, v304)
											local v305 = 0;
											local v306;
											while true do
												if (v305 == 0) then
													v306 = v140[v304];
													return v306[1][v306[2]];
												end
											end
										end,[v7("\3\251\116\137\234\69\253\56\193\98", "\147\92\164\26\236\157\44")]=function(v307, v308, v309)
											local v310 = 0;
											local v311;
											while true do
												if (v310 == 0) then
													v311 = v140[v308];
													v311[1][v311[2]] = v309;
													break;
												end
											end
										end});
										v137 = 2;
									end
									if (v137 == 0) then
										v138 = v89[v100[3]];
										v139 = nil;
										v137 = 1;
									end
									if (v137 == 2) then
										for v312 = 1, v100[4] do
											v92 = v92 + 1;
											local v313 = v88[v92];
											if (v313[1] == 34) then
												v140[v312 - 1] = {v98,v313[3]};
											else
												v140[v312 - 1] = {v74,v313[3]};
											end
											v97[#v97 + 1] = v140;
										end
										v98[v100[2]] = v40(v138, v139, v75);
										break;
									end
								end
							else
								v98[v100[5 - 3]] = {};
							end
						elseif (v101 <= 13) then
							v98[v100[2]] = v100[3];
						elseif (v101 == (24 - 10)) then
							local v190 = 0;
							local v191;
							while true do
								if (v190 == 0) then
									v191 = v100[2];
									v98[v191] = v98[v191](v98[v191 + 1]);
									break;
								end
							end
						else
							local v192 = 0;
							local v193;
							while true do
								if (3 == v192) then
									v100 = v88[v92];
									v193 = v100[2];
									v98[v193] = v98[v193](v98[v193 + 1]);
									v192 = 4;
								end
								if (v192 == 4) then
									v92 = v92 + 1;
									v100 = v88[v92];
									v98[v100[5 - 3]]();
									v192 = 5;
								end
								if (2 == v192) then
									v100 = v88[v92];
									v98[v100[2 + 0]] = v98[v100[3]][v100[1001 - (915 + 82)]];
									v92 = v92 + 1;
									v192 = 3;
								end
								if (v192 == 1) then
									v100 = v88[v92];
									v98[v100[2]] = v74[v100[3]];
									v92 = v92 + 1;
									v192 = 2;
								end
								if (v192 == 5) then
									v92 = v92 + 1;
									v100 = v88[v92];
									do
										return;
									end
									break;
								end
								if (v192 == 0) then
									v193 = nil;
									v98[v100[2]] = v75[v100[3]];
									v92 = v92 + 1;
									v192 = 1;
								end
							end
						end
					elseif (v101 <= (11 + 7)) then
						if (v101 <= 16) then
							v98[v100[2]] = v40(v89[v100[3]], nil, v75);
						elseif (v101 > 17) then
							local v194 = 0;
							local v195;
							local v196;
							local v197;
							while true do
								if (v194 == 0) then
									v195 = v100[2];
									v196 = v98[v195];
									v194 = 1;
								end
								if (v194 == 1) then
									v197 = v98[v195 + 2];
									if (v197 > (0 - 0)) then
										if (v196 > v98[v195 + 1]) then
											v92 = v100[3];
										else
											v98[v195 + 3] = v196;
										end
									elseif (v196 < v98[v195 + 1]) then
										v92 = v100[3];
									else
										v98[v195 + (1190 - (1069 + 118))] = v196;
									end
									break;
								end
							end
						else
							v98[v100[4 - 2]] = v98[v100[3]] % v100[4];
						end
					elseif (v101 <= 19) then
						v98[v100[2]][v98[v100[3]]] = v98[v100[4]];
					elseif (v101 > 20) then
						v98[v100[2]] = v75[v100[3]];
					else
						v98[v100[2]] = v74[v100[6 - 3]];
					end
				elseif (v101 <= 32) then
					if (v101 <= 26) then
						if (v101 <= (4 + 19)) then
							if (v101 > (38 - 16)) then
								local v147 = v100[2];
								do
									return v21(v98, v147, v93);
								end
							else
								local v148 = v100[2 + 0];
								v98[v148](v21(v98, v148 + 1, v93));
							end
						elseif (v101 <= 24) then
							local v149 = v100[2];
							v98[v149] = v98[v149](v21(v98, v149 + 1, v93));
						elseif (v101 == (816 - (368 + 423))) then
							local v203;
							local v204, v205;
							local v206;
							v98[v100[2]] = v98[v100[3]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v74[v100[3]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v74[v100[3]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v74[v100[3]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v74[v100[3]];
							v92 = v92 + (3 - 2);
							v100 = v88[v92];
							v98[v100[20 - (10 + 8)]] = v98[v100[3]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[7 - 5]] = v98[v100[3]];
							v92 = v92 + (443 - (416 + 26));
							v100 = v88[v92];
							v98[v100[2]] = v98[v100[3]] + v100[4];
							v92 = v92 + 1;
							v100 = v88[v92];
							v206 = v100[2];
							v204, v205 = v91(v98[v206](v21(v98, v206 + 1, v100[3])));
							v93 = (v205 + v206) - 1;
							v203 = 0;
							for v287 = v206, v93 do
								local v288 = 0;
								while true do
									if (v288 == 0) then
										v203 = v203 + 1;
										v98[v287] = v204[v203];
										break;
									end
								end
							end
							v92 = v92 + 1;
							v100 = v88[v92];
							v206 = v100[2];
							v98[v206] = v98[v206](v21(v98, v206 + 1, v93));
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v74[v100[3]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v74[v100[3]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v98[v100[3]];
							v92 = v92 + (3 - 2);
							v100 = v88[v92];
							v98[v100[1 + 1]] = #v98[v100[3]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v98[v100[3]] % v98[v100[4]];
							v92 = v92 + (1 - 0);
							v100 = v88[v92];
							v98[v100[2]] = v100[3] + v98[v100[442 - (145 + 293)]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[432 - (44 + 386)]] = #v98[v100[3]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[1488 - (998 + 488)]] = v98[v100[3]] % v98[v100[4]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v100[1 + 2] + v98[v100[4 + 0]];
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v98[v100[3]] + v100[4];
							v92 = v92 + 1;
							v100 = v88[v92];
							v206 = v100[2];
							v204, v205 = v91(v98[v206](v21(v98, v206 + (773 - (201 + 571)), v100[3])));
							v93 = (v205 + v206) - 1;
							v203 = 0;
							for v289 = v206, v93 do
								local v290 = 0;
								while true do
									if (v290 == 0) then
										v203 = v203 + 1;
										v98[v289] = v204[v203];
										break;
									end
								end
							end
							v92 = v92 + 1;
							v100 = v88[v92];
							v206 = v100[2];
							v204, v205 = v91(v98[v206](v21(v98, v206 + 1, v93)));
							v93 = (v205 + v206) - 1;
							v203 = 1138 - (116 + 1022);
							for v291 = v206, v93 do
								local v292 = 0;
								while true do
									if (v292 == 0) then
										v203 = v203 + 1;
										v98[v291] = v204[v203];
										break;
									end
								end
							end
							v92 = v92 + 1;
							v100 = v88[v92];
							v206 = v100[2];
							v98[v206] = v98[v206](v21(v98, v206 + (4 - 3), v93));
							v92 = v92 + 1;
							v100 = v88[v92];
							v98[v100[2]] = v98[v100[2 + 1]] % v100[4];
							v92 = v92 + 1;
							v100 = v88[v92];
							v206 = v100[2];
							v204, v205 = v91(v98[v206](v98[v206 + 1]));
							v93 = (v205 + v206) - 1;
							v203 = 0;
							for v293 = v206, v93 do
								local v294 = 0;
								while true do
									if (0 == v294) then
										v203 = v203 + (3 - 2);
										v98[v293] = v204[v203];
										break;
									end
								end
							end
							v92 = v92 + (3 - 2);
							v100 = v88[v92];
							v206 = v100[2];
							v98[v206](v21(v98, v206 + 1, v93));
						else
							local v218 = 0;
							local v219;
							local v220;
							while true do
								if (v218 == 1) then
									for v420 = v219 + 1, v93 do
										v15(v220, v98[v420]);
									end
									break;
								end
								if (0 == v218) then
									v219 = v100[2];
									v220 = v98[v219];
									v218 = 1;
								end
							end
						end
					elseif (v101 <= 29) then
						if (v101 <= 27) then
							v92 = v100[3];
						elseif (v101 == 28) then
							v98[v100[2]] = v100[3] + v98[v100[4]];
						else
							local v222 = v100[861 - (814 + 45)];
							do
								return v98[v222](v21(v98, v222 + (2 - 1), v100[3]));
							end
						end
					elseif (v101 <= 30) then
						if not v98[v100[1 + 1]] then
							v92 = v92 + 1;
						else
							v92 = v100[3];
						end
					elseif (v101 == 31) then
						if (v98[v100[2]] == v100[4]) then
							v92 = v92 + 1;
						else
							v92 = v100[3];
						end
					else
						do
							return v98[v100[2]]();
						end
					end
				elseif (v101 <= 37) then
					if (v101 <= 34) then
						if (v101 > 33) then
							v98[v100[2]] = v98[v100[3]];
						else
							local v154 = 0;
							local v155;
							local v156;
							local v157;
							local v158;
							while true do
								if (v154 == 1) then
									v93 = (v157 + v155) - 1;
									v158 = 0;
									v154 = 2;
								end
								if (0 == v154) then
									v155 = v100[2];
									v156, v157 = v91(v98[v155](v98[v155 + 1]));
									v154 = 1;
								end
								if (v154 == 2) then
									for v316 = v155, v93 do
										local v317 = 0;
										while true do
											if (v317 == 0) then
												v158 = v158 + 1;
												v98[v316] = v156[v158];
												break;
											end
										end
									end
									break;
								end
							end
						end
					elseif (v101 <= 35) then
						v98[v100[2]] = v98[v100[3]][v100[4]];
					elseif (v101 == 36) then
						v98[v100[2]] = v98[v100[3]] + v100[4];
					else
						local v225 = 0;
						local v226;
						local v227;
						local v228;
						while true do
							if (v225 == 2) then
								if (v227 > (0 + 0)) then
									if (v228 <= v98[v226 + 1]) then
										local v441 = 0;
										while true do
											if (v441 == 0) then
												v92 = v100[3];
												v98[v226 + 3] = v228;
												break;
											end
										end
									end
								elseif (v228 >= v98[v226 + 1]) then
									v92 = v100[3];
									v98[v226 + 3] = v228;
								end
								break;
							end
							if (v225 == 1) then
								v228 = v98[v226] + v227;
								v98[v226] = v228;
								v225 = 2;
							end
							if (0 == v225) then
								v226 = v100[2];
								v227 = v98[v226 + 2];
								v225 = 1;
							end
						end
					end
				elseif (v101 <= 40) then
					if (v101 <= 38) then
						v98[v100[2]][v98[v100[3]]] = v100[4];
					elseif (v101 == (924 - (261 + 624))) then
						local v229;
						local v230;
						local v231, v232;
						local v233;
						v98[v100[3 - 1]] = v74[v100[1083 - (1020 + 60)]];
						v92 = v92 + (1424 - (630 + 793));
						v100 = v88[v92];
						v98[v100[2]] = v74[v100[3]];
						v92 = v92 + 1;
						v100 = v88[v92];
						v98[v100[2]] = v74[v100[3]];
						v92 = v92 + 1;
						v100 = v88[v92];
						v98[v100[2]] = {};
						v92 = v92 + 1;
						v100 = v88[v92];
						v98[v100[2]] = v74[v100[3]];
						v92 = v92 + 1;
						v100 = v88[v92];
						v98[v100[2]] = v98[v100[3]];
						v92 = v92 + 1;
						v100 = v88[v92];
						for v296 = v100[2], v100[3] do
							v98[v296] = nil;
						end
						v92 = v92 + (3 - 2);
						v100 = v88[v92];
						v233 = v100[2];
						v231, v232 = v91(v98[v233](v21(v98, v233 + 1, v100[3])));
						v93 = (v232 + v233) - 1;
						v230 = 0;
						for v298 = v233, v93 do
							local v299 = 0;
							while true do
								if (v299 == 0) then
									v230 = v230 + (4 - 3);
									v98[v298] = v231[v230];
									break;
								end
							end
						end
						v92 = v92 + 1;
						v100 = v88[v92];
						v233 = v100[2];
						v229 = v98[v233];
						for v300 = v233 + 1, v93 do
							v15(v229, v98[v300]);
						end
					else
						local v242 = 0;
						local v243;
						while true do
							if (v242 == 3) then
								v92 = v92 + (767 - (745 + 21));
								v100 = v88[v92];
								v98[v100[2]] = {};
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v98[v100[3]];
								v242 = 4;
							end
							if (v242 == 13) then
								v98[v100[2]][v98[v100[3]]] = v98[v100[4]];
								v92 = v92 + 1;
								v100 = v88[v92];
								v243 = v100[2];
								v98[v243] = v98[v243](v98[v243 + 1]);
								v92 = v92 + 1;
								v242 = 14;
							end
							if (v242 == 11) then
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v100[3];
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v100[3];
								v242 = 12;
							end
							if (v242 == 2) then
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]][v98[v100[3]]] = v100[4];
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v98[v100[1916 - (1789 + 124)]];
								v242 = 3;
							end
							if (v242 == 8) then
								v100 = v88[v92];
								v98[v100[2]][v98[v100[3]]] = v98[v100[4]];
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v98[v100[3]];
								v92 = v92 + 1;
								v242 = 9;
							end
							if (v242 == 14) then
								v100 = v88[v92];
								v98[v100[1057 - (87 + 968)]] = v75[v100[13 - 10]];
								break;
							end
							if (v242 == 0) then
								v243 = nil;
								v98[v100[2]] = v98[v100[3]];
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v100[3];
								v92 = v92 + 1;
								v242 = 1;
							end
							if (v242 == 5) then
								v92 = v92 + 1;
								v100 = v88[v92];
								v243 = v100[2];
								v98[v243] = v98[v243](v21(v98, v243 + (3 - 2), v100[3]));
								v92 = v92 + 1;
								v100 = v88[v92];
								v242 = 6;
							end
							if (v242 == 10) then
								v100 = v88[v92];
								v243 = v100[2 + 0];
								v98[v243] = v98[v243](v21(v98, v243 + 1, v100[3]));
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v98[v100[3]];
								v242 = 11;
							end
							if (v242 == 7) then
								v98[v100[2]] = v100[3];
								v92 = v92 + 1;
								v100 = v88[v92];
								v243 = v100[2];
								v98[v243] = v98[v243](v21(v98, v243 + 1, v100[3]));
								v92 = v92 + 1;
								v242 = 8;
							end
							if (v242 == 12) then
								v92 = v92 + 1;
								v100 = v88[v92];
								v243 = v100[2];
								v98[v243] = v98[v243](v21(v98, v243 + 1, v100[3]));
								v92 = v92 + 1;
								v100 = v88[v92];
								v242 = 13;
							end
							if (v242 == 4) then
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[1 + 1]] = v100[3];
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[5 - 3]] = v100[3];
								v242 = 5;
							end
							if (v242 == 6) then
								v98[v100[2]] = v98[v100[3]];
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v100[3];
								v92 = v92 + 1;
								v100 = v88[v92];
								v242 = 7;
							end
							if (v242 == 9) then
								v100 = v88[v92];
								v98[v100[2]] = v100[3];
								v92 = v92 + 1;
								v100 = v88[v92];
								v98[v100[2]] = v100[1 + 2];
								v92 = v92 + 1;
								v242 = 10;
							end
							if (v242 == 1) then
								v100 = v88[v92];
								v98[v100[2]] = v100[3];
								v92 = v92 + 1 + 0;
								v100 = v88[v92];
								v243 = v100[6 - 4];
								v98[v243] = v98[v243](v21(v98, v243 + 1, v100[1750 - (760 + 987)]));
								v242 = 2;
							end
						end
					end
				elseif (v101 <= (38 + 3)) then
					v98[v100[2]] = v98[v100[3]] % v98[v100[4]];
				elseif (v101 == 42) then
					do
						return;
					end
				else
					v98[v100[2]]();
				end
				v92 = v92 + 1;
			end
		end;
	end
	return v40(v39(), {}, v28)(...);
end
return v23("LOL!043Q0003063Q00737472696E6703053Q006D6174636803083Q00746F6E756D62657203053Q007063612Q6C000D3Q0012153Q00013Q0020235Q0002001215000100033Q001215000200043Q00060C00033Q000100042Q00223Q00014Q00228Q00223Q00024Q00223Q00034Q0022000400034Q0020000400014Q001700046Q002A3Q00013Q00013Q00043Q00027Q004003053Q003A25642B3A2Q033Q0025642B026Q00F03F001B3Q0002108Q002700018Q000200016Q000300016Q00048Q000500026Q00068Q000700076Q000500076Q00043Q0001002023000400040001001206000500026Q00030005000200122Q000400036Q000200046Q00013Q000200262Q000100170001000400041B3Q001700012Q002200016Q000B00026Q001D000100024Q001700015Q00041B3Q001A00012Q0014000100034Q0020000100014Q001700016Q002A3Q00013Q00013Q001B3Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E736572742Q033Q0073796E03073Q0072657175657374030C3Q00682Q74705F7265717565737403023Q005F47030B3Q00EEE2C90BD988D31FD6C68E03083Q007EB1A3BB4586DBA72Q012Q033Q0016DF2603053Q009C43AD4AA5035C3Q003CA35D06AF7C097BA54801F2214F20BF5C14A9354326B44618A8234820F94A19B1697031AF461AF1204F38B25A59BD34453CF85B13BA35093CB24812AF694B35BE4759AF324720BE4A29BF294820B24702F3355235B04C40F22A533503073Q002654D72976DC4603063Q007D13361AF15403053Q009E307642722Q033Q008C012403073Q009BCB44705613C503053Q007063612Q6C026Q00F03F01463Q0006073Q004400013Q00041B3Q00440001001215000100013Q00200800010001000200122Q000200013Q00202Q00020002000300122Q000300013Q00202Q00030003000400122Q000400053Q00062Q0004000C0001000100041B3Q000C0001001215000400063Q002023000500040007001215000600083Q002023000600060009001215000700083Q00202300070007000A00060C00083Q000100062Q00223Q00064Q00223Q00074Q00223Q00014Q00223Q00054Q00223Q00024Q00223Q00033Q0012150009000B3Q0006070009001F00013Q00041B3Q001F00010012150009000B3Q00202300090009000C00061E000900230001000100041B3Q002300010012150009000D3Q00061E000900230001000100041B3Q002300010012150009000C3Q001215000A000E4Q0028000B00083Q00122Q000C000F3Q00122Q000D00106Q000B000D000200202Q000A000B00114Q000A00096Q000B3Q00024Q000C00083Q00122Q000D00123Q00122Q000E00136Q000C000E00024Q000D00083Q00122Q000E00143Q00122Q000F00156Q000D000F00024Q000B000C000D4Q000C00083Q00122Q000D00163Q00122Q000E00176Q000C000E00024Q000D00083Q00122Q000E00183Q00122Q000F00196Q000D000F00024Q000B000C000D4Q000A0002000200122Q000B001A3Q00060C000C0001000100012Q00223Q000A4Q0005000B000200012Q000900015Q00041B3Q0045000100202300013Q001B2Q002A3Q00013Q00023Q00033Q00028Q00026Q00F03F026Q007040022F3Q00120D000200014Q0002000300033Q00261F000200080001000200041B3Q000800012Q001400046Q0022000500034Q001D000400054Q001700045Q00261F000200020001000100041B3Q000200012Q000B00048Q000300043Q00122Q000400026Q00055Q00122Q000600023Q00042Q0004002C00012Q0014000800014Q0019000900036Q000A00026Q000B00036Q000C00046Q000D00056Q000E8Q000F00073Q00202Q0010000700024Q000D00106Q000C3Q00024Q000D00046Q000E00056Q000F00016Q001000016Q00100007001000102Q0010000200104Q001100016Q00110007001100102Q00110002001100202Q0011001100024Q000E00116Q000D8Q000B3Q000200202Q000B000B00034Q000A000B6Q00083Q000100042500040010000100120D000200023Q00041B3Q000200012Q002A3Q00017Q00023Q00030A3Q006C6F6164737472696E6703043Q00426F647900063Q00120F3Q00016Q00015Q00202Q0001000100026Q000200026Q000100016Q00017Q00", v17(), ...);
