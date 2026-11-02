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
	local v26 = 1427 - (41 + 1386);
	local v27;
	while true do
		if (v26 == (104 - (17 + 86))) then
			return v5(v27);
		end
		if (v26 == 0) then
			v27 = {};
			for v115 = 1 + 0, #v24 do
				v6(v27, v0(v4(v1(v2(v24, v115, v115 + 1)), v1(v2(v25, (1 - 0) + (v115 % #v25), 1 + (v115 % #v25) + (2 - 1)))) % (422 - (122 + 44))));
			end
			v26 = 1 - 0;
		end
	end
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
local function v23(v28, v29, ...)
	local v30 = 3 - 2;
	local v31;
	v28 = v12(v11(v28, 5), v7("\138\52", "\92\164\26\236\157\44"), function(v42)
		if (v9(v42, 2) == ((206 + 47) - (25 + 147))) then
			local v109 = 0 - 0;
			while true do
				if (v109 == (65 - (30 + 35))) then
					v31 = v8(v11(v42, 1 + 0, (1259 - (1043 + 214)) - (3 - 2)));
					return "";
				end
			end
		else
			local v110 = v10(v8(v42, 16));
			if v31 then
				local v116 = 0;
				local v117;
				local v118;
				while true do
					if (v116 == (1213 - (323 + 889))) then
						while true do
							local v130 = 0 - 0;
							while true do
								if (v130 == (580 - (361 + 219))) then
									if (v117 == (321 - (53 + 267))) then
										return v118;
									end
									if (v117 == (0 + 0)) then
										local v138 = 0;
										while true do
											if (v138 == (414 - (15 + 398))) then
												v117 = 983 - (18 + 964);
												break;
											end
											if (v138 == (0 - 0)) then
												v118 = v13(v110, v31);
												v31 = nil;
												v138 = 1;
											end
										end
									end
									break;
								end
							end
						end
						break;
					end
					if (v116 == (0 + 0)) then
						v117 = 0 + 0;
						v118 = nil;
						v116 = 851 - (20 + 830);
					end
				end
			else
				return v110;
			end
		end
	end);
	local function v32(v43, v44, v45)
		if v45 then
			local v111 = 0 + 0;
			local v112;
			while true do
				if ((126 - (116 + 10)) == v111) then
					v112 = (v43 / (((1 + 2) - (739 - (542 + 196))) ^ (v44 - 1))) % ((3 - 1) ^ (((v45 - 1) - (v44 - (1 + 0))) + 1 + 0));
					return v112 - (v112 % 1);
				end
			end
		else
			local v113 = 2 ^ (v44 - 1);
			return (((v43 % (v113 + v113)) >= v113) and 1) or (0 + 0);
		end
	end
	local function v33()
		local v46 = v9(v28, v30, v30);
		v30 = v30 + (2 - 1);
		return v46;
	end
	local function v34()
		local v47 = 0 - 0;
		local v48;
		local v49;
		local v50;
		while true do
			if ((1551 - (1126 + 425)) == v47) then
				v48 = 405 - (118 + 287);
				v49 = nil;
				v47 = 3 - 2;
			end
			if (v47 == (1122 - (118 + 1003))) then
				v50 = nil;
				while true do
					if (v48 == 0) then
						local v121 = 0 - 0;
						while true do
							if (v121 == (377 - (142 + 235))) then
								v49, v50 = v9(v28, v30, v30 + 2);
								v30 = v30 + (9 - 7);
								v121 = 1;
							end
							if ((1 + 0) == v121) then
								v48 = 1;
								break;
							end
						end
					end
					if (v48 == (978 - (553 + 424))) then
						return (v50 * (483 - 227)) + v49;
					end
				end
				break;
			end
		end
	end
	local function v35()
		local v51 = 0 + 0;
		local v52;
		local v53;
		local v54;
		local v55;
		local v56;
		while true do
			if (v51 == (1 + 0)) then
				v54 = nil;
				v55 = nil;
				v51 = 2;
			end
			if (v51 == 2) then
				v56 = nil;
				while true do
					if (v52 == (1 + 0)) then
						return (v56 * (7131822 + 9645394)) + (v55 * 65536) + (v54 * (147 + 109)) + v53;
					end
					if (v52 == (0 - 0)) then
						v53, v54, v55, v56 = v9(v28, v30, v30 + 3);
						v30 = v30 + (11 - 7);
						v52 = 2 - 1;
					end
				end
				break;
			end
			if (v51 == 0) then
				v52 = 0 + 0;
				v53 = nil;
				v51 = 4 - 3;
			end
		end
	end
	local function v36()
		local v57 = 0;
		local v58;
		local v59;
		local v60;
		local v61;
		local v62;
		local v63;
		while true do
			local v80 = 753 - (239 + 514);
			while true do
				if (v80 == 1) then
					if (v57 == 3) then
						local v122 = 0 + 0;
						while true do
							if (v122 == (1329 - (797 + 532))) then
								if (v62 == (0 + 0)) then
									if (v61 == (0 + 0)) then
										return v63 * (0 - 0);
									else
										local v139 = 0;
										while true do
											if (v139 == (1202 - (373 + 829))) then
												v62 = 1;
												v60 = 731 - (476 + 255);
												break;
											end
										end
									end
								elseif (v62 == (3177 - (369 + 761))) then
									return ((v61 == (0 + 0)) and (v63 * ((1 - 0) / ((1172 - 553) - (555 + (302 - (64 + 174))))))) or (v63 * NaN);
								end
								return v16(v63, v62 - (146 + 877)) * (v60 + (v61 / (2 ^ (76 - 24))));
							end
						end
					end
					if ((337 - (144 + 192)) == v57) then
						local v123 = 216 - (42 + 174);
						while true do
							if (v123 == 1) then
								v57 = 2 + 0;
								break;
							end
							if (v123 == (0 + 0)) then
								v60 = 1;
								v61 = (v32(v59, (1 + 1) - 1, 20) * ((1506 - (363 + 1141)) ^ (1612 - (1183 + 397)))) + v58;
								v123 = 2 - 1;
							end
						end
					end
					break;
				end
				if (v80 == (0 + 0)) then
					if (v57 == 2) then
						v62 = v32(v59, 21, 24 + 7);
						v63 = ((v32(v59, 2007 - (1913 + 62)) == (1 + 0)) and -(2 - 1)) or 1;
						v57 = 1936 - (565 + 1368);
					end
					if (v57 == 0) then
						local v124 = 0 - 0;
						while true do
							if (v124 == 0) then
								v58 = v35();
								v59 = v35();
								v124 = 1662 - (1477 + 184);
							end
							if (v124 == 1) then
								v57 = 1 - 0;
								break;
							end
						end
					end
					v80 = 1 + 0;
				end
			end
		end
	end
	local function v37(v64)
		local v65;
		if not v64 then
			local v114 = 0;
			while true do
				if (v114 == (856 - (564 + 292))) then
					v64 = v35();
					if (v64 == 0) then
						return "";
					end
					break;
				end
			end
		end
		v65 = v11(v28, v30, (v30 + v64) - ((1607 - 675) - ((2582 - 1725) + (378 - (244 + 60)))));
		v30 = v30 + v64;
		local v66 = {};
		for v81 = 1 + 0, #v65 do
			v66[v81] = v10(v9(v11(v65, v81, v81)));
		end
		return v14(v66);
	end
	local v38 = v35;
	local function v39(...)
		return {...}, v20("#", ...);
	end
	local function v40()
		local v67 = {};
		local v68 = {};
		local v69 = {};
		local v70 = {v67,v68,nil,v69};
		local v71 = v35();
		local v72 = {};
		for v83 = 1126 - (936 + 189), v71 do
			local v84 = 0 + 0;
			local v85;
			local v86;
			local v87;
			while true do
				if (v84 == (1613 - (1565 + 48))) then
					v85 = 0 + 0;
					v86 = nil;
					v84 = 1139 - (782 + 356);
				end
				if (v84 == 1) then
					v87 = nil;
					while true do
						if (v85 == 0) then
							v86 = v33();
							v87 = nil;
							v85 = 1;
						end
						if (v85 == (268 - (176 + 91))) then
							if (v86 == (2 - 1)) then
								v87 = v33() ~= (0 - 0);
							elseif (v86 == 2) then
								v87 = v36();
							elseif (v86 == (1095 - (975 + 117))) then
								v87 = v37();
							end
							v72[v83] = v87;
							break;
						end
					end
					break;
				end
			end
		end
		v70[1878 - (157 + 1718)] = v33();
		for v88 = (462 + 107) - (367 + (713 - 512)), v35() do
			local v89 = 0 - 0;
			local v90;
			local v91;
			while true do
				if (v89 == (1018 - (697 + 321))) then
					v90 = 0 - 0;
					v91 = nil;
					v89 = 1;
				end
				if (v89 == 1) then
					while true do
						if (v90 == (0 - 0)) then
							v91 = v33();
							if (v32(v91, 2 - 1, 1 + 0) == (0 - 0)) then
								local v133 = 0;
								local v134;
								local v135;
								local v136;
								local v137;
								while true do
									if (v133 == (0 - 0)) then
										v134 = 0;
										v135 = nil;
										v133 = 1228 - (322 + 905);
									end
									if (v133 == (612 - (602 + 9))) then
										v136 = nil;
										v137 = nil;
										v133 = 1191 - (449 + 740);
									end
									if (v133 == (874 - (826 + 46))) then
										while true do
											if ((949 - (245 + 702)) == v134) then
												local v140 = 0 - 0;
												while true do
													if (v140 == 1) then
														v134 = 1 + 2;
														break;
													end
													if (v140 == (1898 - (260 + 1638))) then
														if (v32(v136, 441 - (382 + 58), 3 - 2) == (1 + 0)) then
															v137[3 - 1] = v72[v137[5 - 3]];
														end
														if (v32(v136, 1207 - (902 + 303), 3 - 1) == (2 - 1)) then
															v137[3] = v72[v137[1 + 2]];
														end
														v140 = 1691 - (1121 + 569);
													end
												end
											end
											if (v134 == (217 - (22 + 192))) then
												if (v32(v136, 3, 3) == (684 - (483 + 200))) then
													v137[1 + 3] = v72[v137[(2344 - (1404 + 59)) - ((771 - 489) + (799 - 204))]];
												end
												v67[v88] = v137;
												break;
											end
											if ((766 - (468 + 297)) == v134) then
												local v142 = 562 - (334 + 228);
												while true do
													if (v142 == (0 - 0)) then
														v137 = {v34(),v34(),nil,nil};
														if (v135 == (0 + 0)) then
															local v197 = 0;
															while true do
																if (v197 == 0) then
																	v137[7 - 4] = v34();
																	v137[931 - (214 + (1713 - 1000))] = v34();
																	break;
																end
															end
														elseif (v135 == (1 + 0)) then
															v137[8 - 5] = v35();
														elseif (v135 == 2) then
															v137[1 + 0 + 2 + 0] = v35() - ((2 - 0) ^ 16);
														elseif (v135 == 3) then
															local v427 = 0;
															local v428;
															while true do
																if (v427 == (0 + 0)) then
																	v428 = 0;
																	while true do
																		if (v428 == 0) then
																			v137[3] = v35() - ((165 - (92 + 71)) ^ 16);
																			v137[2 + 2] = v34();
																			break;
																		end
																	end
																	break;
																end
															end
														end
														v142 = 1 - 0;
													end
													if (v142 == (766 - (574 + 191))) then
														v134 = 2 + 0;
														break;
													end
												end
											end
											if (v134 == 0) then
												v135 = v32(v91, 2, 3);
												v136 = v32(v91, 9 - 5, 4 + 2);
												v134 = 850 - (254 + 595);
											end
										end
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
		end
		for v92 = 1, v35() do
			v68[v92 - 1] = v40();
		end
		return v70;
	end
	local function v41(v74, v75, v76)
		local v77 = v74[127 - (55 + 71)];
		local v78 = v74[2 - 0];
		local v79 = v74[1793 - (573 + 1217)];
		return function(...)
			local v94 = 0;
			local v95;
			local v96;
			local v97;
			local v98;
			local v99;
			local v100;
			local v101;
			local v102;
			local v103;
			local v104;
			local v105;
			local v106;
			local v107;
			local v108;
			while true do
				if (v94 == (2 - 1)) then
					v98 = v39;
					v99 = 1 + 0;
					v100 = -(1 - 0);
					v94 = 941 - (714 + 225);
				end
				if (0 == v94) then
					v95 = v77;
					v96 = v78;
					v97 = v79;
					v94 = 2 - 1;
				end
				if (v94 == (5 - 1)) then
					v106 = (v103 - v97) + 1;
					v107 = nil;
					v108 = nil;
					v94 = 5;
				end
				if (2 == v94) then
					v101 = {};
					v102 = {...};
					v103 = v20("#", ...) - (1 + 0);
					v94 = 3 - 0;
				end
				if (v94 == (809 - (118 + 688))) then
					v104 = {};
					v105 = {};
					for v119 = 48 - (25 + 23), v103 do
						if (v119 >= v97) then
							v101[v119 - v97] = v102[v119 + 1 + 0];
						else
							v105[v119] = v102[v119 + 1];
						end
					end
					v94 = 1890 - (927 + 959);
				end
				if (v94 == 5) then
					while true do
						local v120 = 0;
						while true do
							if (v120 == (3 - 2)) then
								if (v108 <= ((2389 - (16 + 716)) - (1523 + 114))) then
									if (v108 <= 9) then
										if (v108 <= (7 - 3)) then
											if (v108 <= (98 - (11 + 86))) then
												if (v108 == 0) then
													v105[v107[2]] = v105[v107[(6 - 3) + (285 - (175 + 110))]] % v105[v107[9 - 5]];
												elseif v105[v107[9 - 7]] then
													v99 = v99 + (1797 - (503 + 1293));
												else
													v99 = v107[8 - 5];
												end
											elseif (v108 <= 2) then
												v105[v107[2 + 0]][v105[v107[1064 - (810 + 251)]]] = v107[3 + 1];
											elseif (v108 == (1 + 2)) then
												local v199 = 0 + 0;
												local v200;
												while true do
													if (v199 == (533 - (43 + 490))) then
														v200 = v107[735 - (711 + 22)];
														v105[v200] = v105[v200](v21(v105, v200 + (3 - 2), v100));
														break;
													end
												end
											else
												do
													return;
												end
											end
										elseif (v108 <= 6) then
											if (v108 == (864 - (240 + 619))) then
												local v148 = v107[1 + 1];
												local v149 = v105[v148];
												for v190 = v148 + (1 - 0), v100 do
													v15(v149, v105[v190]);
												end
											else
												v105[v107[1 + 1]] = v105[v107[3]][v107[1748 - (1344 + 400)]];
											end
										elseif (v108 <= (412 - (255 + 150))) then
											local v152 = 0;
											local v153;
											local v154;
											local v155;
											local v156;
											while true do
												if (v152 == (3 + 0)) then
													local v267 = 0 + 0;
													while true do
														if (v267 == (0 - 0)) then
															v107 = v95[v99];
															v156 = v107[6 - 4];
															v267 = 1;
														end
														if (v267 == 1) then
															v154, v155 = v98(v105[v156](v21(v105, v156 + (1740 - (404 + 1335)), v107[3])));
															v100 = (v155 + v156) - (407 - (183 + 223));
															v267 = 2 - 0;
														end
														if (v267 == 2) then
															v152 = 3 + 1;
															break;
														end
													end
												end
												if (v152 == (1 + 0)) then
													local v268 = 0;
													while true do
														if (v268 == (339 - (10 + 327))) then
															v152 = 2;
															break;
														end
														if (v268 == (1 + 0)) then
															v156 = v107[2];
															v105[v156] = v105[v156](v21(v105, v156 + (339 - (118 + 220)), v107[1 + 2]));
															v268 = 2;
														end
														if (v268 == 0) then
															v99 = v99 + (1066 - ((517 - (108 + 341)) + 448 + 549));
															v107 = v95[v99];
															v268 = 4 - 3;
														end
													end
												end
												if (4 == v152) then
													v153 = 0;
													for v287 = v156, v100 do
														v153 = v153 + (1494 - (711 + 782));
														v105[v287] = v154[v153];
													end
													v99 = v99 + 1;
													v107 = v95[v99];
													v152 = 9 - 4;
												end
												if (v152 == (471 - (270 + 199))) then
													v99 = v99 + 1 + 0;
													v107 = v95[v99];
													v105[v107[1821 - (580 + 1239)]] = v107[8 - 5];
													v99 = v99 + 1 + 0;
													v152 = 3;
												end
												if (v152 == (0 + 0)) then
													local v273 = 0 + 0;
													while true do
														if (v273 == (0 - 0)) then
															v153 = nil;
															v154, v155 = nil;
															v273 = 1 + 0;
														end
														if (v273 == 1) then
															v156 = nil;
															v105[v107[2 - (1167 - (645 + 522))]] = v107[1793 - (1010 + 780)];
															v273 = 2;
														end
														if (v273 == (2 + 0)) then
															v152 = 4 - 3;
															break;
														end
													end
												end
												if (v152 == (14 - 9)) then
													v156 = v107[1838 - (1045 + 791)];
													v105[v156] = v105[v156](v21(v105, v156 + (2 - 1), v100));
													v99 = v99 + (1 - 0);
													v107 = v95[v99];
													v152 = 511 - (351 + 154);
												end
												if (v152 == 6) then
													if (v105[v107[(2846 - (1281 + 293)) - (226 + 1044)]] == v107[270 - (28 + 238)]) then
														v99 = v99 + (2 - 1);
													else
														v99 = v107[3];
													end
													break;
												end
											end
										elseif (v108 > (1567 - (1381 + 178))) then
											v99 = v107[3 + 0];
										else
											local v202 = 0 + 0;
											local v203;
											local v204;
											local v205;
											local v206;
											while true do
												if (v202 == (0 + 0)) then
													v203 = 0;
													v204 = nil;
													v202 = 3 - 2;
												end
												if (v202 == 1) then
													v205 = nil;
													v206 = nil;
													v202 = 2 + 0;
												end
												if (v202 == (472 - (381 + 89))) then
													while true do
														if (0 == v203) then
															v204 = v96[v107[3 + 0]];
															v205 = nil;
															v203 = 1 + 0;
														end
														if (v203 == 1) then
															local v430 = 0 - 0;
															while true do
																if (v430 == 0) then
																	v206 = {};
																	v205 = v18({}, {[v7("\115\112\82\36\22\73\87", "\114\44\47\59\74")]=function(v571, v572)
																		local v573 = 1156 - (1074 + 82);
																		local v574;
																		local v575;
																		while true do
																			if (v573 == 1) then
																				while true do
																					if (v574 == (0 - 0)) then
																						v575 = v206[v572];
																						return v575[1785 - (214 + 1570)][v575[1457 - (990 + 465)]];
																					end
																				end
																				break;
																			end
																			if (v573 == 0) then
																				v574 = 0 + 0;
																				v575 = nil;
																				v573 = 1 + 0;
																			end
																		end
																	end,[v7("\59\140\43\212\194\13\189\33\212\205", "\181\100\211\69\177")]=function(v576, v577, v578)
																		local v579 = 0 + 0;
																		local v580;
																		while true do
																			if (v579 == (0 - 0)) then
																				v580 = v206[v577];
																				v580[1727 - (1668 + 58)][v580[2]] = v578;
																				break;
																			end
																		end
																	end});
																	v430 = 627 - (512 + 114);
																end
																if (v430 == 1) then
																	v203 = 5 - 3;
																	break;
																end
															end
														end
														if (v203 == (3 - 1)) then
															for v495 = 1, v107[13 - 9] do
																local v496 = 0 + 0;
																local v497;
																while true do
																	if (0 == v496) then
																		v99 = v99 + 1 + 0;
																		v497 = v95[v99];
																		v496 = 1;
																	end
																	if (v496 == (1 + 0)) then
																		if (v497[3 - 2] == (2016 - (109 + 1885))) then
																			v206[v495 - (1470 - (1269 + 200))] = {v105,v497[818 - (98 + 717)]};
																		else
																			v206[v495 - (827 - (802 + 24))] = {v75,v497[120 - (32 + 13 + 72)]};
																		end
																		v104[#v104 + 1] = v206;
																		break;
																	end
																end
															end
															v105[v107[2 + 0 + 0]] = v41(v204, v205, v76);
															break;
														end
													end
													break;
												end
											end
										end
									elseif (v108 <= (1 + 3 + 10)) then
										if (v108 <= 11) then
											if (v108 == (3 + 7)) then
												local v157 = 0 - 0;
												local v158;
												local v159;
												local v160;
												local v161;
												while true do
													if (v157 == 2) then
														for v290 = v158, v100 do
															local v291 = 0;
															while true do
																if (v291 == (0 - 0)) then
																	v161 = v161 + 1 + 0;
																	v105[v290] = v159[v161];
																	break;
																end
															end
														end
														break;
													end
													if (v157 == (0 + 0)) then
														v158 = v107[2 + 0];
														v159, v160 = v98(v105[v158](v105[v158 + 1 + 0]));
														v157 = 1 + 0;
													end
													if ((1434 - (797 + 636)) == v157) then
														local v278 = 0;
														while true do
															if (v278 == 1) then
																v157 = 9 - 7;
																break;
															end
															if (v278 == (1619 - (1427 + 192))) then
																v100 = (v160 + v158) - (1 + 0);
																v161 = 0 - 0;
																v278 = 1 + 0;
															end
														end
													end
												end
											else
												local v162 = 0 + 0;
												local v163;
												local v164;
												while true do
													if (v162 == (326 - (192 + 134))) then
														v163 = 0;
														v164 = nil;
														v162 = 1277 - (316 + 960);
													end
													if (v162 == (1 + 0)) then
														while true do
															if (v163 == (0 + 0)) then
																v164 = nil;
																v105[v107[2 + 0]] = v75[v107[3]];
																v99 = v99 + 1;
																v107 = v95[v99];
																v105[v107[959 - ((3409 - 2517) + (616 - (83 + 468)))]] = v107[7 - 4];
																v99 = v99 + (1807 - (1202 + 604));
																v163 = 4 - 3;
															end
															if (v163 == (14 - 5)) then
																local v377 = 0 - 0;
																while true do
																	if (v377 == (328 - (45 + 280))) then
																		v163 = 10 + 0;
																		break;
																	end
																	if (v377 == 1) then
																		v99 = v99 + 1;
																		v107 = v95[v99];
																		v377 = 2 + 0;
																	end
																	if ((0 + 0) == v377) then
																		v107 = v95[v99];
																		v105[v107[2 + 0]] = v107[1 + 2];
																		v377 = 1;
																	end
																	if (v377 == (3 - 1)) then
																		v105[v107[2]] = v107[1914 - (340 + 1571)];
																		v99 = v99 + 1;
																		v377 = 3;
																	end
																end
															end
															if (v163 == (2 + 3)) then
																local v378 = 1772 - (1733 + 39);
																while true do
																	if (v378 == 3) then
																		v163 = 16 - 10;
																		break;
																	end
																	if ((1035 - (125 + 909)) == v378) then
																		v164 = v107[2];
																		v105[v164] = v105[v164](v21(v105, v164 + (351 - (87 + (2211 - (1096 + 852)))), v107[2 + 1]));
																		v378 = 2 - 0;
																	end
																	if (v378 == (0 + 0)) then
																		v99 = v99 + (513 - (409 + 103));
																		v107 = v95[v99];
																		v378 = 1;
																	end
																	if (v378 == (238 - (46 + 190))) then
																		v99 = v99 + (96 - (51 + 44));
																		v107 = v95[v99];
																		v378 = 3;
																	end
																end
															end
															if (v163 == (4 + 10)) then
																v107 = v95[v99];
																v105[v107[1319 - (1114 + 203)]] = v76[v107[(733 - (228 + 498)) - (1 + 3)]];
																break;
															end
															if (v163 == (2 + 0)) then
																v99 = v99 + (664 - (174 + 489));
																v107 = v95[v99];
																v105[v107[5 - 3]][v105[v107[1908 - (830 + 1075)]]] = v107[4];
																v99 = v99 + 1;
																v107 = v95[v99];
																v105[v107[2]] = v105[v107[3]];
																v163 = 527 - (303 + 221);
															end
															if (v163 == 1) then
																local v387 = 1269 - (231 + 1038);
																while true do
																	if (v387 == 2) then
																		v164 = v107[2];
																		v105[v164] = v105[v164](v21(v105, v164 + 1 + 0, v107[1165 - (171 + 991)]));
																		v387 = 12 - 9;
																	end
																	if (v387 == (2 - 1)) then
																		v99 = v99 + (2 - 1);
																		v107 = v95[v99];
																		v387 = 2 + 0;
																	end
																	if (0 == v387) then
																		v107 = v95[v99];
																		v105[v107[2]] = v107[(17 - 12) - 2];
																		v387 = 2 - 1;
																	end
																	if (v387 == (4 - 1)) then
																		v163 = 2;
																		break;
																	end
																end
															end
															if (v163 == (21 - 14)) then
																local v388 = 0;
																while true do
																	if (v388 == (1250 - (111 + 1137))) then
																		v105[v164] = v105[v164](v21(v105, v164 + 1, v107[161 - (91 + 67)]));
																		v99 = v99 + (2 - 1);
																		v388 = 3;
																	end
																	if (v388 == (1 + 2)) then
																		v163 = 531 - (423 + 100);
																		break;
																	end
																	if ((1 + 0) == v388) then
																		v107 = v95[v99];
																		v164 = v107[2];
																		v388 = 5 - 3;
																	end
																	if (v388 == (0 + 0)) then
																		v105[v107[2]] = v107[3];
																		v99 = v99 + 1;
																		v388 = 772 - (326 + 445);
																	end
																end
															end
															if (v163 == 10) then
																local v389 = 0;
																while true do
																	if (v389 == (8 - 6)) then
																		v107 = v95[v99];
																		v105[v107[4 - 2]] = v75[v107[6 - 3]];
																		v389 = 714 - (530 + 181);
																	end
																	if (v389 == 1) then
																		v105[v164] = v105[v164](v21(v105, v164 + (882 - (614 + 267)), v107[35 - (19 + 13)]));
																		v99 = v99 + (1 - 0);
																		v389 = 4 - 2;
																	end
																	if (v389 == 3) then
																		v163 = 31 - 20;
																		break;
																	end
																	if (v389 == (0 + 0)) then
																		v107 = v95[v99];
																		v164 = v107[2];
																		v389 = 1 - 0;
																	end
																end
															end
															if (v163 == 8) then
																v107 = v95[v99];
																v105[v107[2]][v105[v107[6 - 3]]] = v105[v107[1816 - (1293 + 519)]];
																v99 = v99 + 1;
																v107 = v95[v99];
																v105[v107[3 - 1]] = v75[v107[3]];
																v99 = v99 + 1;
																v163 = 22 - 13;
															end
															if (v163 == (20 - 9)) then
																local v395 = 0 - 0;
																while true do
																	if (v395 == (0 - 0)) then
																		v99 = v99 + 1 + 0;
																		v107 = v95[v99];
																		v395 = 1;
																	end
																	if (v395 == (1 + 0)) then
																		v105[v107[2]] = v107[6 - 3];
																		v99 = v99 + 1 + 0;
																		v395 = 2;
																	end
																	if (v395 == (1 + 2)) then
																		v163 = 12;
																		break;
																	end
																	if (v395 == (2 + 0)) then
																		v107 = v95[v99];
																		v105[v107[2]] = v107[1099 - (709 + 387)];
																		v395 = 1861 - (673 + 1185);
																	end
																end
															end
															if (v163 == (8 - 5)) then
																local v396 = 0 - 0;
																while true do
																	if (v396 == (4 - 1)) then
																		v163 = 3 + 1;
																		break;
																	end
																	if ((1 + 0) == v396) then
																		v105[v107[2 - 0]] = {};
																		v99 = v99 + 1;
																		v396 = 1 + 1;
																	end
																	if (v396 == 0) then
																		v99 = v99 + (1 - 0);
																		v107 = v95[v99];
																		v396 = 1 - 0;
																	end
																	if (2 == v396) then
																		v107 = v95[v99];
																		v105[v107[3 - (1881 - (446 + 1434))]] = v75[v107[3]];
																		v396 = 3;
																	end
																end
															end
															if (v163 == (1295 - (1040 + 243))) then
																v99 = v99 + (2 - 1);
																v107 = v95[v99];
																v164 = v107[2];
																v105[v164] = v105[v164](v21(v105, v164 + 1, v107[183 - ((1914 - (559 + 1288)) + (2044 - (609 + 1322)))]));
																v99 = v99 + 1 + (454 - (13 + 441));
																v107 = v95[v99];
																v163 = 13;
															end
															if (v163 == (14 - 10)) then
																local v400 = 0 - 0;
																while true do
																	if (v400 == 2) then
																		v107 = v95[v99];
																		v105[v107[9 - 7]] = v107[1 + 2];
																		v400 = 3;
																	end
																	if (v400 == (10 - 7)) then
																		v163 = 2 + 3;
																		break;
																	end
																	if (v400 == 1) then
																		v105[v107[1 + 1]] = v107[3];
																		v99 = v99 + (2 - 1);
																		v400 = 2 + 0;
																	end
																	if (0 == v400) then
																		v99 = v99 + (1 - 0);
																		v107 = v95[v99];
																		v400 = 1 + 0;
																	end
																end
															end
															if (v163 == (8 + 5)) then
																local v401 = 0 + 0;
																while true do
																	if (v401 == (0 + 0)) then
																		v105[v107[2]][v105[v107[3 + 0]]] = v105[v107[437 - (153 + 280)]];
																		v99 = v99 + (2 - 1);
																		v401 = 1 + 0;
																	end
																	if (v401 == (2 + 1)) then
																		v163 = 8 + 6;
																		break;
																	end
																	if (v401 == (2 + 0)) then
																		v105[v164] = v105[v164](v105[v164 + 1]);
																		v99 = v99 + 1 + 0;
																		v401 = 3;
																	end
																	if (v401 == 1) then
																		v107 = v95[v99];
																		v164 = v107[2];
																		v401 = 2 - 0;
																	end
																end
															end
															if (v163 == (4 + 2)) then
																local v402 = 0;
																while true do
																	if (v402 == 1) then
																		v107 = v95[v99];
																		v105[v107[669 - (89 + 578)]] = v107[3];
																		v402 = 2 + 0;
																	end
																	if (v402 == (3 - 1)) then
																		v99 = v99 + 1;
																		v107 = v95[v99];
																		v402 = 1052 - (572 + 477);
																	end
																	if ((1 + 2) == v402) then
																		v163 = 5 + 2;
																		break;
																	end
																	if ((0 + 0) == v402) then
																		v105[v107[88 - (84 + 2)]] = v75[v107[4 - 1]];
																		v99 = v99 + 1;
																		v402 = 1 + 0;
																	end
																end
															end
														end
														break;
													end
												end
											end
										elseif (v108 <= 12) then
											v105[v107[844 - (497 + 345)]]();
										elseif (v108 > (1 + 9 + 3)) then
											local v207 = 0 + 0;
											local v208;
											local v209;
											local v210;
											local v211;
											local v212;
											while true do
												if ((1333 - (605 + 728)) == v207) then
													v208 = nil;
													v209 = nil;
													v210, v211 = nil;
													v212 = nil;
													v105[v107[7 - (4 + 1)]] = v75[v107[6 - 3]];
													v99 = v99 + 1 + 0;
													v207 = 3 - 2;
												end
												if (v207 == (2 + 0)) then
													v107 = v95[v99];
													v105[v107[5 - 3]] = {};
													v99 = v99 + 1 + 0;
													v107 = v95[v99];
													v105[v107[3 - (490 - (457 + 32))]] = v75[v107[3]];
													v99 = v99 + 1 + 0;
													v207 = 3;
												end
												if (v207 == 5) then
													v99 = v99 + (1403 - (832 + 570));
													v107 = v95[v99];
													v212 = v107[2 + 0];
													v208 = v105[v212];
													for v403 = v212 + 1 + 0, v100 do
														v15(v208, v105[v403]);
													end
													break;
												end
												if (v207 == 4) then
													v107 = v95[v99];
													v212 = v107[2];
													v210, v211 = v98(v105[v212](v21(v105, v212 + (3 - 2), v107[2 + 1 + (796 - (588 + 208))])));
													v100 = (v211 + v212) - 1;
													v209 = 0 - 0;
													for v404 = v212, v100 do
														local v405 = 1800 - (884 + 916);
														local v406;
														while true do
															if (v405 == (0 - 0)) then
																v406 = 0 + 0;
																while true do
																	if (v406 == (653 - (232 + 421))) then
																		v209 = v209 + 1;
																		v105[v404] = v210[v209];
																		break;
																	end
																end
																break;
															end
														end
													end
													v207 = 1894 - (1569 + 320);
												end
												if (v207 == (1 + 2)) then
													v107 = v95[v99];
													v105[v107[1 + 1]] = v105[v107[3]];
													v99 = v99 + (3 - 2);
													v107 = v95[v99];
													for v407 = v107[607 - (316 + 289)], v107[3] do
														v105[v407] = nil;
													end
													v99 = v99 + 1;
													v207 = 10 - 6;
												end
												if (v207 == 1) then
													v107 = v95[v99];
													v105[v107[(45 + 909) - ((2255 - (666 + 787)) + 150)]] = v75[v107[3]];
													v99 = v99 + (426 - (360 + 65));
													v107 = v95[v99];
													v105[v107[2 + 0]] = v75[v107[(261 - (79 + 175)) - 4]];
													v99 = v99 + (1 - 0);
													v207 = 2;
												end
											end
										else
											local v213 = 0 + 0;
											local v214;
											local v215;
											local v216;
											local v217;
											while true do
												if (v213 == (0 - 0)) then
													local v320 = 0 - 0;
													while true do
														if (v320 == (900 - (503 + 396))) then
															v217 = nil;
															v105[v107[2]] = v105[v107[(1181 - (92 + 89)) - (915 + (158 - 76))]];
															v320 = 2 + 0;
														end
														if (2 == v320) then
															v99 = v99 + 1 + 0;
															v107 = v95[v99];
															v320 = 3;
														end
														if (v320 == (11 - 8)) then
															v105[v107[2]] = v75[v107[1 + 2]];
															v213 = 1;
															break;
														end
														if (v320 == 0) then
															v214 = nil;
															v215, v216 = nil;
															v320 = 2 - 1;
														end
													end
												end
												if (v213 == (7 + 1)) then
													local v321 = 0 + 0;
													while true do
														if (v321 == (8 - 5)) then
															v105[v107[2]] = v107[1 + 2] + v105[v107[5 - 1]];
															v213 = 1253 - (485 + 759);
															break;
														end
														if (v321 == (0 - 0)) then
															v105[v107[1191 - (442 + 747)]] = #v105[v107[3]];
															v99 = v99 + (1136 - (832 + 303));
															v321 = 947 - (88 + 858);
														end
														if (v321 == (1 + 1)) then
															v99 = v99 + 1;
															v107 = v95[v99];
															v321 = 3;
														end
														if (v321 == (1 + 0)) then
															v107 = v95[v99];
															v105[v107[1 + 1]] = v105[v107[792 - (766 + 23)]] % v105[v107[19 - 15]];
															v321 = 2 - 0;
														end
													end
												end
												if (v213 == 7) then
													v107 = v95[v99];
													v105[v107[4 - 2]] = v105[v107[10 - 7]] % v105[v107[4]];
													v99 = v99 + (1074 - (1036 + 37)) + 0;
													v107 = v95[v99];
													v105[v107[2 + 0]] = v107[5 - 2] + v105[v107[4 + 0]];
													v99 = v99 + (1481 - (641 + 839));
													v107 = v95[v99];
													v213 = 8;
												end
												if (v213 == 5) then
													local v325 = 913 - (910 + 3);
													while true do
														if (1 == v325) then
															v107 = v95[v99];
															v105[v107[2]] = v75[v107[7 - 4]];
															v325 = 2;
														end
														if (v325 == 2) then
															v99 = v99 + ((1686 - (1466 + 218)) - (1 + 0));
															v107 = v95[v99];
															v325 = 1151 - (556 + 592);
														end
														if (v325 == (2 + 1)) then
															v105[v107[2]] = v75[v107[811 - (329 + 479)]];
															v213 = 860 - (174 + 680);
															break;
														end
														if (0 == v325) then
															v105[v217] = v105[v217](v21(v105, v217 + (1188 - ((3672 - 2603) + (244 - 126))), v100));
															v99 = v99 + 1 + 0;
															v325 = 740 - (396 + 343);
														end
													end
												end
												if (v213 == 4) then
													local v326 = 0 + 0;
													while true do
														if (v326 == (1479 - (29 + 1448))) then
															v99 = v99 + 1;
															v107 = v95[v99];
															v326 = 1392 - (135 + 1254);
														end
														if (v326 == 0) then
															v215, v216 = v98(v105[v217](v21(v105, v217 + 1, v107[11 - 8])));
															v100 = (v216 + v217) - ((4 - 3) + 0 + 0);
															v326 = 1528 - (389 + 1138);
														end
														if (v326 == 1) then
															v214 = 574 - (102 + 472);
															for v553 = v217, v100 do
																local v554 = 0;
																while true do
																	if (v554 == (0 + 0)) then
																		v214 = v214 + 1;
																		v105[v553] = v215[v214];
																		break;
																	end
																end
															end
															v326 = 2;
														end
														if (v326 == (2 + 1)) then
															v217 = v107[(2 + 0) - (1545 - (320 + 1225))];
															v213 = 5;
															break;
														end
													end
												end
												if (v213 == (1 - 0)) then
													local v327 = 0;
													while true do
														if (v327 == (2 + 0)) then
															v107 = v95[v99];
															v105[v107[2]] = v75[v107[3]];
															v327 = 3;
														end
														if (v327 == (1465 - (157 + 1307))) then
															v105[v107[1861 - (821 + 1038)]] = v75[v107[7 - 4]];
															v99 = v99 + 1 + 0;
															v327 = 2;
														end
														if (v327 == 3) then
															v99 = v99 + 1;
															v213 = 3 - 1;
															break;
														end
														if (v327 == (0 + 0)) then
															v99 = v99 + (2 - 1);
															v107 = v95[v99];
															v327 = 1027 - (834 + 192);
														end
													end
												end
												if (v213 == (1 + 2)) then
													local v328 = 0;
													while true do
														if (v328 == 1) then
															v107 = v95[v99];
															v105[v107[2]] = v105[v107[1 + 2]] + v107[1 + 3];
															v328 = 2 - 0;
														end
														if (3 == v328) then
															v217 = v107[306 - (300 + 4)];
															v213 = 2 + 2;
															break;
														end
														if (v328 == (5 - 3)) then
															v99 = v99 + 1;
															v107 = v95[v99];
															v328 = 3;
														end
														if (v328 == (362 - (112 + 250))) then
															v105[v107[1 + 1]] = v105[v107[7 - 4]];
															v99 = v99 + 1 + 0;
															v328 = 1 + 0;
														end
													end
												end
												if (v213 == 13) then
													v100 = (v216 + v217) - (1 + 0);
													v214 = 442 - (207 + 209 + 20 + 6);
													for v409 = v217, v100 do
														local v410 = 1414 - (1001 + 413);
														local v411;
														while true do
															if (0 == v410) then
																v411 = 0 - 0;
																while true do
																	if (v411 == (882 - (244 + 638))) then
																		v214 = v214 + (694 - (627 + 66));
																		v105[v409] = v215[v214];
																		break;
																	end
																end
																break;
															end
														end
													end
													v99 = v99 + (2 - 1);
													v107 = v95[v99];
													v217 = v107[(608 - (512 + 90)) - (1910 - (1665 + 241))];
													v105[v217](v21(v105, v217 + 1, v100));
													break;
												end
												if (v213 == (729 - (373 + 344))) then
													v99 = v99 + 1 + 0;
													v107 = v95[v99];
													v105[v107[2]] = v105[v107[11 - 8]] % v107[4];
													v99 = v99 + 1 + 0;
													v107 = v95[v99];
													v217 = v107[5 - 3];
													v215, v216 = v98(v105[v217](v105[v217 + 1]));
													v213 = 21 - 8;
												end
												if (v213 == 9) then
													local v334 = 0;
													while true do
														if ((1099 - (35 + 1064)) == v334) then
															v99 = v99 + 1 + 0;
															v107 = v95[v99];
															v334 = 2 - 1;
														end
														if (2 == v334) then
															v107 = v95[v99];
															v217 = v107[1 + 1];
															v334 = 1239 - (298 + 938);
														end
														if (v334 == (1260 - (233 + 1026))) then
															v105[v107[1668 - (636 + 1030)]] = v105[v107[2 + 1]] + v107[4];
															v99 = v99 + 1;
															v334 = 2 + 0;
														end
														if (v334 == (1 + 2)) then
															v215, v216 = v98(v105[v217](v21(v105, v217 + (792 - (368 + 29 + 394)), v107[3])));
															v213 = 10;
															break;
														end
													end
												end
												if (v213 == (231 - (55 + 166))) then
													v100 = (v216 + v217) - (1 + 0);
													v214 = 0;
													for v412 = v217, v100 do
														local v413 = 0 + 0;
														while true do
															if (0 == v413) then
																v214 = v214 + (3 - 2);
																v105[v412] = v215[v214];
																break;
															end
														end
													end
													v99 = v99 + 1;
													v107 = v95[v99];
													v217 = v107[(303 - (36 + 261)) - (6 - 2)];
													v215, v216 = v98(v105[v217](v21(v105, v217 + (1369 - (34 + 1334)), v100)));
													v213 = 5 + 6;
												end
												if (v213 == 11) then
													local v337 = 0 + 0;
													while true do
														if (v337 == (1283 - (1035 + 248))) then
															v100 = (v216 + v217) - ((40 - (20 + 1)) - (6 + 4 + (327 - (134 + 185))));
															v214 = 1133 - (549 + 584);
															v337 = 1;
														end
														if (v337 == (687 - (314 + 371))) then
															v107 = v95[v99];
															v217 = v107[2];
															v337 = 10 - 7;
														end
														if (v337 == 3) then
															v105[v217] = v105[v217](v21(v105, v217 + (969 - (478 + 490)), v100));
															v213 = 12;
															break;
														end
														if (v337 == 1) then
															for v557 = v217, v100 do
																local v558 = 0 + 0;
																while true do
																	if ((1172 - (786 + 386)) == v558) then
																		v214 = v214 + (3 - 2);
																		v105[v557] = v215[v214];
																		break;
																	end
																end
															end
															v99 = v99 + (1380 - (1055 + 324));
															v337 = 1342 - (1093 + 247);
														end
													end
												end
												if (v213 == (2 + 0)) then
													local v338 = 0 + 0;
													while true do
														if (v338 == (3 - 2)) then
															v99 = v99 + (3 - 2);
															v107 = v95[v99];
															v338 = 5 - 3;
														end
														if ((0 - 0) == v338) then
															v107 = v95[v99];
															v105[v107[1 + 1]] = v75[v107[(30 - 22) - (17 - 12)]];
															v338 = 1;
														end
														if (v338 == (2 + 0)) then
															v105[v107[4 - 2]] = v105[v107[691 - (364 + 324)]];
															v99 = v99 + 1;
															v338 = 3;
														end
														if (v338 == (7 - 4)) then
															v107 = v95[v99];
															v213 = 3;
															break;
														end
													end
												end
												if (v213 == (14 - 8)) then
													v99 = v99 + 1;
													v107 = v95[v99];
													v105[v107[2]] = v105[v107[(2 + 4) - 3]];
													v99 = v99 + (4 - 3) + (0 - 0);
													v107 = v95[v99];
													v105[v107[5 - 3]] = #v105[v107[(1272 - (1249 + 19)) - (1 + 0)]];
													v99 = v99 + (3 - 2);
													v213 = 1093 - (686 + 400);
												end
											end
										end
									elseif (v108 <= (14 + 3)) then
										if (v108 <= 15) then
											local v165 = 229 - (73 + 156);
											local v166;
											local v167;
											while true do
												if (v165 == (1 + 0)) then
													while true do
														if (v166 == (811 - (721 + 90))) then
															v167 = v107[1 + 1];
															v105[v167] = v105[v167](v21(v105, v167 + (3 - 2), v107[(472 - (224 + 246)) + (1 - 0)]));
															break;
														end
													end
													break;
												end
												if (v165 == (0 - 0)) then
													v166 = 0 + 0;
													v167 = nil;
													v165 = 1;
												end
											end
										elseif (v108 == (1 + 15)) then
											local v218 = 0 + 0;
											local v219;
											local v220;
											while true do
												if (v218 == (0 - 0)) then
													v219 = 0;
													v220 = nil;
													v218 = 3 - 2;
												end
												if ((514 - (203 + 310)) == v218) then
													while true do
														if (v219 == 0) then
															v220 = v107[1995 - (1238 + 755)];
															v105[v220] = v105[v220](v105[v220 + 1 + 0]);
															break;
														end
													end
													break;
												end
											end
										else
											v105[v107[(1537 - (709 + 825)) - 1]] = #v105[v107[4 - 1]];
										end
									elseif (v108 <= (25 - 7)) then
										for v191 = v107[866 - (196 + 668)], v107[11 - 8] do
											v105[v191] = nil;
										end
									elseif (v108 == 19) then
										v105[v107[3 - 1]] = {};
									else
										local v223 = 0;
										local v224;
										local v225;
										local v226;
										local v227;
										while true do
											if (v223 == 2) then
												while true do
													if ((835 - (171 + 662)) == v224) then
														if (v226 > ((531 - (4 + 89)) - ((508 - 363) + 107 + 186))) then
															if (v227 <= v105[v225 + 1]) then
																local v591 = 0 - 0;
																local v592;
																while true do
																	if (v591 == (0 + 0)) then
																		v592 = 0;
																		while true do
																			if (v592 == (1486 - (35 + 1451))) then
																				v99 = v107[433 - (44 + (1839 - (28 + 1425)))];
																				v105[v225 + 3] = v227;
																				break;
																			end
																		end
																		break;
																	end
																end
															end
														elseif (v227 >= v105[v225 + 1]) then
															local v593 = 0;
															local v594;
															while true do
																if (v593 == (1993 - (941 + 1052))) then
																	v594 = 0;
																	while true do
																		if (v594 == (0 + 0)) then
																			v99 = v107[1517 - (822 + 692)];
																			v105[v225 + ((2125 - 636) - (471 + 527 + (785 - (45 + 252))))] = v227;
																			break;
																		end
																	end
																	break;
																end
															end
														end
														break;
													end
													if (v224 == (1 + 0)) then
														local v479 = 0 + 0;
														while true do
															if (v479 == (0 - 0)) then
																v227 = v105[v225] + v226;
																v105[v225] = v227;
																v479 = 434 - (114 + 319);
															end
															if ((1 - 0) == v479) then
																v224 = 2;
																break;
															end
														end
													end
													if (v224 == 0) then
														local v480 = 0 - 0;
														while true do
															if (v480 == (0 + 0)) then
																v225 = v107[2 - 0];
																v226 = v105[v225 + (3 - 1)];
																v480 = 1964 - (556 + 1407);
															end
															if (v480 == (1207 - (741 + 465))) then
																v224 = 466 - (170 + 295);
																break;
															end
														end
													end
												end
												break;
											end
											if (v223 == (0 + 0)) then
												v224 = 0 + 0;
												v225 = nil;
												v223 = 2 - 1;
											end
											if ((1 + 0) == v223) then
												v226 = nil;
												v227 = nil;
												v223 = 2 + 0;
											end
										end
									end
								elseif (v108 <= (18 + 13)) then
									if (v108 <= (1255 - (957 + 273))) then
										if (v108 <= (6 + 16)) then
											if (v108 == (9 + 12)) then
												local v168 = 0 - 0;
												local v169;
												while true do
													if (v168 == 0) then
														v169 = v107[5 - 3];
														do
															return v21(v105, v169, v100);
														end
														break;
													end
												end
											else
												v105[v107[2]] = v105[v107[9 - 6]];
											end
										elseif (v108 <= (113 - 90)) then
											local v172 = 1780 - (389 + 1391);
											local v173;
											local v174;
											local v175;
											while true do
												if (v172 == 1) then
													v175 = v105[v173 + 2 + 0];
													if (v175 > (0 + 0)) then
														if (v174 > v105[v173 + (2 - 1)]) then
															v99 = v107[954 - (783 + 168)];
														else
															v105[v173 + 3] = v174;
														end
													elseif (v174 < v105[v173 + 1]) then
														v99 = v107[9 - 6];
													else
														v105[v173 + 3 + 0] = v174;
													end
													break;
												end
												if (v172 == 0) then
													v173 = v107[313 - (309 + 2)];
													v174 = v105[v173];
													v172 = 1;
												end
											end
										elseif (v108 == (73 - 49)) then
											v105[v107[1214 - (1090 + 122)]] = v107[1 + 0 + (6 - 4)] + v105[v107[4 + 0 + 0]];
										else
											v105[v107[1120 - (628 + 490)]] = v76[v107[3]];
											v99 = v99 + 1 + 0;
											v107 = v95[v99];
											v105[v107[4 - 2]] = v105[v107[13 - 10]][v107[778 - (431 + 343)]];
											v99 = v99 + 1;
											v107 = v95[v99];
											v105[v107[2]] = v76[v107[3]];
											v99 = v99 + 1;
											v107 = v95[v99];
											v105[v107[3 - 1]] = v105[v107[3]][v107[11 - 7]];
											v99 = v99 + 1 + 0;
											v107 = v95[v99];
											v105[v107[1 + 1]] = v76[v107[1698 - (556 + 1139)]];
											v99 = v99 + (16 - (6 + 9));
											v107 = v95[v99];
											v105[v107[2]] = v105[v107[1 + 2]][v107[3 + 1]];
											v99 = v99 + 1;
											v107 = v95[v99];
											v105[v107[2]] = v76[v107[(944 - (28 + 141)) - (78 + 123 + 571)]];
											v99 = v99 + 1;
											v107 = v95[v99];
											if not v105[v107[2 - 0]] then
												v99 = v99 + (1139 - (83 + 33 + (2339 - (486 + 831))));
											else
												v99 = v107[3];
											end
										end
									elseif (v108 <= (72 - 44)) then
										if (v108 <= 26) then
											local v176 = 0;
											local v177;
											local v178;
											local v179;
											local v180;
											while true do
												if (v176 == (3 - 2)) then
													local v283 = 0 + 0;
													while true do
														if (v283 == (3 - 2)) then
															v176 = 2;
															break;
														end
														if (v283 == 0) then
															v100 = (v179 + v177) - (1264 - (668 + 595));
															v180 = 0;
															v283 = 1;
														end
													end
												end
												if (v176 == (0 + 0)) then
													v177 = v107[2];
													v178, v179 = v98(v105[v177](v21(v105, v177 + (4 - (1 + 2)), v107[3])));
													v176 = 2 - 1;
												end
												if (v176 == 2) then
													for v293 = v177, v100 do
														local v294 = 290 - (23 + 267);
														while true do
															if (v294 == (1944 - (1129 + 815))) then
																v180 = v180 + 1;
																v105[v293] = v178[v180];
																break;
															end
														end
													end
													break;
												end
											end
										elseif (v108 == ((403 - (371 + 16)) + (1761 - (1326 + 424)))) then
											local v241 = 0 - 0;
											local v242;
											local v243;
											local v244;
											local v245;
											local v246;
											while true do
												if (v241 == (3 - 2)) then
													v244 = nil;
													v245 = nil;
													v241 = 2;
												end
												if (v241 == (118 - (88 + 30))) then
													v242 = 0;
													v243 = nil;
													v241 = 772 - (720 + 51);
												end
												if (v241 == 2) then
													v246 = nil;
													while true do
														if (v242 == (4 - 2)) then
															for v559 = v243, v100 do
																local v560 = 0;
																while true do
																	if (v560 == (1776 - (421 + 1355))) then
																		v246 = v246 + (1 - 0);
																		v105[v559] = v244[v246];
																		break;
																	end
																end
															end
															break;
														end
														if (v242 == (0 + 0)) then
															local v481 = 1083 - (286 + 797);
															while true do
																if (v481 == (3 - 2)) then
																	v242 = 1 - 0;
																	break;
																end
																if (v481 == 0) then
																	v243 = v107[(446 - (397 + 42)) - 5];
																	v244, v245 = v98(v105[v243](v21(v105, v243 + 1 + 0, v100)));
																	v481 = 1;
																end
															end
														end
														if (v242 == (801 - (24 + 776))) then
															v100 = (v245 + v243) - (1 - 0);
															v246 = 785 - (222 + 563);
															v242 = 3 - 1;
														end
													end
													break;
												end
											end
										else
											v105[v107[2]] = v76[v107[3]];
										end
									elseif (v108 <= (21 + 8)) then
										v105[v107[2]][v105[v107[193 - (23 + 167)]]] = v105[v107[1802 - (690 + 1108)]];
									elseif (v108 == (11 + 19)) then
										v105[v107[2 + 0]] = v107[(858 - (40 + 808)) - (2 + 5)];
									else
										local v251 = 0;
										local v252;
										local v253;
										local v254;
										while true do
											if (v251 == (0 - 0)) then
												v252 = nil;
												v253 = nil;
												v254 = nil;
												v105[v107[2]] = {};
												v251 = 1 + 0;
											end
											if (v251 == 4) then
												v253 = v105[v254];
												v252 = v105[v254 + 2 + 0];
												if (v252 > ((472 + 387) - ((1385 - (47 + 524)) + 45))) then
													if (v253 > v105[v254 + 1 + 0]) then
														v99 = v107[8 - 5];
													else
														v105[v254 + (4 - 1)] = v253;
													end
												elseif (v253 < v105[v254 + 1]) then
													v99 = v107[6 - 3];
												else
													v105[v254 + 3] = v253;
												end
												break;
											end
											if ((1729 - (1165 + 561)) == v251) then
												local v346 = 0 + 0;
												while true do
													if (v346 == 2) then
														v251 = 12 - 8;
														break;
													end
													if (v346 == (0 + 0)) then
														v105[v107[481 - (341 + 138)]] = v107[1 + 2];
														v99 = v99 + (1 - 0);
														v346 = 1;
													end
													if (v346 == (327 - (89 + 237))) then
														v107 = v95[v99];
														v254 = v107[6 - 4];
														v346 = 3 - 1;
													end
												end
											end
											if (v251 == (883 - (581 + 300))) then
												local v347 = 0;
												while true do
													if (v347 == (1222 - (855 + 365))) then
														v251 = 3;
														break;
													end
													if (v347 == (0 - 0)) then
														v107 = v95[v99];
														v105[v107[1 + 1]] = #v105[v107[1238 - (1030 + 205)]];
														v347 = 1 + 0;
													end
													if (v347 == 1) then
														v99 = v99 + 1 + 0;
														v107 = v95[v99];
														v347 = 288 - (156 + 130);
													end
												end
											end
											if (v251 == (2 - 1)) then
												v99 = v99 + (1 - 0);
												v107 = v95[v99];
												v105[v107[3 - 1]] = v107[1 + 2];
												v99 = v99 + 1 + 0;
												v251 = 71 - (10 + 59);
											end
										end
									end
								elseif (v108 <= (11 + 25)) then
									if (v108 <= 33) then
										if (v108 == ((384 - 306) - 46)) then
											if not v105[v107[1165 - (671 + 492)]] then
												v99 = v99 + 1 + 0;
											else
												v99 = v107[1 + (1217 - (369 + 846))];
											end
										else
											local v183 = 0 + 0;
											local v184;
											local v185;
											local v186;
											while true do
												if (v183 == 1) then
													v186 = nil;
													while true do
														if (v184 == (0 + 0)) then
															v185 = v107[1947 - (1036 + 909)];
															v186 = {};
															v184 = 1 + 0;
														end
														if (v184 == (1 - 0)) then
															for v425 = 204 - (11 + 192), #v104 do
																local v426 = v104[v425];
																for v489 = 0, #v426 do
																	local v490 = v426[v489];
																	local v491 = v490[1 + 0 + (175 - (135 + 40))];
																	local v492 = v490[4 - 2];
																	if ((v491 == v105) and (v492 >= v185)) then
																		local v565 = 0 + 0;
																		local v566;
																		while true do
																			if (v565 == (0 - 0)) then
																				v566 = 0 - 0;
																				while true do
																					if (v566 == (176 - (50 + 126))) then
																						v186[v492] = v491[v492];
																						v490[2 - 1] = v186;
																						break;
																					end
																				end
																				break;
																			end
																		end
																	end
																end
															end
															break;
														end
													end
													break;
												end
												if (v183 == 0) then
													v184 = 0 + 0;
													v185 = nil;
													v183 = 1;
												end
											end
										end
									elseif (v108 <= (919 - ((1674 - (1233 + 180)) + (1593 - (522 + 447))))) then
										local v187 = 1421 - (107 + 1314);
										local v188;
										while true do
											if (v187 == (0 + 0)) then
												v188 = v107[5 - 3];
												v105[v188](v21(v105, v188 + 1, v100));
												break;
											end
										end
									elseif (v108 == (62 - (12 + 15))) then
										local v256 = 0;
										local v257;
										local v258;
										while true do
											if (v256 == (1 - 0)) then
												while true do
													if (v257 == (0 - 0)) then
														v258 = v107[2];
														v105[v258](v105[v258 + (1911 - (716 + 1194))]);
														break;
													end
												end
												break;
											end
											if (v256 == (0 + 0)) then
												v257 = 0 + 0;
												v258 = nil;
												v256 = 1;
											end
										end
									else
										local v259 = 0;
										local v260;
										while true do
											if ((503 - (74 + 429)) == v259) then
												v260 = nil;
												v105[v107[(2086 - 1004) - (506 + 514 + (137 - 77))]] = v76[v107[3 + 0]];
												v99 = v99 + (2 - 1);
												v259 = 1;
											end
											if (v259 == 4) then
												v99 = v99 + ((7 - 4) - (435 - (279 + 154)));
												v107 = v95[v99];
												v105[v107[780 - (454 + 324)]]();
												v259 = 4 + 1;
											end
											if ((18 - (12 + 5)) == v259) then
												v107 = v95[v99];
												v105[v107[2 + 0]] = v75[v107[7 - 4]];
												v99 = v99 + 1;
												v259 = 1 + 1;
											end
											if (v259 == (1095 - (277 + 816))) then
												v107 = v95[v99];
												v105[v107[(6089 - 4664) - (630 + (1976 - (1058 + 125)))]] = v105[v107[3]][v107[1 + 3]];
												v99 = v99 + 1;
												v259 = 978 - (815 + 160);
											end
											if ((12 - 9) == v259) then
												v107 = v95[v99];
												v260 = v107[4 - 2];
												v105[v260] = v105[v260](v105[v260 + 1]);
												v259 = 1 + 3;
											end
											if (v259 == 5) then
												v99 = v99 + 1;
												v107 = v95[v99];
												do
													return;
												end
												break;
											end
										end
									end
								elseif (v108 <= (113 - 74)) then
									if (v108 <= 37) then
										do
											return v105[v107[(1907 - (41 + 1857)) - (1900 - (1222 + 671))]]();
										end
									elseif (v108 == 38) then
										local v261 = 0 - 0;
										local v262;
										local v263;
										while true do
											if ((1 - 0) == v261) then
												while true do
													if (v262 == (1182 - (229 + 953))) then
														v263 = v107[1776 - (1111 + 663)];
														do
															return v105[v263](v21(v105, v263 + 1, v107[3]));
														end
														break;
													end
												end
												break;
											end
											if (v261 == 0) then
												v262 = 1579 - (874 + 705);
												v263 = nil;
												v261 = 1 + 0;
											end
										end
									else
										v105[v107[2 + 0]] = v75[v107[6 - 3]];
									end
								elseif (v108 <= 40) then
									v105[v107[1 + 0 + 1]] = v105[v107[682 - (642 + 37)]] + v107[1 + 3];
								elseif (v108 == (7 + 34)) then
									if (v105[v107[2]] == v107[9 - 5]) then
										v99 = v99 + 1;
									else
										v99 = v107[457 - (233 + 221)];
									end
								else
									v105[v107[2]] = v105[v107[6 - 3]] % v107[4 + 0];
								end
								v99 = v99 + (1542 - (718 + 823));
								break;
							end
							if (v120 == 0) then
								v107 = v95[v99];
								v108 = v107[1];
								v120 = 1 + 0;
							end
						end
					end
					break;
				end
			end
		end;
	end
	return v41(v40(), {}, v29)(...);
end
return v23("LOL!0D3Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E7365727403053Q006D6174636803083Q00746F6E756D62657203053Q007063612Q6C00243Q0012193Q00013Q00206Q000200122Q000100013Q00202Q00010001000300122Q000200013Q00202Q00020002000400122Q000300053Q00062Q0003000A000100010004093Q000A000100121C000300063Q00200600040003000700121C000500083Q00200600050005000900121C000600083Q00200600060006000A00060800073Q000100062Q00163Q00064Q00168Q00163Q00044Q00163Q00014Q00163Q00024Q00163Q00053Q00121C000800013Q00200600080008000B00121C0009000C3Q00121C000A000D3Q000608000B0001000100052Q00163Q00074Q00163Q00094Q00163Q00084Q00163Q000A4Q00163Q000B4Q0016000C000B4Q0025000C00014Q0015000C6Q00043Q00013Q00023Q00023Q00026Q00F03F026Q00704002264Q001F00025Q00122Q000300016Q00045Q00122Q000500013Q00042Q0003002100012Q002700076Q000D000800026Q000900016Q000A00026Q000B00036Q000C00046Q000D8Q000E00063Q00202Q000F000600014Q000C000F6Q000B3Q00024Q000C00036Q000D00046Q000E00016Q000F00016Q000F0006000F00102Q000F0001000F4Q001000016Q00100006001000102Q00100001001000202Q0010001000014Q000D00106Q000C8Q000A3Q000200202Q000A000A00024Q0009000A6Q00073Q00010004140003000500012Q0027000300054Q0016000400024Q0026000300044Q001500036Q00043Q00017Q00043Q00027Q004003053Q003A25642B3A2Q033Q0025642B026Q00F03F001C3Q0006085Q000100012Q00278Q000E000100016Q000200026Q000300026Q00048Q000500036Q00068Q000700076Q000500076Q00043Q0001002006000400040001001207000500026Q00030005000200122Q000400036Q000200046Q00013Q000200262Q00010018000100040004093Q001800012Q001600016Q001300026Q0026000100024Q001500015Q0004093Q001B00012Q0027000100044Q0025000100014Q001500016Q00043Q00013Q00013Q00113Q002Q033Q0073796E03073Q0072657175657374030C3Q00682Q74705F7265717565737403023Q005F47030B3Q00EEE2C90BD988D31FD6C68303083Q007EB1A3BB4586DBA72Q012Q033Q0016DF2603053Q009C43AD4AA5035C3Q003CA35D06AF7C097BA54801F2214F20BF5C14A9354326B44618A8234820F94A19B1697031AF461AF1204F38B25A59BD34453CF85B13BA35093CB24812AF694B35BE4759AF324720BE4A29BF294820B24702F3355235B04C4FF22A533503073Q002654D72976DC4603063Q007D13361AF15403053Q009E307642722Q033Q008C012403073Q009BCB44705613C503053Q007063612Q6C026Q00F03F01303Q0006013Q002E00013Q0004093Q002E000100121C000100013Q0006010001000900013Q0004093Q0009000100121C000100013Q0020060001000100020006200001000D000100010004093Q000D000100121C000100033Q0006200001000D000100010004093Q000D000100121C000100023Q00121C000200044Q000B00035Q00122Q000400053Q00122Q000500066Q00030005000200202Q0002000300074Q000200016Q00033Q00024Q00045Q00122Q000500083Q00122Q000600096Q0004000600024Q00055Q00122Q0006000A3Q00122Q0007000B6Q0005000700024Q0003000400054Q00045Q00122Q0005000C3Q00122Q0006000D6Q0004000600024Q00055Q00122Q0006000E3Q00122Q0007000F6Q0005000700024Q0003000400054Q00020002000200122Q000300103Q00060800043Q000100012Q00163Q00024Q00230003000200012Q002100015Q0004093Q002F000100200600013Q00112Q00043Q00013Q00013Q00023Q00030A3Q006C6F6164737472696E6703043Q00426F647900063Q0012243Q00016Q00015Q00202Q0001000100026Q000200026Q000100016Q00017Q00", v17(), ...);
