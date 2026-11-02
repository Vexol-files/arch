-- [ Archnemesis Obfuscator v3 ]
local v0 = tonumber;
local v1 = string.byte;
local v2 = string.char;
local v3 = string.sub;
local v4 = string.gsub;
local v5 = string.rep;
local v6 = table.concat;
local v7 = table.insert;
local v8 = math.ldexp;
local v9 = getfenv or function()
	return _ENV;
end;
local v10 = setmetatable;
local v11 = pcall;
local v12 = select;
local v13 = unpack or table.unpack;
local v14 = tonumber;
local function v15(v16, v17, ...)
	local v18 = 575 - (507 + 67);
	local v19;
	v16 = v4(v3(v16, 1754 - (1013 + 736)), "..", function(v30)
		if (v1(v30, 184 - (156 + 26)) == (68 + 13)) then
			v19 = v0(v3(v30, 2 - 1, 3 - 2));
			return "";
		else
			local v86 = 867 - (550 + 317);
			local v87;
			while true do
				if (v86 == (117 - (39 + 78))) then
					v87 = v2(v0(v30, 22 - 6));
					if v19 then
						local v103 = v5(v87, v19);
						v19 = nil;
						return v103;
					else
						return v87;
					end
					break;
				end
			end
		end
	end);
	local function v20(v31, v32, v33)
		if v33 then
			local v88 = (v31 / ((2 - 0) ^ (v32 - ((2593 - 1665) - ((597 - 383) + 429 + 284))))) % (((286 - (134 + 151)) + (1666 - (970 + 695))) ^ (((v33 - (1 - 0)) - (v32 - ((1992 - (582 + 1408)) - (3 - 2)))) + ((2 - 0) - ((4789 - 3518) - ((277 - (12 + 39)) + (2868 - (1195 + 629)))))));
			return v88 - (v88 % ((1 - 0) - (241 - (187 + 54))));
		else
			local v89 = (4 - (1 + 1)) ^ (v32 - ((1400 - (162 + 618)) - (((1693 + 723) - (1240 + 621)) + (136 - 72))));
			return (((v31 % (v89 + v89)) >= v89) and ((1566 - 634) - (68 + 789 + (1710 - (1373 + 263))))) or (568 - ((1367 - (451 + 549)) + 64 + 137));
		end
	end
	local function v21()
		local v34 = 1710 - (1596 + 114);
		local v35;
		while true do
			if (v34 == (1 - 0)) then
				return v35;
			end
			if (v34 == (713 - (164 + 549))) then
				v35 = v1(v16, v18, v18);
				v18 = v18 + (1439 - (1059 + 379));
				v34 = 1 - 0;
			end
		end
	end
	local function v22()
		local v36 = 0 - 0;
		local v37;
		local v38;
		local v39;
		while true do
			if (v36 == (1385 - (746 + 638))) then
				v39 = nil;
				while true do
					local v93 = 0 + 0;
					while true do
						if ((0 + 0) == v93) then
							if (v37 == (1 + (0 - 0))) then
								return (v39 * (57 + ((890 - (218 + 123)) - ((1668 - (1535 + 46)) + 262 + 1)))) + v38;
							end
							if (v37 == (0 + 0)) then
								v38, v39 = v1(v16, v18, v18 + ((1519 - (306 + 254)) - (769 + 123 + 5 + 60)));
								v18 = v18 + (4 - 2);
								v37 = (1 - 0) - (1467 - (899 + 568));
							end
							break;
						end
					end
				end
				break;
			end
			if (v36 == (0 + 0)) then
				v37 = (282 - 165) - ((635 - (268 + 335)) + ((492 - 337) - (360 - (60 + 230))));
				v38 = nil;
				v36 = 573 - (426 + 146);
			end
		end
	end
	local function v23()
		local v40 = 0 + 0;
		local v41;
		local v42;
		local v43;
		local v44;
		local v45;
		while true do
			if (v40 == 1) then
				v43 = nil;
				v44 = nil;
				v40 = 1458 - (282 + 1174);
			end
			if ((811 - (569 + 242)) == v40) then
				v41 = (518 - 338) - (((9 + 142) - (316 - 232)) + (1137 - (706 + 318)));
				v42 = nil;
				v40 = 1252 - (721 + 530);
			end
			if (v40 == (1273 - (945 + 326))) then
				v45 = nil;
				while true do
					if (v41 == ((795 - (413 + 381)) + 0 + 0)) then
						return (v45 * ((25972522 - 13760571) + 4565265)) + (v44 * ((417959 - 257058) - ((210578 - (582 + 1388)) - (192946 - 79703)))) + (v43 * ((471 - 282) + 60 + 7)) + v42;
					end
					if (v41 == ((700 - (271 + 429)) - 0)) then
						v42, v43, v44, v45 = v1(v16, v18, v18 + 2 + 0 + (1501 - (1408 + 92)));
						v18 = v18 + (956 - ((1888 - (461 + 625)) + (1438 - (993 + 295))));
						v41 = (62 + 1126) - ((1357 - (418 + 753)) + 337 + 546 + 13 + 105);
					end
				end
				break;
			end
		end
	end
	local function v24()
		local v46 = 1664 - (1269 + 395);
		local v47;
		local v48;
		local v49;
		local v50;
		local v51;
		local v52;
		while true do
			if (v46 == (493 - (76 + 416))) then
				v49 = (1 + 0) - (0 + 0);
				v50 = (v20(v48, (530 - (406 + 123)) + ((1866 - (564 + 443)) - ((2253 - 1439) + (1814 - (1749 + 20)))), 20) * (((189 + 604) - ((1690 - (1249 + 73)) + 151 + 272)) ^ (100 - (1213 - (466 + 679))))) + v47;
				v46 = 1 + 1;
			end
			if (v46 == (6 - 3)) then
				if (v51 == ((2255 - (772 + 1045)) - ((414 - 269) + (2193 - (106 + 1794))))) then
					if (v50 == ((137 + 293) - (12 + 32 + (1139 - 753)))) then
						return v52 * (0 - 0);
					else
						v51 = ((195 - (4 + 110)) + (1990 - (57 + 527))) - ((2425 - (41 + 1386)) + (591 - (17 + 86)));
						v49 = 0 + 0 + (0 - 0);
					end
				elseif (v51 == ((2025 - (136 + 212)) + (1071 - 701))) then
					return ((v50 == ((938 - (122 + 44)) - ((346 - 145) + (1894 - 1323)))) and (v52 * (((927 + 212) - (17 + 99 + 1022)) / ((0 - 0) - (65 - (30 + 35)))))) or (v52 * NaN);
				end
				return v8(v52, v51 - (147 + 66 + (1385 - 997) + 250 + 172)) * (v49 + (v50 / (((1264 - (1043 + 214)) - (18 - 13)) ^ ((1396 - (323 + 889)) - ((83 + 934) - ((702 - 441) + (1204 - (361 + 219))))))));
			end
			if (v46 == (322 - (53 + 267))) then
				v51 = v20(v48, (9 + 30) - ((423 - (15 + 398)) + 8), (1101 - (18 + 964)) - (331 - 243));
				v52 = ((v20(v48, 474 - ((1124 - 708) + 16 + 10)) == ((7 - 4) - (2 + 0))) and -(1 + 0 + (1761 - (1730 + 31)))) or ((851 - (20 + 830)) - ((0 + 0) - (126 - (116 + 10))));
				v46 = 3;
			end
			if (v46 == (0 + 0)) then
				v47 = v23();
				v48 = v23();
				v46 = 739 - (542 + 196);
			end
		end
	end
	local function v25(v53)
		local v54;
		if not v53 then
			local v90 = 0 - 0;
			while true do
				if ((0 + 0) == v90) then
					v53 = v23();
					if (v53 == ((0 + 0) - (0 + 0))) then
						return "";
					end
					break;
				end
			end
		end
		v54 = v3(v16, v18, (v18 + v53) - ((927 + 154) - ((2687 - 1667) + (153 - 93))));
		v18 = v18 + v53;
		local v55 = {};
		for v69 = 1, #v54 do
			v55[v69] = v2(v1(v3(v54, v69, v69)));
		end
		return v6(v55);
	end
	local v26 = v23;
	local function v27(...)
		return {...}, v12("#", ...);
	end
	local function v28()
		local v56 = (function()
			return (1766 - (459 + 1307)) + (1870 - (474 + 1396));
		end)();
		local v57 = (function()
			return;
		end)();
		local v58 = (function()
			return;
		end)();
		local v59 = (function()
			return;
		end)();
		local v60 = (function()
			return;
		end)();
		local v61 = (function()
			return;
		end)();
		local v62 = (function()
			return;
		end)();
		while true do
			local v71 = (function()
				return (1551 - (1126 + 425)) + (405 - (118 + 287));
			end)();
			while true do
				if (v71 ~= ((6627 - 4936) - ((1330 - (118 + 1003)) + (4334 - 2853)))) then
				else
					if (v56 == ((382 - (142 + 235)) - (13 - 10))) then
						for v104 = #",", v23() do
							local v105 = (function()
								return (3279 - 2134) - (102 + 364 + (2266 - 1587));
							end)();
							local v106 = (function()
								return;
							end)();
							local v107 = (function()
								return;
							end)();
							while true do
								if (v105 == ((2614 - (553 + 424)) - ((2595 - 1222) + 232 + 31))) then
									while true do
										if (v106 == ((992 + 8) - (263 + 188 + (1968 - (374 + 1045))))) then
											v107 = (function()
												return v21();
											end)();
											if (v20(v107, #"\\", #"{") ~= (0 - (0 + 0))) then
											else
												local v122 = 0 - 0;
												local v123;
												local v124;
												local v125;
												local v126;
												while true do
													if (v122 == 1) then
														v125 = (function()
															return;
														end)();
														v126 = (function()
															return;
														end)();
														v122 = 1 + 1;
													end
													if (v122 == (2 + 0)) then
														while true do
															if (((0 - 0) - 0) == v123) then
																local v433 = (function()
																	return (0 - 0) - 0;
																end)();
																local v434 = (function()
																	return;
																end)();
																while true do
																	if (v433 ~= ((3098 - 1714) - (487 + 259 + 186 + 452))) then
																	else
																		v434 = (function()
																			return (0 - 0) + (0 - 0);
																		end)();
																		while true do
																			if (v434 == ((1494 - (1307 + 187)) + (753 - (239 + 514)))) then
																				local v540 = 0 + 0;
																				while true do
																					if (v540 == (1329 - (797 + 532))) then
																						v124 = (function()
																							return v20(v107, (2 - 1) + 1, #"19(");
																						end)();
																						v125 = (function()
																							return v20(v107, #"?id=", (691 - (232 + 451)) - (2 + 0));
																						end)();
																						v540 = 1 + 0;
																					end
																					if (v540 == 1) then
																						v434 = (function()
																							return (1 + 1) - (2 - 1);
																						end)();
																						break;
																					end
																				end
																			end
																			if (v434 ~= (342 - ((1420 - (373 + 829)) + (854 - (476 + 255))))) then
																			else
																				v123 = (function()
																					return (2712 - (369 + 761)) - (888 + 647 + (83 - 37));
																				end)();
																				break;
																			end
																		end
																		break;
																	end
																end
															end
															if (v123 ~= ((3 - 1) + 0)) then
															else
																local v435 = 0 - 0;
																while true do
																	if (v435 == (238 - (64 + 174))) then
																		if (v20(v125, #"\\", #"|") == #"]") then
																			v126[1 + 1] = (function()
																				return v62[v126[(1089 - (830 + 258)) + (1 - 0)]];
																			end)();
																		end
																		if (v20(v125, (898 - (144 + 192)) - (261 + 45 + (470 - (42 + 174))), 7 - 5) == #"<") then
																			v126[#"xxx"] = (function()
																				return v62[v126[#"91("]];
																			end)();
																		end
																		v435 = 1 + 0;
																	end
																	if (v435 == (1 + 0)) then
																		v123 = (function()
																			return (2 - 1) + 1 + 1;
																		end)();
																		break;
																	end
																end
															end
															if (v123 ~= ((6 - 3) + (0 - 0))) then
															else
																if (v20(v125, #"-19", #"nil") == #"[") then
																	v126[#"xnxx"] = (function()
																		return v62[v126[#"0313"]];
																	end)();
																end
																v57[v104] = (function()
																	return v126;
																end)();
																break;
															end
															if (v123 ~= ((1 + 0) - 0)) then
															else
																local v437 = (function()
																	return 1467 - ((2403 - (363 + 1141)) + (2148 - (1183 + 397)));
																end)();
																while true do
																	if (((5 - 3) - (1 + 0)) == v437) then
																		v123 = (function()
																			return (126 + 42) - ((2097 - (1913 + 62)) + 28 + 16);
																		end)();
																		break;
																	end
																	if (v437 == ((0 - 0) + (1933 - (565 + 1368)))) then
																		v126 = (function()
																			return {v22(),v22(),nil,nil};
																		end)();
																		if (v124 == ((0 + 0) - (856 - (564 + 292)))) then
																			local v528 = 0 + 0;
																			local v529;
																			local v530;
																			while true do
																				if (v528 == (0 + 0)) then
																					v529 = (function()
																						return (0 - 0) - (0 + 0);
																					end)();
																					v530 = (function()
																						return;
																					end)();
																					v528 = 2 - 1;
																				end
																				if (v528 == (305 - (244 + 60))) then
																					while true do
																						if (v529 ~= (603 - (207 + 61 + (811 - (41 + 435))))) then
																						else
																							v530 = (function()
																								return (1291 - (938 + 63)) - (47 + 13 + (426 - 196));
																							end)();
																							while true do
																								if (v530 == ((1066 - (415 + 79)) - ((1551 - (936 + 189)) + 49 + 97))) then
																									v126[#"xxx"] = (function()
																										return v22();
																									end)();
																									v126[#".com"] = (function()
																										return v22();
																									end)();
																									break;
																								end
																							end
																							break;
																						end
																					end
																					break;
																				end
																			end
																		elseif (v124 == #"|") then
																			v126[#"-19"] = (function()
																				return v23();
																			end)();
																		elseif (v124 == (1615 - (1565 + 48))) then
																			v126[#"gha"] = (function()
																				return v23() - ((1 + 0 + (1 - 0)) ^ (1154 - (782 + 356)));
																			end)();
																		elseif (v124 == #"xxx") then
																			local v552 = 0;
																			local v553;
																			local v554;
																			while true do
																				if (v552 == (1 + 0)) then
																					while true do
																						if (((1723 - (176 + 91)) - ((734 - 452) + (1729 - 555))) == v553) then
																							v554 = (function()
																								return (322 + 489) - ((1661 - (975 + 117)) + 242);
																							end)();
																							while true do
																								if (v554 ~= ((1875 - (157 + 1718)) - (0 + 0))) then
																								else
																									v126[#"-19"] = (function()
																										return v23() - ((1 + 0 + 1 + 0) ^ ((167 + 873) - ((1529 - 823) + (1128 - 810))));
																									end)();
																									v126[#"?id="] = (function()
																										return v22();
																									end)();
																									break;
																								end
																							end
																							break;
																						end
																					end
																					break;
																				end
																				if (v552 == (0 - 0)) then
																					v553 = (function()
																						return (1083 - (697 + 321)) - (5 + 25 + (95 - 60));
																					end)();
																					v554 = (function()
																						return;
																					end)();
																					v552 = 1 - 0;
																				end
																			end
																		end
																		v437 = (function()
																			return (6 - 3) - (1 + 1);
																		end)();
																	end
																end
															end
														end
														break;
													end
													if (v122 == (0 - 0)) then
														v123 = (function()
															return (0 - 0) + 0;
														end)();
														v124 = (function()
															return;
														end)();
														v122 = 1 + 0;
													end
												end
											end
											break;
										end
									end
									break;
								end
								if (v105 ~= (0 - 0)) then
								else
									local v111 = 1227 - (322 + 905);
									local v112;
									local v113;
									while true do
										if (v111 == (612 - (602 + 9))) then
											while true do
												if (v112 ~= (1189 - (449 + 740))) then
												else
													v113 = (function()
														return (2108 - (289 + 548)) - ((2763 - (821 + 997)) + (1198 - (826 + 46)));
													end)();
													while true do
														if ((948 - (245 + 702)) ~= v113) then
														else
															v105 = (function()
																return (6 - 4) - (1502 - (251 + 1250));
															end)();
															break;
														end
														if (((103 + 217) - ((1951 - (260 + 1638)) + (707 - (382 + 58)))) == v113) then
															v106 = (function()
																return (0 - 0) + 0 + 0;
															end)();
															v107 = (function()
																return nil;
															end)();
															v113 = (function()
																return (1 - 0) + (0 - 0);
															end)();
														end
													end
													break;
												end
											end
											break;
										end
										if (v111 == (1205 - (902 + 303))) then
											v112 = (function()
												return 1251 - ((1582 - 861) + (1276 - 746));
											end)();
											v113 = (function()
												return;
											end)();
											v111 = 1 + 0;
										end
									end
								end
							end
						end
						for v108 = #" ", v23() do
							v58[v108 - #"!"] = (function()
								return v28();
							end)();
						end
						return v60;
					end
					break;
				end
				if (v71 == ((542 - (118 + 11)) - ((1705 - (1121 + 569)) + (612 - (22 + 192))))) then
					if (v56 ~= (683 - (483 + 200))) then
					else
						local v100 = (function()
							return (2163 - (1404 + 59)) - ((741 - 470) + 272 + 157);
						end)();
						while true do
							if (((1 - 0) + (765 - (468 + 297))) == v100) then
								local v110 = 0;
								while true do
									if ((562 - (334 + 228)) == v110) then
										v59 = (function()
											return {};
										end)();
										v60 = (function()
											return {v57,v58,nil,v59};
										end)();
										v110 = 237 - (141 + 95);
									end
									if (v110 == (2 - 1)) then
										v100 = (function()
											return 1088 - (150 + 311 + 614 + 11);
										end)();
										break;
									end
								end
							end
							if (v100 == ((3314 - 2026) - ((2386 - 1393) + 70 + 225))) then
								v57 = (function()
									return {};
								end)();
								v58 = (function()
									return {};
								end)();
								v100 = (function()
									return (2 - 1) + (490 - (99 + 391));
								end)();
							end
							if ((2 + 0) ~= v100) then
							else
								v56 = (function()
									return #"[";
								end)();
								break;
							end
						end
					end
					if (v56 == #"{") then
						local v101 = (function()
							return (0 - 0) + 0 + 0;
						end)();
						local v102 = (function()
							return;
						end)();
						while true do
							if (v101 == ((1197 - 347) - (20 + 490 + 340))) then
								v102 = (function()
									return (1334 - (92 + 71)) - (207 + 211 + (1265 - 512));
								end)();
								while true do
									if (v102 == (765 - (574 + 191))) then
										local v114 = 0 + 0;
										while true do
											if (v114 == (2 - 1)) then
												v102 = (function()
													return (1818 - (568 + 1249)) + 0 + 0;
												end)();
												break;
											end
											if (v114 == (849 - (254 + 595))) then
												v61 = (function()
													return v23();
												end)();
												v62 = (function()
													return {};
												end)();
												v114 = 3 - 2;
											end
										end
									end
									if (v102 ~= ((127 - (55 + 71)) + (1 - 0))) then
									else
										v56 = (function()
											return 128 - ((163 - 47) + (1800 - (573 + 1217)));
										end)();
										break;
									end
									if (1 == v102) then
										for v116 = #"<", v61 do
											local v117 = 0 - 0;
											local v118;
											local v119;
											local v120;
											local v121;
											while true do
												if ((1 + 0) == v117) then
													v120 = (function()
														return;
													end)();
													v121 = (function()
														return;
													end)();
													v117 = 2 - 0;
												end
												if (v117 == (1981 - (362 + 1619))) then
													v118 = (function()
														return 0;
													end)();
													v119 = (function()
														return;
													end)();
													v117 = 940 - (714 + 225);
												end
												if (v117 == 2) then
													while true do
														if (v118 == (2 - 1)) then
															v121 = (function()
																return nil;
															end)();
															while true do
																if (v119 == (0 + 0 + (0 - 0))) then
																	local v452 = (function()
																		return (80 + 658) - ((1101 - (432 + 127)) + (1269 - (1065 + 8)));
																	end)();
																	local v453 = (function()
																		return;
																	end)();
																	while true do
																		if (v452 == ((0 - 0) - (806 - (118 + 688)))) then
																			v453 = (function()
																				return (48 - (25 + 23)) + 0 + 0;
																			end)();
																			while true do
																				if (v453 == ((1887 - (927 + 959)) + (0 - 0))) then
																					v119 = (function()
																						return #">";
																					end)();
																					break;
																				end
																				if (v453 == ((0 - 0) + (732 - (16 + 716)))) then
																					v120 = (function()
																						return v21();
																					end)();
																					v121 = (function()
																						return nil;
																					end)();
																					v453 = (function()
																						return (3 - 1) - (98 - (11 + 86));
																					end)();
																				end
																			end
																			break;
																		end
																	end
																end
																if (#"}" ~= v119) then
																else
																	if (v120 == #"}") then
																		v121 = (function()
																			return v21() ~= ((0 - 0) + (285 - (175 + 110)));
																		end)();
																	elseif (v120 == ((9 - 5) - (9 - 7))) then
																		v121 = (function()
																			return v24();
																		end)();
																	elseif (v120 == #"19(") then
																		v121 = (function()
																			return v25();
																		end)();
																	end
																	v62[v116] = (function()
																		return v121;
																	end)();
																	break;
																end
															end
															break;
														end
														if (v118 ~= (1796 - (503 + 1293))) then
														else
															v119 = (function()
																return (2924 - 1373) - ((2691 - 1565) + 306 + 119);
															end)();
															v120 = (function()
																return nil;
															end)();
															v118 = (function()
																return 2 - 1;
															end)();
														end
													end
													break;
												end
											end
										end
										v60[#"-19"] = (function()
											return v21();
										end)();
										v102 = (function()
											return (384 + 147) - ((1993 - (963 + 624)) + 53 + 70);
										end)();
									end
								end
								break;
							end
						end
					end
					v71 = (function()
						return (2831 - (810 + 251)) - (1214 + 535 + 20);
					end)();
				end
			end
		end
	end
	local function v29(v63, v64, v65)
		local v66 = v63[(1 + 2) - (848 - (518 + 328))];
		local v67 = v63[(2617 - 1494) - (((361 + 39) - (815 - (43 + 490))) + (1736 - (711 + 22)))];
		local v68 = v63[(23 - 15) - 5];
		return function(...)
			local v72 = v66;
			local v73 = v67;
			local v74 = v68;
			local v75 = v27;
			local v76 = (1462 - 1084) - ((1001 - (240 + 619)) + ((316 + 992) - ((1647 - 611) + 3 + 34)));
			local v77 = -((1 - 0) + 0 + 0);
			local v78 = {};
			local v79 = {...};
			local v80 = v12("#", ...) - ((406 - (255 + 150)) + 0 + 0 + 0 + 0);
			local v81 = {};
			local v82 = {};
			for v91 = (316 + 661) - ((2362 - 1809) + (1369 - 945)), v80 do
				if (v91 >= v74) then
					v78[v91 - v74] = v79[v91 + ((1740 - (404 + 1335)) - (0 - 0))];
				else
					v82[v91] = v79[v91 + (407 - (183 + 223)) + (0 - 0)];
				end
			end
			local v83 = (v80 - v74) + 1 + (0 - 0);
			local v84;
			local v85;
			while true do
				local v92 = 0 - 0;
				while true do
					if (v92 == (1 + 0)) then
						if (v85 <= (5 + 8 + (346 - (10 + 327)))) then
							if (v85 <= (4 + 6)) then
								if (v85 <= (((1033 + 449) - ((979 - (118 + 220)) + 792 + 47)) + 1 + 1)) then
									if (((2781 - (108 + 341)) <= (1905 + 2336)) and (v85 <= ((277 - (259 + 17)) + (0 - 0)))) then
										if (v85 > (1493 - (711 + 782))) then
											v82[v84[(7 - 3) - (471 - (270 + 199))]] = #v82[v84[(3 + 4) - (11 - 7)]];
										else
											for v150 = v84[1763 - (440 + 1321)], v84[(1825 - (580 + 1239)) - (8 - 5)] do
												v82[v150] = nil;
											end
										end
									elseif (v85 <= (1 + 0 + (914 - (33 + 877 + (548 - (424 + 121)))))) then
										v82[v84[1 + 1]][v82[v84[(36 - 22) - (7 + 4)]]] = v82[v84[(1924 - (645 + 522)) - ((2029 - (1010 + 780)) + (2239 - 1725))]];
									elseif ((v85 == (2 + 0 + (3 - 2))) or ((11261 - 8897) < 1157)) then
										v82[v84[(66 + 1265) - ((1527 - (434 + 296)) + (1697 - 1165))]] = v82[v84[(8 - 5) + ((1836 - (1045 + 791)) - 0)]];
									else
										local v154 = v84[((4265 - 2580) - ((2238 - 772) + (723 - (351 + 154)))) + (1575 - (1281 + 293))];
										local v155, v156 = v75(v82[v154](v82[v154 + ((268 - (28 + 238)) - (2 - 1))]));
										v77 = (v156 + v154) - (1560 - (1381 + 178));
										local v157 = (1128 + 74) - (301 + 72 + 358 + 471);
										for v302 = v154, v77 do
											local v303 = (312 + 419) - ((1640 - 1164) + 133 + 122);
											while true do
												if (v303 == (1130 - (369 + (1231 - (381 + 89))))) then
													v157 = v157 + 1 + 0 + 0 + 0 + (0 - 0);
													v82[v302] = v155[v157];
													break;
												end
											end
										end
									end
								elseif (v85 <= ((1168 - (1074 + 82)) - (10 - 5))) then
									if (v85 <= ((1793 - (214 + 1570)) - (1459 - (990 + 465)))) then
										if (v82[v84[1 + 1]] == v84[(106 + 136) - (38 + 26 + 11 + 163)]) then
											v76 = v76 + ((1649 - 500) - (403 + 153 + 576 + 16)) + 0;
										else
											v76 = v84[11 - 8];
										end
									elseif (v85 > (19 - 13)) then
										local v159 = 1726 - (1668 + 58);
										local v160;
										local v161;
										while true do
											if (v159 == (626 - (512 + 114))) then
												v160 = v84[(5 - 3) - (855 - (112 + 743))];
												v161 = {};
												v159 = 1172 - (1026 + 145);
											end
											if (v159 == (1 - 0)) then
												for v440 = (1172 - 835) - (144 + (910 - (493 + 225))), #v81 do
													local v441 = v81[v440];
													for v455 = (101 + 115) - (8 + 34 + 152 + 22), #v441 do
														local v456 = 0 - 0;
														local v457;
														local v458;
														local v459;
														while true do
															if (v456 == (1995 - (109 + 1885))) then
																v459 = v457[1471 - (1269 + 200)];
																if ((v458 == v82) and (v459 >= v160)) then
																	local v541 = 0 - 0;
																	while true do
																		if ((815 - (98 + 717)) == v541) then
																			v161[v459] = v458[v459];
																			v457[827 - (802 + 24)] = v161;
																			break;
																		end
																	end
																end
																break;
															end
															if (v456 == (1689 - (1201 + 488))) then
																v457 = v441[v455];
																v458 = v457[(1 - 0) + (0 - 0)];
																v456 = 1;
															end
														end
													end
												end
												break;
											end
										end
									else
										local v162 = 0 + 0;
										local v163;
										while true do
											if (v162 == (1 + 0)) then
												v82[v84[1 + 1 + 0]] = v84[(2702 - 1195) - ((948 - (352 + 233)) + 188 + 953)];
												v76 = v76 + 1 + 0;
												v84 = v72[v76];
												v82[v84[(4400 - 2818) - ((3944 - 2761) + 51 + 91 + 104 + 151)]] = v84[(7 + 1) - (4 + 1)];
												v162 = 1 + 1;
											end
											if (v162 == (1433 - (797 + 636))) then
												v163 = nil;
												v82[v84[(9 - 7) + 0]] = v82[v84[1622 - (1427 + 192)]];
												v76 = v76 + 1 + 0;
												v84 = v72[v76];
												v162 = 2 - 1;
											end
											if (v162 == (4 + 0)) then
												v84 = v72[v76];
												if not v82[v84[(1 + 1) - ((326 - (192 + 134)) - (0 + 0))]] then
													v76 = v76 + (1277 - (316 + 960)) + 0 + 0;
												else
													v76 = v84[(663 + 196) - (522 + 42 + (1116 - 824))];
												end
												break;
											end
											if (v162 == (1 + 2)) then
												v76 = v76 + (552 - (83 + 468)) + (1806 - (1202 + 604));
												v84 = v72[v76];
												v82[v84[(23 - 18) - (4 - 1)]] = v82[v84[(2436 - 500) - ((939 - 374) + (3787 - 2419))]][v82[v84[(9 + 6) - (336 - (45 + 280))]]];
												v76 = v76 + (((2429 + 87) - (153 + 21 + 249 + 431)) - (818 + 659 + (428 - 244)));
												v162 = 1 + 3;
											end
											if (v162 == (1 + 1)) then
												v76 = v76 + 1;
												v84 = v72[v76];
												v163 = v84[(3 - 1) + ((2719 - (340 + 1571)) - (130 + 199 + (2251 - (1733 + 39))))];
												v82[v163] = v82[v163](v13(v82, v163 + (2 - 1) + (1034 - (125 + 909)), v84[(3926 - (1096 + 852)) - (859 + 1054 + (87 - 25))]));
												v162 = 10 - 7;
											end
										end
									end
								elseif ((v85 <= ((1562 - (647 + 902)) - (5 + 0))) or ((1679 - (409 + 103)) > (1514 - (46 + 190)))) then
									v82[v84[9 - 7]] = v84[(103 - (51 + 44)) - (2 + 3)];
								elseif ((v85 > (313 - ((1561 - (1114 + 203)) + (786 - (228 + 498))))) or ((249 + 896) <= (598 + 484))) then
									local v164 = (663 - (174 + 489)) + (0 - 0);
									local v165;
									local v166;
									local v167;
									local v168;
									local v169;
									while true do
										if ((v164 == (7 - 5)) or ((4449 - 1344) == (14493 - 9612))) then
											local v373 = 1947 - (414 + 1533);
											while true do
												if ((3 + 0) == v373) then
													v164 = (3521 - (830 + 1075)) - ((2089 - (303 + 221)) + (123 - 75));
													break;
												end
												if (v373 == 2) then
													v82[v84[(65 + 1062) - ((3525 - 2589) + (1458 - (231 + 1038)))]] = v82[v84[3]];
													v76 = v76 + 1 + 0 + 0 + 0;
													v373 = 1165 - (171 + 991);
												end
												if (v373 == (0 - 0)) then
													v82[v169 + ((883 - 406) - ((109 - 68) + (1426 - 991)))] = v168;
													v82[v169] = v168[v84[(2507 - 1502) - (931 + 7 + 51 + 12)]];
													v373 = 3 - 2;
												end
												if (v373 == (1 + 0)) then
													v76 = v76 + ((2 - 1) - (0 - 0)) + (0 - 0);
													v84 = v72[v76];
													v373 = 1250 - (111 + 1137);
												end
											end
										end
										if ((v164 == ((158 - (91 + 67)) + (0 - 0))) or ((2979 - (770 + 322)) > (1218 + 3660))) then
											v165 = nil;
											v166, v167 = nil;
											v168 = nil;
											v169 = nil;
											v82[v84[(1663 - (423 + 100)) - (782 + 3 + 353)]] = v82[v84[7 - 4]][v84[(142 + 129) - ((340 - 164) + 91)]];
											v76 = v76 + ((773 - (326 + 445)) - (4 - 3));
											v164 = 2 - 1;
										end
										if ((v164 == ((18 - 10) - 2)) or ((4798 - (530 + 181)) > 4116)) then
											do
												return;
											end
											v76 = v76 + ((1974 - (614 + 267)) - (975 + 117));
											v84 = v72[v76];
											v76 = v84[(1910 - (19 + 13)) - (88 + 69 + 1718)];
											break;
										end
										if (v164 == ((6 - 2) + (0 - 0))) then
											v84 = v72[v76];
											v169 = v84[(3 + 3) - (11 - 7)];
											v166, v167 = v75(v82[v169](v13(v82, v169 + (3 - (1 + 1)), v84[1021 - ((1225 - 528) + (665 - 344))])));
											v77 = (v167 + v169) - (1813 - (1293 + 519));
											v165 = (0 - 0) - (0 + 0);
											for v442 = v169, v77 do
												local v443 = 0;
												while true do
													if (v443 == 0) then
														v165 = v165 + ((1 - 0) - (0 - 0));
														v82[v442] = v166[v165];
														break;
													end
												end
											end
											v164 = 5;
										end
										if (((3656 - 2550) <= (3305 - 2039)) and (v164 == ((5 - 2) + (0 - 0)))) then
											v84 = v72[v76];
											v82[v84[(9 - 5) - (2 + 0)]] = v84[2 + 1 + 0];
											v76 = v76 + ((3 - 2) - (0 - 0));
											v84 = v72[v76];
											v82[v84[(2 + 3) - (2 + 1)]] = v84[(409 + 821) - (202 + 120 + 15 + 890)];
											v76 = v76 + ((2384 - 1772) - ((1698 - (709 + 387)) + (1867 - (673 + 1185))));
											v164 = (2513 - (1199 + 121)) - ((759 - 310) + (2146 - 1406));
										end
										if (((10131 - 6976) < 4650) and (v164 == ((1979 - 1102) - (826 + (75 - 29))))) then
											local v385 = 0 - 0;
											while true do
												if (v385 == (0 + 0)) then
													v76 = v76 + ((839 + 109) - (184 + 61 + (1203 - 501)));
													v84 = v72[v76];
													v385 = 1 - 0;
												end
												if ((1 + 1) == v385) then
													v76 = v76 + 1 + 0 + (0 - 0);
													v84 = v72[v76];
													v385 = 5 - 2;
												end
												if (v385 == (5 - 2)) then
													v164 = 1904 - ((2140 - (446 + 1434)) + ((3660 - (1040 + 243)) - ((1181 - 785) + (2190 - (559 + 1288)))));
													break;
												end
												if (v385 == (1970 - (1618 + 351))) then
													v169 = v84[6 - 4];
													v82[v169](v13(v82, v169 + 1 + 0, v77));
													v385 = 1933 - (609 + 1322);
												end
											end
										end
										if (v164 == ((895 - (13 + 441)) - ((1398 - (10 + 1006)) + 2 + 4 + (194 - 142)))) then
											v84 = v72[v76];
											v82[v84[(15 - 9) - (19 - 15)]] = v82[v84[(1036 - (912 + 121)) + 0 + 0]][v84[(29 - 21) - (2 + 2)]];
											v76 = v76 + 1 + 0;
											v84 = v72[v76];
											v169 = v84[(14 - 9) - (2 + 1)];
											v168 = v82[v84[4 - 1]];
											v164 = (798 + 409) - (502 + 400 + 218 + 85);
										end
									end
								else
									v82[v84[(3 + 0) - ((1447 + 31) - ((462 - (153 + 280)) + (1559 - (61 + 50))))]][v82[v84[(3 + 3) - (1392 - ((389 - 254) + (2526 - 1272)))]]] = v84[1 + 0 + 3 + 0];
								end
							elseif (v85 <= (((2538 + 3888) - (2471 + 2249)) - ((2518 - (819 + 578)) + 517 + 52))) then
								if (((2735 + 1039) >= (2799 - 960)) and (v85 <= ((141 + 86) - ((689 - (89 + 578)) + (2129 - (1834 + 103)))))) then
									if (((1730 + 1081) == (2009 + 802)) and (v85 <= ((1442 - 748) - ((1532 - (572 + 477)) + 200)))) then
										local v132 = (198 + 1265) - (843 + 561 + 8 + 51);
										local v133;
										while true do
											if (((2232 - (84 + 2)) > (1848 - 726)) and (((0 + 0) - ((842 - (497 + 345)) - (0 + 0))) == v132)) then
												v133 = v84[(1 + 1) - 0];
												do
													return v13(v82, v133, v77);
												end
												break;
											end
										end
									elseif (v85 == (19 - 7)) then
										local v172 = v84[((1845 - (605 + 728)) + 182 + 73) - ((1040 - 572) + 297)];
										v82[v172] = v82[v172](v82[v172 + ((1572 - (615 + 394)) - (334 + 11 + 217))]);
									else
										local v174 = 0 - 0;
										local v175;
										local v176;
										local v177;
										while true do
											if (v174 == ((6 + 0) - ((1460 + 71) - ((1077 - 688) + 1138)))) then
												local v391 = 0 - 0;
												while true do
													if ((0 + 0) == v391) then
														v82[v84[(493 - (457 + 32)) - (1 + 1)]] = v84[(1407 - (832 + 570)) - (4 - 2)];
														v76 = v76 + 1 + 0 + 0 + 0;
														v391 = 3 - 2;
													end
													if (v391 == (1 + 0)) then
														v84 = v72[v76];
														v174 = (1035 - (588 + 208)) - (((1927 - 1212) - (73 + 29 + (2272 - (884 + 916)))) + (336 - (123 + 118)));
														break;
													end
												end
											end
											if (v174 == ((12 - 6) + 0 + 0)) then
												if (v175 > (0 - (653 - (232 + 421)))) then
													if (v176 > v82[v177 + (1890 - (1569 + 320))]) then
														v76 = v84[(2 + 4) - (1 + 2)];
													else
														v82[v177 + 1 + 0 + 0 + 0 + 2 + 0] = v176;
													end
												elseif (v176 < v82[v177 + ((6 - 4) - (606 - (316 + 289)))]) then
													v76 = v84[(7 - 4) + 0 + 0];
												else
													v82[v177 + (1455 - (666 + 787)) + (426 - (360 + 65))] = v176;
												end
												break;
											end
											if ((v174 == ((5 + 0) - (255 - (79 + 175)))) or ((1290 - (885 + 349)) == (5701 - 2085))) then
												v82[v84[2 + 0 + 0]] = v84[(130 + 36) - ((281 - 189) + (136 - 65))];
												v76 = v76 + (969 - (915 + 53)) + (899 - (503 + 396)) + (0 - 0);
												v84 = v72[v76];
												v174 = (189 - (92 + 89)) - (5 - 2);
											end
											if (v174 == ((1096 - (287 + 41)) - ((1421 - (638 + 209)) + 100 + 91))) then
												local v395 = 0 + 0;
												while true do
													if (v395 == (1672 - (741 + 931))) then
														v82[v84[1 + 1 + 0 + 0]] = #v82[v84[7 - 4]];
														v76 = v76 + (4 - 3) + (0 - 0) + 0 + 0;
														v395 = 2 - 1;
													end
													if (v395 == (1 + 0)) then
														v84 = v72[v76];
														v174 = (2398 - (153 + 167 + 527 + 698)) - ((773 - 519) + 595);
														break;
													end
												end
											end
											if (v174 == ((16 + 111) - (18 + 37 + 71))) then
												local v396 = 0 + 0;
												while true do
													if (0 == v396) then
														v82[v84[(2 - 0) - (1244 - (485 + 759))]] = v82[v84[(6 - 3) - (0 + 0)]];
														v76 = v76 + (495 - (64 + 430));
														v396 = 1 + 0;
													end
													if (v396 == (1190 - (442 + 747))) then
														v84 = v72[v76];
														v174 = 1137 - (832 + 303);
														break;
													end
												end
											end
											if (v174 == ((2736 - (88 + 858)) - (175 + 398 + 1008 + 209))) then
												local v397 = 1658 - (256 + 1402);
												while true do
													if (v397 == (0 + 0)) then
														v175 = nil;
														v176 = nil;
														v397 = 790 - (766 + 23);
													end
													if ((189 - (96 + 92)) == v397) then
														v177 = nil;
														v174 = (9 - 7) - (1 - 0);
														break;
													end
												end
											end
											if ((v174 == (13 - 8)) or ((8216 - 5795) < (255 + 367))) then
												local v398 = 1073 - (1036 + 37);
												while true do
													if (v398 == (0 + 0)) then
														v177 = v84[(1 - 0) + 1 + 0];
														v176 = v82[v177];
														v398 = 1481 - (641 + 839);
													end
													if ((914 - (910 + 3)) == v398) then
														v175 = v82[v177 + ((4 - 2) - ((1684 - (1466 + 218)) + 0 + 0))];
														v174 = 945 - ((1862 - (556 + 592)) + 81 + 144);
														break;
													end
												end
											end
										end
									end
								elseif ((1009 <= (1938 - (329 + 479))) and (v85 <= ((1637 - (645 + 952)) - (880 - (174 + 680))))) then
									if (((9476 - 6718) < (6176 - 3196)) and v82[v84[2 - 0]]) then
										v76 = v76 + 1 + 0 + 0 + 0;
									else
										v76 = v84[(742 - (396 + 343)) - 0];
									end
								elseif ((v85 == ((1586 - (181 + 584)) - ((1513 - (665 + 730)) + 61 + 627))) or ((1563 - (29 + 1448)) >= (5015 - (135 + 1254)))) then
									if (v84[(188 - 138) - ((99 - 74) + (107 - 84))] == v82[v84[3 + 1]]) then
										v76 = v76 + (1528 - (389 + 1138)) + (574 - (102 + 472));
									else
										v76 = v84[(3661 - (843 + 929)) - ((1189 - (30 + 232)) + 905 + 54)];
									end
								else
									v82[v84[6 - ((2245 - (55 + 722)) - (157 + 1307))]] = v64[v84[((1439 + 1155) - (766 + 55 + (2583 - (320 + 1225)))) - ((28 - 12) + 439 + 277)]];
								end
							elseif (v85 <= ((1500 - (157 + 1307)) - (1876 - (821 + 1038)))) then
								if (v85 <= ((284 - 170) - (2 + 9 + (152 - 66)))) then
									v82[v84[(2 + 2) - (4 - 2)]]();
								elseif (v85 > ((1329 - (834 + 192)) - (12 + 163 + (150 - 40)))) then
									v82[v84[1 + 1]] = v82[v84[1 + 2]][v82[v84[9 - (7 - 2)]]];
								else
									v82[v84[(313 - (300 + 4)) - (2 + 5)]] = v82[v84[(4344 - 2545) - ((1316 - 813) + (1655 - (112 + 250)))]][v84[(20 - 9) - (3 + 4)]];
								end
							elseif (v85 <= ((37 - 22) + (6 - 1))) then
								v82[v84[(1451 - 388) - (465 + 345 + 130 + 121)]] = v82[v84[3 + ((0 + 0) - (0 + 0))]] % v84[2 + 0 + (3 - 1)];
							elseif (v85 > (1435 - (1001 + 413))) then
								local v185 = 0 - 0;
								local v186;
								while true do
									if (v185 == (882 - (244 + 638))) then
										v186 = v84[2 + (693 - (627 + 66))];
										v82[v186] = v82[v186](v13(v82, v186 + (534 - ((224 - (24 + 157)) + (1460 - 970))), v77));
										break;
									end
								end
							else
								local v187 = 0;
								local v188;
								local v189;
								while true do
									if (v187 == (602 - (512 + 90))) then
										v188 = (2639 - (1665 + 241)) - ((1428 - (373 + 344)) + 10 + 12);
										v189 = nil;
										v187 = 1 + 0;
									end
									if ((2 - 1) == v187) then
										while true do
											if ((((1 - 0) + (1105 - (35 + 1064))) - 5) == v188) then
												local v484 = 0 + 0;
												while true do
													if (v484 == (2 - 1)) then
														v76 = v76 + ((2 - 1) - (0 + 0));
														v188 = (1237 - (298 + 938)) + (1261 - (233 + 1026));
														break;
													end
													if (v484 == (0 + 0)) then
														v84 = v72[v76];
														v82[v84[(2104 - 1243) - ((1906 - (636 + 1030)) + 317 + 302)]] = v84[1 + 0 + 1 + 1];
														v484 = 1 + 0;
													end
												end
											end
											if ((221 - (55 + 166)) == v188) then
												v189 = nil;
												v82[v84[2]] = v82[v84[(339 + 1408) - (136 + 1208 + ((2711 - 2001) - (286 + 24)))]];
												v76 = v76 + ((703 - (36 + 261)) - (255 + (262 - 112)));
												v188 = 1 + 0 + (1368 - (34 + 1334));
											end
											if (((921 + 1474) == (1569 + 826)) and ((1 + 0 + 0) == v188)) then
												v84 = v72[v76];
												v82[v84[(1291 - (1035 + 248)) - (27 - (20 + 1))]] = v84[2 + 1];
												v76 = v76 + 1;
												v188 = (4 + 2) - (323 - (134 + 185));
											end
											if (v188 == ((4583 - 2839) - ((1284 - (549 + 584)) + (938 - (314 + 371)) + 330 + 1005))) then
												v76 = v76 + ((721 - (203 + 111)) - ((628 - 445) + (552 - (1297 - (478 + 490)))));
												v84 = v72[v76];
												if (((2003 + 1777) > (3881 - (786 + 386))) and v82[v84[((3329 - 2301) - ((2213 - (1055 + 324)) + (1532 - (1093 + 247)))) - (0 + 0)]]) then
													v76 = v76 + 1 + 0 + 0 + 0;
												else
													v76 = v84[(3 - 2) + (6 - 4)];
												end
												break;
											end
											if ((v188 == (2 + (2 - 1) + (2 - 1))) or (237 >= (809 + 1464))) then
												local v491 = 0 - 0;
												while true do
													if ((2 - 1) == v491) then
														v82[v84[6 - 4]] = v82[v84[3 + 0]][v82[v84[4]]];
														v188 = 910 - (76 + 829);
														break;
													end
													if (v491 == (0 - 0)) then
														v76 = v76 + (((696 - (364 + 324)) + (619 - 289)) - (10 + (593 - (58 + 208))));
														v84 = v72[v76];
														v491 = 2 - 1;
													end
												end
											end
											if (v188 == ((6 - 3) + 0)) then
												local v492 = 0 + 0;
												while true do
													if ((4 - 3) == v492) then
														v82[v189] = v82[v189](v13(v82, v189 + (1 - 0) + (0 - 0), v84[(1720 - (1249 + 19)) - (98 + 10 + (1327 - 986))]));
														v188 = 1090 - (686 + 400);
														break;
													end
													if ((0 + 0) == v492) then
														v84 = v72[v76];
														v189 = v84[((755 - (73 + 156)) - (1 + 185)) - ((929 - (721 + 90)) + 220)];
														v492 = 1 + 0;
													end
												end
											end
										end
										break;
									end
								end
							end
						elseif (v85 <= ((51 - 35) + (33 - 15))) then
							if ((v85 <= ((588 - (224 + 246)) - (273 - 183))) or ((6539 - 4499) <= 703)) then
								if (((8620 - 5341) <= (13290 - 9323)) and (v85 <= (40 - 15))) then
									if (v85 <= ((3105 - (877 + 712)) - (426 + 285 + 782))) then
										v82[v84[(5 - 2) - (1 + 0)]] = v82[v84[1 + 2]] + v84[(348 + 125) - (((1140 - 566) - ((998 - 698) + (517 - (203 + 310)))) + (2192 - (1238 + 755)))];
									elseif ((v85 == (1 + 7 + (17 - 12) + (1545 - (709 + 825)))) or ((1950 + 38) == (1616 - 739))) then
										local v190 = 1819 - ((844 - 264) + 1239);
										local v191;
										while true do
											if (v190 == ((875 - (196 + 668)) - ((70 - 52) - (22 - 11)))) then
												v84 = v72[v76];
												v82[v84[(1286 - (299 + 985)) + 0 + 0]] = v82[v84[(834 - (171 + 662)) + (364 - ((205 - (4 + 89)) + (876 - 626)))]];
												v76 = v76 + 1 + 0 + (0 - 0);
												v84 = v72[v76];
												v190 = 5;
											end
											if (((1683 + 2608) > (2792 - (672 + 208))) and (v190 == (1489 - (35 + 1451)))) then
												local v404 = 1453 - (28 + 1425);
												while true do
													if (v404 == (1995 - (941 + 1052))) then
														v190 = 4 + 0;
														break;
													end
													if (v404 == (1514 - (822 + 692))) then
														v76 = v76 + ((1397 - (440 + 955)) - (1 - 0));
														v84 = v72[v76];
														v404 = 1;
													end
													if (v404 == (1 + 0)) then
														v82[v84[(299 - (45 + 252)) + 0]][v82[v84[(2101 - 931) - (215 + 430 + 517 + 5)]]] = v82[v84[(618 + 1176) - (1010 + (1898 - 1118))]];
														v76 = v76 + (434 - (114 + 319)) + (0 - 0);
														v404 = 2;
													end
												end
											end
											if (((2566 - 563) < (1492 + 847)) and (((1975 - (1181 + 793)) + 0 + 0) == v190)) then
												local v405 = 0 - 0;
												while true do
													if (v405 == 2) then
														v190 = (8 - 4) - ((1967 - (556 + 1407)) - (1208 - (741 + 465)));
														break;
													end
													if (v405 == (466 - (170 + 295))) then
														v84 = v72[v76];
														v82[v84[(969 + 869) - (960 + 85 + (1947 - 1156))]] = v84[3 + 0];
														v405 = 5 - 3;
													end
													if (v405 == (0 + 0)) then
														v82[v84[2 + 0]] = v84[(1397 - (1262 + 121)) - (1241 - (957 + 273))];
														v76 = v76 + ((1 + 1) - (1 + 0));
														v405 = 3 - 2;
													end
												end
											end
											if (v190 == (344 - (163 + 176))) then
												v82[v84[(7 - 5) - ((0 - 0) + 0 + 0)]] = v84[(2318 - (1564 + 246)) - ((1071 - 720) + 154)];
												v76 = v76 + ((7798 - 6223) - ((3061 - (389 + 1391)) + 184 + 109));
												v84 = v72[v76];
												v82[v84[(590 - 322) - (3 + 25 + (541 - 303))]] = v84[(957 - (783 + 168)) - (9 - 6)];
												v190 = 1565 - ((3371 - (1282 + 708)) + (1390 - (583 + 629)));
											end
											if (v190 == (0 + 0 + (311 - (309 + 2)))) then
												v191 = nil;
												v82[v84[(5 - 3) + (1212 - (1090 + 122))]] = v82[v84[1 + 1 + (0 - 0) + 1 + 0]];
												v76 = v76 + ((3 + 0) - (1948 - (706 + 1240)));
												v84 = v72[v76];
												v190 = 1 + (1118 - (628 + 490));
											end
											if (v190 == ((85 + 387) - (285 + (237 - 141) + (406 - 317)))) then
												local v414 = 774 - (431 + 343);
												while true do
													if (v414 == (0 - 0)) then
														v76 = v76 + 1 + 0 + (0 - 0);
														v84 = v72[v76];
														v414 = 1 + 0;
													end
													if (v414 == (1 + 0)) then
														v191 = v84[(1697 - (556 + 1139)) + (15 - (6 + 9))];
														v82[v191] = v82[v191](v13(v82, v191 + (1 - (0 + 0)), v84[(594 + 565) - ((1243 - (28 + 141)) + (1941 - (1541 + 318)))]));
														v414 = 1 + 1;
													end
													if ((2 + 0) == v414) then
														v190 = (7 - 1) - (3 + 0);
														break;
													end
												end
											end
											if (v190 == ((3107 - (486 + 831)) - ((556 - 342) + 868 + 702))) then
												v76 = v76 + ((5125 - 3669) - ((1580 - (563 + 27)) + 465));
												v84 = v72[v76];
												v191 = v84[2];
												v82[v191] = v82[v191](v13(v82, v191 + 1 + 0 + (0 - 0), v84[(1265 - (668 + 595)) + 1]));
												v190 = 7;
											end
											if (v190 == ((1993 - (1369 + 617)) + 0 + 0)) then
												v76 = v76 + ((1 + 2) - (1 + (2 - 1)));
												v84 = v72[v76];
												v82[v84[(2131 - (274 + 129)) - ((1958 - (23 + 267)) + 58)]] = v82[v84[(2573 - (1129 + 815)) - ((768 - (371 + 16)) + 120 + 11 + 114)]];
												break;
											end
										end
									else
										do
											return;
										end
									end
								elseif (v85 <= ((1817 - (1326 + 424)) - (40 + 1))) then
									if not v82[v84[3 - 1]] then
										v76 = v76 + ((385 - (27 + 357)) - (0 - 0));
									else
										v76 = v84[121 - (88 + 30)];
									end
								elseif (v85 == ((864 - (720 + 51)) - (146 - 80))) then
									v82[v84[1 + (1777 - (421 + 1355))]] = {};
								else
									local v194 = v84[(1 - 0) + (1564 - (1339 + 224))];
									v82[v194](v82[v194 + 1 + 0 + 0 + 0]);
								end
							elseif (v85 <= (45 - 14)) then
								if (((1275 - (268 + 575)) == (1726 - (919 + 375))) and (v85 <= ((1511 - ((2084 - (286 + 797)) + (1509 - 1096))) - (112 - 44)))) then
									local v136 = 439 - (397 + 42);
									local v137;
									while true do
										if (v136 == (0 + 0)) then
											v137 = v84[((5250 - (24 + 776)) - (161 + 2293)) - ((167 - 58) + 726 + 1159)];
											do
												return v82[v137](v13(v82, v137 + ((2255 - (222 + 563)) - (((180 + 1971) - ((537 - 293) + 638)) + (2121 - (962 + 959)))), v84[3 + 0]));
											end
											break;
										end
									end
								elseif (v85 > ((247 - (23 + 167)) - ((2071 - (461 + 890)) - (627 + (1864 - (690 + 1108)))))) then
									local v195;
									v82[v84[(600 + 217) - (36 + 62 + 592 + 125)]] = v82[v84[((3317 - (40 + 808)) - (1487 + 153)) - (133 + 669 + 24)]];
									v76 = v76 + (3 - 2);
									v84 = v72[v76];
									v82[v84[(2 + 0) - (0 + 0)]] = v84[(3 + 0) - 0];
									v76 = v76 + 1 + 0 + 0 + 0;
									v84 = v72[v76];
									v82[v84[((1175 - (47 + 524)) - (496 + 16 + (323 - 233))) + 0 + 0]] = v84[3];
									v76 = v76 + (2 - 1) + 0;
									v84 = v72[v76];
									v195 = v84[(1 - 0) + 1];
									v82[v195] = v82[v195](v13(v82, v195 + ((4 - 2) - (1727 - (1165 + 561))), v84[(1 + 8) - (18 - 12)]));
									v76 = v76 + 1 + 0 + ((2385 - (341 + 138)) - (450 + 1215 + 137 + 104));
									v84 = v72[v76];
									v82[v84[(1 - 0) + (327 - (89 + 237))]][v82[v84[((2516 - 1796) - ((1199 - 826) + (723 - 379))) + (881 - (581 + 300))]]] = v84[(1223 - (855 + 365)) + 1 + 0];
									v76 = v76 + (2 - 1) + 0 + 0;
									v84 = v72[v76];
									v82[v84[(469 + 966) - ((1595 - (1030 + 205)) + 411 + 26 + 286 + 350)]] = v82[v84[(14 + 0) - 11]];
									v76 = v76 + ((1906 - (156 + 130)) - ((3242 - 1815) + (940 - (485 + 263))));
									v84 = v72[v76];
									v82[v84[(1 - 0) + (1 - 0)]] = v84[864 - (750 + 111)];
									v76 = v76 + 1 + 0 + 0 + 0;
									v84 = v72[v76];
									v82[v84[(73 - (10 + 59)) - (1 + 1)]] = v84[3 + 0 + 0];
									v76 = v76 + (4 - 3) + (1163 - (671 + 492));
									v84 = v72[v76];
									v195 = v84[(4 + 1) - (1218 - (369 + 846))];
									v82[v195] = v82[v195](v13(v82, v195 + ((87 + 240) - (164 + 28 + (672 - (493 + 45)))), v84[(2247 - (493 + 475)) - ((2261 - (1036 + 909)) + 764 + 196)]));
									v76 = v76 + (1 - 0) + (203 - (11 + 192));
									v84 = v72[v76];
									v82[v84[2 + (0 - 0)]] = v82[v84[2 + 1 + (175 - (135 + 40))]];
								else
									v82[v84[(16 - 9) - (4 + 1)]] = v84[6 - 3] + v82[v84[(217 + 338) - (83 + (1197 - 729))]];
								end
							elseif (v85 <= (47 - 15)) then
								local v138 = v84[(1984 - (50 + 126)) - ((3346 - 2144) + 134 + 470)];
								local v139 = v82[v138 + ((11 - 2) - 7)];
								local v140 = v82[v138] + v139;
								v82[v138] = v140;
								if (v139 > (1413 - (1233 + 180))) then
									if (v140 <= v82[v138 + ((970 - (522 + 447)) - (0 - 0))]) then
										local v351 = 1421 - (107 + 1314);
										local v352;
										while true do
											if (v351 == (0 + 0)) then
												v352 = (0 - 0) - 0;
												while true do
													if (v352 == ((798 - (95 + 378)) - (20 + 25 + (396 - 116)))) then
														v76 = v84[(5 - 2) + ((0 - 0) - (1910 - (716 + 1194)))];
														v82[v138 + 3 + 0 + 0] = v140;
														break;
													end
												end
												break;
											end
										end
									end
								elseif (v140 >= v82[v138 + 1 + 0 + (503 - (74 + 429))]) then
									v76 = v84[(3 - 1) + (1057 - (1049 + 7))];
									v82[v138 + 2 + 1] = v140;
								end
							elseif (v85 > ((13 - 7) + (1126 - (35 + 753 + 311)))) then
								local v217 = 0 - 0;
								local v218;
								local v219;
								while true do
									if (v217 == (2 - 1)) then
										v82[v218 + (434 - (279 + 154)) + (0 - 0) + (778 - (454 + 324))] = v219;
										v82[v218] = v219[v84[(1398 + 378) - (((5664 - (1621 + 336)) - (1991 - (12 + 5))) + 1 + 21 + 17)]];
										break;
									end
									if ((1015 - (446 + 569)) == v217) then
										v218 = v84[(7 - 4) - 1];
										v219 = v82[v84[(81 + 1833) - (126 + 214 + (2664 - (277 + 816)))]];
										v217 = 1 + 0;
									end
								end
							else
								local v220;
								v82[v84[(21 - 16) - (1186 - (1058 + 125))]] = v65[v84[(195 + 842) - (((40 + 1321) - ((1273 - (815 + 160)) + 938)) + 909)]];
								v76 = v76 + (4 - 3);
								v84 = v72[v76];
								v82[v84[(4629 - 2679) - (((3025 - (623 + 47)) - ((278 - (32 + 13)) + 576 + 450)) + 204 + 648)]] = v64[v84[8 - 5]];
								v76 = v76 + (1899 - (41 + 1857)) + 0 + 0;
								v84 = v72[v76];
								v82[v84[1895 - (1222 + 671)]] = v82[v84[7 - 4]][v84[(6 - 1) - (1183 - (229 + 953))]];
								v76 = v76 + (1775 - (1111 + 663)) + (133 - (98 + 35));
								v84 = v72[v76];
								v220 = v84[(2093 - (874 + 705)) - (((291 + 1784) - (434 + 202 + (3647 - 2617))) + (213 - 110))];
								v82[v220] = v82[v220](v82[v220 + ((7 + 230) - ((725 - (642 + 37)) + 23 + 75 + 92))]);
								v76 = v76 + ((16 + 80) - (51 + (109 - 65)));
								v84 = v72[v76];
								v82[v84[(455 - (233 + 221)) + 1]]();
								v76 = v76 + ((3047 - 1729) - (1114 + 179 + 24));
								v84 = v72[v76];
								do
									return;
								end
							end
						elseif ((v85 <= ((2307 - (718 + 823)) - (144 + 84 + (1303 - (266 + 539))))) or ((3241 - 2096) >= (2189 - 936))) then
							if ((3418 > (3343 - (636 + 589))) and (v85 <= (37 + (0 - 0)))) then
								if ((3066 <= (8023 - 4133)) and (v85 <= (7 + 1 + 10 + 17))) then
									local v142 = 1015 - (657 + 358);
									while true do
										if ((3 + 1) == v142) then
											v76 = v76 + (2 - 1);
											v84 = v72[v76];
											v82[v84[(4570 - 3320) - ((252 - 141) + 1137)]] = v65[v84[161 - ((1613 - (251 + 1271)) + (1254 - (1151 + 36)))]];
											v76 = v76 + ((1 + 0 + (2 - 1)) - 1);
											v142 = 5;
										end
										if (v142 == (0 + 0)) then
											v82[v84[(5 - 3) + (1832 - (1552 + 280))]] = v65[v84[(1500 - (64 + 770)) - (119 + 55 + (1109 - 620))]];
											v76 = v76 + ((3 - 1) - (1 + 0));
											v84 = v72[v76];
											v82[v84[(3150 - (157 + 1086)) - ((1661 - 831) + (4708 - 3633))]] = v82[v84[((240 - 83) + (557 - 187)) - ((412 - 109) + (1040 - (599 + 220)))]][v84[4]];
											v142 = 4 - 3;
										end
										if (v142 == (9 - 4)) then
											v84 = v72[v76];
											if (not v82[v84[(1932 - (1813 + 118)) + 0 + 0 + (3 - 2)]] or ((4215 - (841 + 376)) >= (4597 - 1316))) then
												v76 = v76 + (1125 - (408 + 716));
											else
												v76 = v84[((467 + 1541) - (4045 - 2563)) - (72 + 351 + (397 - ((895 - (464 + 395)) + (669 - 408))))];
											end
											break;
										end
										if (v142 == (3 + 0)) then
											v82[v84[1 + 1 + ((341 - 120) - ((136 - 81) + (1695 - (508 + 1021))))]] = v65[v84[(847 - (467 + 370)) - (14 - 7)]];
											v76 = v76 + ((2 + 0) - (3 - 2));
											v84 = v72[v76];
											v82[v84[1 + 1]] = v82[v84[(8 - 4) - (1 + 0)]][v84[(532 - (150 + 370)) - (1290 - (74 + 1208))]];
											v142 = 4;
										end
										if (v142 == (2 - 1)) then
											v76 = v76 + ((6023 - 4753) - (165 + 66 + (1428 - (14 + 376))));
											v84 = v72[v76];
											v82[v84[(3 - 1) + 0 + 0]] = v65[v84[(1024 + 141) - (164 + 7 + (2903 - 1912))]];
											v76 = v76 + 1;
											v142 = 2 + 0;
										end
										if (v142 == (80 - (23 + 55))) then
											v84 = v72[v76];
											v82[v84[(18 - 10) - 6]] = v82[v84[1 + 0 + 2 + 0]][v84[10 - (6 + 0)]];
											v76 = v76 + ((2 - 0) - (2 - 1));
											v84 = v72[v76];
											v142 = 1 + 2;
										end
									end
								elseif (v85 == (937 - (652 + 249))) then
									local v230 = 0 - 0;
									local v231;
									while true do
										if (v230 == (0 - 0)) then
											v231 = v84[(1869 - (708 + 1160)) + (2 - 1)];
											v82[v231](v13(v82, v231 + ((1 + 1) - (586 - (217 + 368))), v77));
											break;
										end
									end
								else
									local v232 = 0 - 0;
									local v233;
									local v234;
									local v235;
									local v236;
									while true do
										if (v232 == (29 - (10 + 17))) then
											for v444 = v233, v77 do
												local v445 = 0 + 0;
												while true do
													if (v445 == (1732 - (1400 + 332))) then
														v236 = v236 + ((3 - 1) - (1 + 0));
														v82[v444] = v234[v236];
														break;
													end
												end
											end
											break;
										end
										if (v232 == (890 - (844 + 45))) then
											v77 = (v235 + v233) - ((1912 - (242 + 1666)) - 3);
											v236 = 0;
											v232 = 1 + 1;
										end
										if (v232 == (0 + 0)) then
											v233 = v84[(3 - 1) + ((0 + 0) - 0)];
											v234, v235 = v75(v82[v233](v13(v82, v233 + ((1712 - (850 + 90)) - ((570 - 244) + (710 - 265))), v77)));
											v232 = 1391 - (360 + 1030);
										end
									end
								end
							elseif (v85 <= (88 - (45 + 5))) then
								v82[v84[(552 + 161) - (530 + (510 - 329))]] = v82[v84[(1824 - (9 + 931)) - ((844 - 230) + (1928 - (909 + 752)))]] % v82[v84[(1259 - (109 + 1114)) - ((34 - 15) + ((538 + 843) - ((276 - (6 + 236)) + 841 + 493)))]];
							elseif (v85 == ((50 + 12) - (54 - 31))) then
								local v237 = 0 - 0;
								local v238;
								while true do
									if (v237 == (1265 - (1037 + 228))) then
										v238 = v84[(5 - 1) - (1135 - (1076 + 57))];
										v82[v238] = v82[v238](v13(v82, v238 + ((5 - 3) - (1 + 0)), v84[(3 - 2) + (689 - (579 + 110)) + 2]));
										break;
									end
								end
							else
								local v239 = v73[v84[(531 - (187 + 340)) - (1 + 0)]];
								local v240;
								local v241 = {};
								v240 = v10({}, {__index=function(v326, v327)
									local v328 = 0 + 0;
									local v329;
									local v330;
									while true do
										if (v328 == (0 + 0)) then
											v329 = (407 - (174 + 233)) - (0 - 0);
											v330 = nil;
											v328 = 171 - (144 + 26);
										end
										if (v328 == (1 - 0)) then
											while true do
												if (v329 == (0 + 0)) then
													local v515 = 0;
													while true do
														if (v515 == (0 - 0)) then
															v330 = v241[v327];
															return v330[(2987 - (663 + 511)) - (1293 + 464 + 55)][v330[(1 + 2) - (2 - 1)]];
														end
													end
												end
											end
											break;
										end
									end
								end,__newindex=function(v331, v332, v333)
									local v334 = 0;
									local v335;
									local v336;
									while true do
										if (v334 == (4 - 3)) then
											while true do
												if ((v335 == (0 + 0)) or ((6309 - 1660) <= (6196 - 3564))) then
													v336 = v241[v332];
													v336[1 - (0 - 0)][v336[(210 - (5 + 197)) - (3 + 3)]] = v333;
													break;
												end
											end
											break;
										end
										if ((0 - 0) == v334) then
											v335 = (0 - 0) - 0;
											v336 = nil;
											v334 = 1 + 0;
										end
									end
								end});
								for v337 = 1 + 0, v84[(1 + 8) - 5] do
									v76 = v76 + (2 - 1) + (722 - (478 + 244));
									local v338 = v72[v76];
									if (v338[(539 - (440 + 77)) - (10 + 10 + (3 - 2))] == ((1557 - (655 + 901)) + 1 + 1)) then
										v241[v337 - (1 + 0)] = {v82,v338[3]};
									else
										v241[v337 - (3 - 2)] = {v64,v338[(1447 - (695 + 750)) + (3 - 2)]};
									end
									v81[#v81 + (1 - 0)] = v241;
								end
								v82[v84[(1264 - (90 + 76)) - (((5779 - 3937) - ((2207 - 1658) + (935 - (285 + 66)))) + 190 + 197)]] = v29(v239, v240, v65);
							end
						elseif (v85 <= ((1570 + 331) - (((3165 - 1807) - (314 + 309 + 62)) + (2495 - (682 + 628))))) then
							if (v85 <= ((378 - (197 + 63)) - (17 + 60))) then
								v76 = v84[(2 + 7) - (305 - (176 + 123))];
							elseif ((v85 > ((29 + 39) - (19 + 7))) or ((4129 - (239 + 30)) > (6115 - 1243))) then
								local v243 = 0 + 0;
								local v244;
								local v245;
								local v246;
								local v247;
								while true do
									if (v243 == (0 + 0)) then
										v244 = 0 + 0 + (0 - 0);
										v245 = nil;
										v243 = 1 - 0;
									end
									if ((2 - 1) == v243) then
										v246 = nil;
										v247 = nil;
										v243 = 317 - (306 + 9);
									end
									if (v243 == 2) then
										while true do
											if ((v244 == (((10 - 7) - (1 + 1)) + 0 + 0)) or (3998 == 2298)) then
												v247 = v82[v245 + (((467 + 503) - ((1366 - 888) + 420 + 70)) - ((976 - (230 + 746)) + (1375 - (1140 + 235))))];
												if (v247 > (0 + 0 + 0)) then
													if (v246 > v82[v245 + ((49 - (39 + 9)) - (0 + 0))]) then
														v76 = v84[(1177 - (202 + 584 + (859 - (106 + 367)))) - (54 - (33 + 19))];
													else
														v82[v245 + ((167 + 1716) - (((522 + 922) - (2991 - 1993)) + 632 + 802))] = v246;
													end
												elseif ((v246 < v82[v245 + ((2517 - 1233) - (976 + 64 + (932 - (586 + 103))))]) or ((1252 - (334 + 910)) >= (3634 - (92 + 803)))) then
													v76 = v84[(1 + 7) - (1186 - (1035 + 146))];
												else
													v82[v245 + ((5695 - 3845) - (325 + 234 + ((4155 - (1309 + 179)) - ((1904 - 849) + (1438 - (53 + 1061))))))] = v246;
												end
												break;
											end
											if (v244 == ((841 + 1090) - ((1635 - 1026) + ((2011 + 651) - ((2321 - 1228) + (491 - 244)))))) then
												v245 = v84[(1065 - (295 + 314)) - ((29 - 17) + (2 - 1) + (2403 - (1300 + 662)))];
												v246 = v82[v245];
												v244 = (9 - 6) - ((1756 - (1178 + 577)) + 1 + 0);
											end
										end
										break;
									end
								end
							else
								local v248;
								local v249, v250;
								local v251;
								v82[v84[(14 - 9) - (1408 - (851 + 554))]] = v82[v84[14 - (10 + 1)]];
								v76 = v76 + (2 - 1);
								v84 = v72[v76];
								v82[v84[(1 - 0) + 1]] = v64[v84[(312 - (115 + 187)) - ((40 - 13) - (17 + 3))]];
								v76 = v76 + 1 + 0 + 0 + 0;
								v84 = v72[v76];
								v82[v84[(1900 - (1056 + 843)) + 1 + 0]] = v64[v84[(31 - 23) - (7 - 2)]];
								v76 = v76 + (1162 - (160 + 1001));
								v84 = v72[v76];
								v82[v84[2 + 0]] = v64[v84[((5 + 1) - (7 - 3)) + (1977 - (286 + 1690))]];
								v76 = v76 + (1 - (911 - (98 + 813)));
								v84 = v72[v76];
								v82[v84[360 - (237 + 121)]] = v64[v84[(899 - (525 + 372)) + (1 - 0)]];
								v76 = v76 + (3 - 2) + ((142 - (96 + 46)) - (777 - (643 + 134)));
								v84 = v72[v76];
								v82[v84[1 + 1]] = v82[v84[1 + 2 + 0]];
								v76 = v76 + (4 - 3) + (0 - 0);
								v84 = v72[v76];
								v82[v84[(7 - 5) + 0 + 0]] = v82[v84[(855 - 419) - ((312 - 159) + (999 - (316 + 403)))]];
								v76 = v76 + 1;
								v84 = v72[v76];
								v82[v84[(4 + 1) - (8 - 5)]] = v82[v84[(1152 - (212 + 937)) + ((0 + 0) - (0 + 0))]] + v84[2 + (4 - 2)];
								v76 = v76 + 1 + 0 + 0;
								v84 = v72[v76];
								v251 = v84[1 + 1 + 0 + 0];
								v249, v250 = v75(v82[v251](v13(v82, v251 + 1 + 0, v84[(13 - 9) - (4 - 3)])));
								v77 = (v250 + v251) - ((1 - 0) + 0 + 0);
								v248 = 0 + 0;
								for v340 = v251, v77 do
									local v341 = 0 - 0;
									while true do
										if (v341 == ((33 + 634) - ((261 - 172) + (1867 - (1115 + 174))))) then
											v248 = v248 + (18 - (12 + 5));
											v82[v340] = v249[v248];
											break;
										end
									end
								end
								v76 = v76 + 1 + (1014 - (85 + 929));
								v84 = v72[v76];
								v251 = v84[(11 - 8) - (1868 - (1151 + 716))];
								v82[v251] = v82[v251](v13(v82, v251 + ((2240 - 1190) - ((1215 - 643) + (1182 - 705))), v77));
								v76 = v76 + 1 + 0 + (1973 - (1656 + 317)) + 0 + 0;
								v84 = v72[v76];
								v82[v84[((6 + 1) - (13 - 8)) + (0 - 0)]] = v64[v84[(355 - (5 + 349)) + 2 + 0]];
								v76 = v76 + ((413 - 326) - (43 + 41 + (1273 - (266 + 1005))));
								v84 = v72[v76];
								v82[v84[2 + 0]] = v64[v84[(13 - 9) - (1 + 0)]];
								v76 = v76 + (1 - 0);
								v84 = v72[v76];
								v82[v84[(5 - 3) + 0 + 0]] = v82[v84[(2094 - 1249) - ((2193 - (561 + 1135)) + (819 - 474))]];
								v76 = v76 + (1 - 0) + 0;
								v84 = v72[v76];
								v82[v84[(3 - 2) + (1067 - (507 + 559))]] = #v82[v84[(3352 - 2016) - ((1871 - 1266) + (1116 - (212 + 176)))]];
								v76 = v76 + (906 - (250 + 655));
								v84 = v72[v76];
								v82[v84[5 - 3]] = v82[v84[1 + 2 + (0 - 0)]] % v82[v84[(12 - 4) - (1960 - (1869 + 87))]];
								v76 = v76 + (3 - (1245 - (965 + 278)));
								v84 = v72[v76];
								v82[v84[(3 - 2) + (2 - 1)]] = v84[(1911 - (484 + 1417)) - 7] + v82[v84[4 + 0]];
								v76 = v76 + (2 - 1) + 0;
								v84 = v72[v76];
								v82[v84[(7 - 2) - ((776 - (48 + 725)) + (0 - 0))]] = #v82[v84[((18 - 11) - (3 + 1)) + 0 + 0]];
								v76 = v76 + ((1309 - 819) - ((866 - 409) + (1362 - (1190 + 140))));
								v84 = v72[v76];
								v82[v84[1 + 0 + 1 + 0]] = v82[v84[(2258 - (152 + 701)) - ((2143 - (430 + 881)) + (1519 - (303 + 646)))]] % v82[v84[2 + 2]];
								v76 = v76 + (896 - (557 + 338)) + 0 + 0;
								v84 = v72[v76];
								v82[v84[(2 - 1) + (3 - 2)]] = v84[((1854 - 1156) - ((784 - 420) + (703 - (320 + 59)))) - (808 - (499 + 302))] + v82[v84[(734 - (628 + 104)) + 2]];
								v76 = v76 + ((1663 - (39 + 827)) - ((1622 - 1034) + (2099 - (439 + 1452))));
								v84 = v72[v76];
								v82[v84[((1960 - (105 + 1842)) - (17 - 9)) - 3]] = v82[v84[(23 - 17) - 3]] + v84[(2769 - 965) - (76 + 808 + (2680 - 1764))];
								v76 = v76 + ((1 + 0) - ((0 - 0) + (0 - 0)));
								v84 = v72[v76];
								v251 = v84[106 - (103 + 1)];
								v249, v250 = v75(v82[v251](v13(v82, v251 + (555 - (475 + 79)), v84[(4 - 2) + 1 + 0])));
								v77 = (v250 + v251) - ((2092 - 1438) - (30 + 202 + 371 + 50));
								v248 = 1503 - (1395 + 108);
								for v342 = v251, v77 do
									local v343 = 0 - 0;
									while true do
										if (v343 == (819 - (731 + 88))) then
											v248 = v248 + (1205 - (7 + 1197));
											v82[v342] = v249[v248];
											break;
										end
									end
								end
								v76 = v76 + ((825 + 1065) - (336 + 1233 + 112 + 208));
								v84 = v72[v76];
								v251 = v84[(320 - (27 + 292)) + (2 - 1)];
								v249, v250 = v75(v82[v251](v13(v82, v251 + (2 - 1) + (0 - 0), v77)));
								v77 = (v250 + v251) - ((12 - 9) - (3 - 1));
								v248 = 605 - ((601 - 285) + (1209 - (1059 - (43 + 96))));
								for v344 = v251, v77 do
									local v345 = 158 - (139 + 19);
									local v346;
									while true do
										if (v345 == (0 - 0)) then
											v346 = 0 - 0;
											while true do
												if (v346 == (0 - 0)) then
													v248 = v248 + ((2 + 0) - (1 + 0));
													v82[v344] = v249[v248];
													break;
												end
											end
											break;
										end
									end
								end
								v76 = v76 + (1 - 0) + 0 + 0;
								v84 = v72[v76];
								v251 = v84[(9 - 4) - (1 + 2)];
								v82[v251] = v82[v251](v13(v82, v251 + 1 + 0, v77));
								v76 = v76 + ((1935 - (305 + 176)) - (89 + 577 + ((1536 + 519) - ((2164 - 915) + (1770 - (1414 + 337))))));
								v84 = v72[v76];
								v82[v84[(2367 - (1642 + 298)) - ((938 - 578) + (112 - 47))]] = v82[v84[(8 - 5) + (0 - 0)]] % v84[(518 - (159 + 101)) - ((213 - 141) + 3 + 4 + (681 - (251 + 255)))];
								v76 = v76 + ((1 + 0) - ((2058 - (357 + 615)) - (78 + 608 + 281 + 119)));
								v84 = v72[v76];
								v251 = v84[(4 - 2) + 0 + 0];
								v249, v250 = v75(v82[v251](v82[v251 + ((4 - 2) - (1 + 0))]));
								v77 = (v250 + v251) - (1 - (0 + 0));
								v248 = (1562 - (96 + 567)) - ((725 - 222) + 249 + 147);
								for v347 = v251, v77 do
									local v348 = 0 - 0;
									while true do
										if (v348 == (1301 - (384 + 917))) then
											v248 = v248 + ((397 - 215) - ((789 - (128 + 569)) + (1632 - (1407 + 136))));
											v82[v347] = v249[v248];
											break;
										end
									end
								end
								v76 = v76 + (1 - 0);
								v84 = v72[v76];
								v251 = v84[((1890 - (687 + 1200)) + (1710 - (556 + 1154))) - (3 - 2)];
								v82[v251](v13(v82, v251 + 1 + (95 - (9 + 86)), v77));
							end
						elseif (((3011 - (275 + 146)) == (422 + 2168)) and (v85 <= ((91 - (29 + 35)) + (23 - 6)))) then
							local v145 = 0 - 0;
							local v146;
							local v147;
							local v148;
							local v149;
							while true do
								if (v145 == (5 - 3)) then
									for v355 = v146, v77 do
										local v356 = ((339 - 110) - ((322 - 249) + 102 + 54)) + (1012 - (53 + 959));
										while true do
											if ((v356 == (1750 - (512 + 1238))) or ((490 - (312 + 96)) >= (3245 - 1375))) then
												v149 = v149 + (286 - (147 + 138)) + (899 - (813 + 86));
												v82[v355] = v147[v149];
												break;
											end
										end
									end
									break;
								end
								if ((0 + 0) == v145) then
									v146 = v84[(12 - 5) - 5];
									v147, v148 = v75(v82[v146](v13(v82, v146 + (425 - (104 + 320)) + (492 - (18 + 474)), v84[(1329 - (1206 + 117)) - (2 + 1)])));
									v145 = 3 - 2;
								end
								if ((1087 - (860 + 226)) == v145) then
									v77 = (v148 + v146) - (1593 - (683 + 909));
									v149 = 0 - 0;
									v145 = 305 - (121 + 182);
								end
							end
						elseif (v85 == ((1 + 0 + (1375 - (988 + 252))) - (379 - (134 + 154)))) then
							local v289;
							v82[v84[1 + 1]] = v84[1 + 0 + (1972 - (49 + 1921))];
							v76 = v76 + ((891 - (223 + 667)) - (52 - (51 + 1)));
							v84 = v72[v76];
							v289 = v84[(2144 - 898) - ((1038 - 553) + (806 - (13 + 34)))];
							v82[v289] = v82[v289](v13(v82, v289 + ((1127 - (146 + 979)) - 1), v84[(337 + 855) - ((1047 - (311 + 294)) + (2083 - 1336))]));
							v76 = v76 + ((482 + 654) - (832 + (1746 - (496 + 947))));
							v84 = v72[v76];
							v82[v84[948 - ((1446 - (1233 + 125)) + 349 + 509)]][v82[v84[1 + 0 + 2]]] = v82[v84[2 + 2]];
							v76 = v76 + 1 + 0 + (1645 - (963 + 682));
							v84 = v72[v76];
							v289 = v84[2];
							v82[v289] = v82[v289](v82[v289 + 1 + 0]);
							v76 = v76 + (999 - (197 + 801)) + (0 - 0);
							v84 = v72[v76];
							v82[v84[(3824 - 3033) - ((2270 - (504 + 1000)) + 20 + 3)]] = v65[v84[11 - 8]];
						else
							v82[v84[(7 + 2) - 7]] = v65[v84[(3 + 0) - (0 + 0)]];
						end
						v76 = v76 + ((2 - 0) - 1);
						break;
					end
					if (v92 == 0) then
						v84 = v72[v76];
						v85 = v84[1 + 0];
						v92 = 1;
					end
				end
			end
		end;
	end
	return v29(v28(), {}, v17)(...);
end
return v15("LOL!263Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E736572742Q033Q0073796E03073Q0072657175657374030C3Q00682Q74705F7265717565737403023Q005F47030A3Q00EEE2C90BD991D411DF9203083Q007EB1A3BB4586DBA7030A3Q001CEC38EBC309DE25CBAE03053Q009C43AD4AA5028Q00026Q00F03F03043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203043Q004B69636B031C3Q0015B95D1FF1124739A74C04E6666A3BB64D13AE664B3DA45A1FB2210803073Q002654D72976DC46030B3Q006F37303CC163022315FB0203053Q009E307642722Q01035C3Q00A330042660FFB4E43611213DA2F2BF2C053466B6FEB9271F3867A0F5BF6A13397EEACDAE3C1F3A3EA3F2A721037972B7F8A36B023375B6B4A321113260EAF6AA2D1E7960B1FABF2D130970AAF5BF211E223CB6EFAA2315653DA9EEAA03073Q009BCB44705613C52Q033Q0073CF3A03083Q009826BD569C20188503063Q00D152B34EF35303043Q00269C37C72Q033Q008F584803083Q0023C81D1C4873149A03053Q007063612Q6C00BE3Q0012233Q00013Q00206Q000200122Q000100013Q00202Q00010001000300122Q000200013Q00202Q00020002000400122Q000300053Q00062Q0003000A000100010004293Q000A000100122E000300063Q00201200040003000700122E000500083Q00201200050005000900122E000600083Q00201200060006000A00062800073Q000100062Q00033Q00054Q00033Q00064Q00038Q00033Q00044Q00033Q00014Q00033Q00023Q00122E0008000B3Q00060E0008001D00013Q0004293Q001D000100122E0008000B3Q00201200080008000C00061A00080021000100010004293Q0021000100122E0008000D3Q00061A00080021000100010004293Q0021000100122E0008000C3Q00122E0009000E4Q0015000A00073Q00122Q000B000F3Q00122Q000C00106Q000A000C00024Q00090009000A00062Q0009003100013Q0004293Q0031000100122E0009000E4Q0006000A00073Q00122Q000B00113Q00122Q000C00126Q000A000C00024Q00090009000A00062Q0009009D000100010004293Q009D0001001208000900136Q000A000C3Q00260500090038000100130004293Q00380001001208000A00136Q000B000B3Q001208000900143Q00260500090033000100140004293Q003300014Q000C000C3Q002605000A0048000100130004293Q00480001001208000D00133Q002605000D0042000100140004293Q00420001001208000A00143Q0004293Q00480001000E0F0013003E0001000D0004293Q003E0001001208000B00136Q000C000C3Q001208000D00143Q0004293Q003E0001002605000A003B000100140004293Q003B0001002605000B004A000100130004293Q004A0001001208000C00133Q002605000C004D000100130004293Q004D0001001208000D00136Q000E00103Q002605000D0090000100140004293Q009000014Q001000103Q002605000E0081000100140004293Q00810001002605000F0056000100130004293Q00560001001208001000133Q00260500100059000100130004293Q00590001001208001100136Q001200123Q0026050011005D000100130004293Q005D0001001208001200133Q00260500120060000100130004293Q00600001001208001300136Q001400143Q00260500130064000100130004293Q00640001001208001400133Q00260500140067000100130004293Q00670001001208001500133Q0026050015006A000100130004293Q006A000100122E001600153Q00200A00160016001600202Q00160016001700202Q0016001600184Q001800073Q00122Q001900193Q00122Q001A001A6Q0018001A6Q00163Q00016Q00013Q00044Q006A00010004293Q006700010004293Q006000010004293Q006400010004293Q006000010004293Q005900010004293Q005D00010004293Q005900010004293Q004D00010004293Q005600010004293Q004D0001002605000E0054000100130004293Q00540001001208001100133Q00260500110088000100140004293Q00880001001208000E00143Q0004293Q0054000100260500110084000100130004293Q00840001001208000F00136Q001000103Q001208001100143Q0004293Q008400010004293Q005400010004293Q004D0001002605000D0051000100130004293Q00510001001208000E00136Q000F000F3Q001208000D00143Q0004293Q005100010004293Q004D00010004293Q009D00010004293Q004A00010004293Q009D00010004293Q003B00010004293Q009D00010004293Q0033000100122E0009000E4Q001F000A00073Q00122Q000B001B3Q00122Q000C001C6Q000A000C000200202Q0009000A001D4Q000900073Q00122Q000A001E3Q00122Q000B001F6Q0009000B00024Q000A00084Q001B000B3Q00022Q0018000C00073Q00122Q000D00203Q00122Q000E00216Q000C000E00024Q000B000C00094Q000C00073Q00122Q000D00223Q00122Q000E00236Q000C000E00024Q000D00073Q001208000E00243Q00122D000F00256Q000D000F00024Q000B000C000D4Q000A0002000200122Q000B00263Q000628000C0001000100012Q00033Q000A4Q001C000B000200012Q00078Q00193Q00013Q00023Q00033Q00028Q00026Q00F03F026Q007040023C3Q001208000200016Q000300033Q001208000400013Q00260500040003000100010004293Q000300010026050002000B000100020004293Q000B00012Q001000056Q0003000600034Q001D000500064Q000B00055Q00260500020002000100010004293Q00020001001208000500013Q00260500050012000100020004293Q00120001001208000200023Q0004293Q000200010026050005000E000100010004293Q000E00012Q001B00066Q000D000300063Q00122Q000600026Q00075Q00122Q000800023Q00042Q0006003600012Q0010000A00014Q002A000B00036Q000C00026Q000D00036Q000E00046Q000F00056Q00108Q001100093Q00202Q0012000900024Q000F00126Q000E3Q00024Q000F00046Q001000056Q001100016Q001200016Q00120009001200102Q0012000200124Q001300016Q00130009001300102Q00130002001300202Q0013001300024Q001000136Q000F8Q000D3Q000200202Q000D000D00034Q000C000D6Q000A3Q00010004200006001A0001001208000500023Q0004293Q000E00010004293Q000200010004293Q000300010004293Q000200012Q00193Q00017Q00023Q00030A3Q006C6F6164737472696E6703043Q00426F647900063Q0012213Q00016Q00015Q00202Q0001000100026Q000200026Q000100016Q00017Q00", v9(), ...);
