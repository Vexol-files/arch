-- This code isnt obfuscated bru

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
	local v18 = 1 - 0;
	local v19;
	v16 = v4(v3(v16, 5), "..", function(v30)
		if (v1(v30, 2) == (232 - 151)) then
			local v88 = 1636 - (1373 + 263);
			while true do
				if (v88 == 0) then
					v19 = v0(v3(v30, 1001 - (451 + 549), 1 + 0));
					return "";
				end
			end
		else
			local v89 = 0 - 0;
			local v90;
			while true do
				if (v89 == (0 - 0)) then
					v90 = v2(v0(v30, 1400 - (746 + 638)));
					if v19 then
						local v129 = 0;
						local v130;
						while true do
							if (v129 == (0 + 0)) then
								v130 = v5(v90, v19);
								v19 = nil;
								v129 = 1;
							end
							if (v129 == (1 - 0)) then
								return v130;
							end
						end
					else
						return v90;
					end
					break;
				end
			end
		end
	end);
	local function v20(v31, v32, v33)
		if v33 then
			local v91 = 0;
			local v92;
			local v93;
			while true do
				if (v91 == (341 - (218 + 123))) then
					v92 = (1581 - (1535 + 46)) - (0 + 0);
					v93 = nil;
					v91 = 1 + 0;
				end
				if (v91 == (561 - (306 + 254))) then
					while true do
						if (v92 == ((0 + 0) - (0 - 0))) then
							local v132 = 0;
							while true do
								if ((1467 - (899 + 568)) == v132) then
									v93 = (v31 / (((2 + 1 + (0 - 0)) - (604 - (268 + 335))) ^ (v32 - ((292 - (60 + 230)) - (573 - (426 + 146)))))) % (((75 + 546) - (555 + (1520 - (282 + 1174)))) ^ (((v33 - ((1743 - (569 + 242)) - ((2468 - 1611) + 5 + 69))) - (v32 - ((1593 - (706 + 318)) - ((1618 - (721 + 530)) + ((1557 - (945 + 326)) - 85))))) + ((2662 - 1596) - (61 + 7 + (1697 - (271 + 429))))));
									return v93 - (v93 % (928 - (197 + 17 + 713)));
								end
							end
						end
					end
					break;
				end
			end
		else
			local v94 = 1500 - (1408 + 92);
			local v95;
			local v96;
			while true do
				if (v94 == (1086 - (461 + 625))) then
					v95 = 0 + ((2558 - (993 + 295)) - (12 + 214 + 1044));
					v96 = nil;
					v94 = 1172 - (418 + 753);
				end
				if (v94 == (1 + 0)) then
					while true do
						if (v95 == (0 + 0 + 0)) then
							v96 = (879 - (83 + 199 + 151 + 444)) ^ (v32 - (530 - (406 + 123)));
							return (((v31 % (v96 + v96)) >= v96) and 1) or ((3406 - (1749 + 20)) - (((1576 + 5055) - (6430 - (1249 + 73))) + 114));
						end
					end
					break;
				end
			end
		end
	end
	local function v21()
		local v34 = 0;
		local v35;
		local v36;
		while true do
			if (v34 == 1) then
				while true do
					local v117 = 0 + 0;
					while true do
						if (v117 == (1145 - (466 + 679))) then
							if (v35 == ((2 - 1) + 0)) then
								return v36;
							end
							if (v35 == 0) then
								local v148 = 0 - 0;
								while true do
									if (v148 == (1900 - (106 + 1794))) then
										v36 = v1(v16, v18, v18);
										v18 = v18 + 1 + 0 + 0 + 0;
										v148 = 2 - 1;
									end
									if (v148 == (2 - 1)) then
										v35 = (1072 - (4 + 110)) - ((1476 - (57 + 527)) + 65);
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
			if ((1427 - (41 + 1386)) == v34) then
				v35 = (220 - (17 + 86)) - (22 + 10 + (189 - 104));
				v36 = nil;
				v34 = 1;
			end
		end
	end
	local function v22()
		local v37 = 0 - 0;
		local v38;
		local v39;
		while true do
			if (v37 == 1) then
				return (v39 * (469 - (379 - (122 + 44)))) + v38;
			end
			if (v37 == (0 - 0)) then
				v38, v39 = v1(v16, v18, v18 + ((12 - 8) - 2));
				v18 = v18 + ((3 + 0) - 1);
				v37 = 1 + 0;
			end
		end
	end
	local function v23()
		local v40, v41, v42, v43 = v1(v16, v18, v18 + ((714 - 361) - ((152 - (30 + 35)) + ((444 + 201) - (1639 - (1043 + 214))))));
		v18 = v18 + (15 - 11);
		return (v43 * (16778428 - (323 + 889))) + (v42 * (65716 - (67 + (303 - 190)))) + (v41 * (188 + (648 - (361 + 219)))) + v40;
	end
	local function v24()
		local v44 = 320 - (53 + 267);
		local v45;
		local v46;
		local v47;
		local v48;
		local v49;
		local v50;
		while true do
			if (v44 == (1 + 0)) then
				v47 = (414 - (15 + 398)) - (982 - (18 + 964));
				v48 = (v20(v46, 1 + 0, (297 - 218) - (35 + 24)) * ((954 - (506 + 296 + 150)) ^ ((935 - (20 + 830)) - (42 + 11)))) + v45;
				v44 = 128 - (116 + 10);
			end
			if (v44 == 2) then
				v49 = v20(v46, (3 + 34) - (754 - (542 + 196)), 66 - 35);
				v50 = ((v20(v46, ((27 + 65) - 68) + (446 - (74 + 71 + 106 + 187))) == ((2629 - 1631) - (((3478 - 2121) - ((1967 - (1126 + 425)) + 26)) + (487 - (118 + 287))))) and -((7 - 5) - (1122 - (118 + 1003)))) or (2 - 1);
				v44 = 380 - (142 + 235);
			end
			if (v44 == 3) then
				if (v49 == ((0 - 0) + 0 + 0)) then
					if (v48 == ((0 - (977 - (553 + 424))) - 0)) then
						return v50 * (1187 - ((2020 - 951) + (1604 - (998 + 488))));
					else
						local v131 = (0 + 0) - (0 + 0);
						while true do
							if (v131 == ((0 + 0) - (0 + 0))) then
								v49 = 1 + 0 + (0 - 0);
								v47 = (0 - 0) - 0;
								break;
							end
						end
					end
				elseif (v49 == (2031 + (15 - 8) + 3 + 6)) then
					return ((v48 == (0 - 0)) and (v50 * ((754 - (239 + 514)) / ((89 + 163 + (1868 - (797 + 532))) - (268 + 100 + 423))))) or (v50 * NaN);
				end
				return v8(v50, v49 - ((888 + 1744 + (1368 - 786)) - 2191)) * (v47 + (v48 / ((1204 - (373 + 829)) ^ (70 - ((782 - ((932 - (476 + 255)) + (1701 - (369 + 761)))) + 8)))));
			end
			if (v44 == (0 + 0)) then
				v45 = v23();
				v46 = v23();
				v44 = 1 - 0;
			end
		end
	end
	local function v25(v51)
		local v52 = 0;
		local v53;
		local v54;
		while true do
			if (v52 == 0) then
				v53 = nil;
				if not v51 then
					local v124 = 0 - 0;
					while true do
						if (v124 == 0) then
							v51 = v23();
							if (v51 == (238 - (64 + 174))) then
								return "";
							end
							break;
						end
					end
				end
				v52 = 1 + 0;
			end
			if (v52 == (3 - 0)) then
				return v6(v54);
			end
			if (v52 == 2) then
				v54 = {};
				for v118 = (340 - (144 + 192)) - 3, #v53 do
					v54[v118] = v2(v1(v3(v53, v118, v118)));
				end
				v52 = 219 - (42 + 174);
			end
			if (v52 == (1 + 0)) then
				v53 = v3(v16, v18, (v18 + v51) - (1139 - (97 + 19 + 435 + 587)));
				v18 = v18 + v51;
				v52 = 2;
			end
		end
	end
	local v26 = v23;
	local function v27(...)
		return {...}, v12("#", ...);
	end
	local function v28()
		local v55 = (function()
			return function(v97, v98, v99, v100, v101, v102, v103, v104)
				local v105 = 1504 - (363 + 1141);
				local v97;
				local v98;
				local v99;
				while true do
					if (v105 == 1) then
						v99 = (function()
							return;
						end)();
						while true do
							if (v97 == #"\\") then
								if (v98 == #",") then
									v99 = (function()
										return v100() ~= (1206 - ((2276 - (1183 + 397)) + (1552 - 1042)));
									end)();
								elseif (v98 == ((3 + 0) - (1 + 0))) then
									v99 = (function()
										return v101();
									end)();
								elseif (v98 ~= #"91(") then
								else
									v99 = (function()
										return v102();
									end)();
								end
								v103[v104] = (function()
									return v99;
								end)();
								break;
							end
							if (v97 ~= ((1975 - (1913 + 62)) - 0)) then
							else
								local v134 = 0 + 0;
								local v135;
								local v136;
								while true do
									if (0 == v134) then
										v135 = (function()
											return (3340 - 2078) - ((3024 - (565 + 1368)) + (643 - 472));
										end)();
										v136 = (function()
											return;
										end)();
										v134 = 1662 - (1477 + 184);
									end
									if (v134 == 1) then
										while true do
											if (v135 ~= ((0 - 0) + 0 + 0)) then
											else
												v136 = (function()
													return (856 - (564 + 292)) - (0 - 0);
												end)();
												while true do
													if (v136 == ((2613 - 1746) - (550 + (621 - (244 + 60))))) then
														v98 = (function()
															return v100();
														end)();
														v99 = (function()
															return nil;
														end)();
														v136 = (function()
															return (1 + 0) - (476 - (41 + 435));
														end)();
													end
													if (v136 == (1 - (1001 - (938 + 63)))) then
														v97 = (function()
															return #"<";
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
							end
						end
						v105 = 2;
					end
					if (v105 == 2) then
						return v97, v98, v99, v100, v101, v102, v103, v104;
					end
					if (v105 == 0) then
						v97 = (function()
							return (445 + 133) - ((1511 - (936 + 189)) + 64 + 128);
						end)();
						v98 = (function()
							return;
						end)();
						v105 = 1;
					end
				end
			end;
		end)();
		local v56 = (function()
			return function(v106, v107, v108)
				local v109 = (function()
					return (1613 - (1565 + 48)) - (0 + 0);
				end)();
				local v110 = (function()
					return;
				end)();
				while true do
					if (v109 == ((1138 - (782 + 356)) - (267 - (176 + 91)))) then
						v110 = (function()
							return 285 - ((348 - 214) + 151);
						end)();
						while true do
							if (v110 ~= (1665 - ((1429 - 459) + (1787 - (975 + 117))))) then
							else
								local v137 = 1875 - (157 + 1718);
								local v138;
								local v139;
								while true do
									if (v137 == (0 + 0)) then
										v138 = (function()
											return 0 - (0 - 0);
										end)();
										v139 = (function()
											return;
										end)();
										v137 = 1;
									end
									if (v137 == 1) then
										while true do
											if (v138 ~= (1990 - (582 + (4813 - 3405)))) then
											else
												v139 = (function()
													return (1392 - (697 + 321)) - ((334 - 211) + (531 - 280));
												end)();
												while true do
													if (v139 == ((0 - 0) - 0)) then
														local v188 = 0;
														local v189;
														while true do
															if ((0 + 0) == v188) then
																v189 = (function()
																	return (0 - 0) - (0 - 0);
																end)();
																while true do
																	if (v189 == (1824 - ((2422 - (322 + 905)) + (1240 - (602 + 9))))) then
																		local v509 = 0;
																		while true do
																			if (v509 == 0) then
																				v106[v107 - #"~"] = (function()
																					return v108();
																				end)();
																				return v106, v107, v108;
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
										break;
									end
								end
							end
						end
						break;
					end
				end
			end;
		end)();
		local v57 = (function()
			return {};
		end)();
		local v58 = (function()
			return {};
		end)();
		local v59 = (function()
			return {};
		end)();
		local v60 = (function()
			return {v57,v58,nil,v59};
		end)();
		local v61 = (function()
			return v23();
		end)();
		local v62 = (function()
			return {};
		end)();
		for v70 = #"~", v61 do
			FlatIdent_2BD95, Type, Cons, v21, v24, v25, v62, v70 = (function()
				return v55(FlatIdent_2BD95, Type, Cons, v21, v24, v25, v62, v70);
			end)();
		end
		v60[#"19("] = (function()
			return v21();
		end)();
		for v71 = #"~", v23() do
			local v72 = (function()
				return v21();
			end)();
			if (v20(v72, #",", #"|") == ((1645 - (245 + 702)) - (208 + (1548 - 1058)))) then
				local v113 = (function()
					return 0 + 0 + 0;
				end)();
				local v114 = (function()
					return;
				end)();
				local v115 = (function()
					return;
				end)();
				local v116 = (function()
					return;
				end)();
				while true do
					if (v113 ~= (1901 - (260 + 1638))) then
					else
						if (v20(v115, #"91(", #"xxx") == #"[") then
							v116[#"0836"] = (function()
								return v62[v116[#"?id="]];
							end)();
						end
						v57[v71] = (function()
							return v116;
						end)();
						break;
					end
					if (v113 == ((441 - (382 + 58)) + (0 - 0))) then
						v116 = (function()
							return {v22(),v22(),nil,nil};
						end)();
						if (v114 == (0 - 0)) then
							local v141 = 0 - 0;
							local v142;
							local v143;
							while true do
								if ((1 + 0) == v141) then
									while true do
										if (v142 == ((2470 - (1121 + 569)) - (162 + (832 - (22 + 192))))) then
											v143 = (function()
												return (885 - (483 + 200)) - (14 + (1651 - (1404 + 59)));
											end)();
											while true do
												if (v143 ~= ((1847 - 1172) - ((716 - 182) + (906 - (468 + 297))))) then
												else
													v116[#"-19"] = (function()
														return v22();
													end)();
													v116[#"xnxx"] = (function()
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
								if (v141 == (562 - (334 + 228))) then
									v142 = (function()
										return (0 - 0) + (0 - 0);
									end)();
									v143 = (function()
										return;
									end)();
									v141 = 1 - 0;
								end
							end
						elseif (v114 == #"\\") then
							v116[#"asd"] = (function()
								return v23();
							end)();
						elseif (v114 == (1 + 1)) then
							v116[#"xxx"] = (function()
								return v23() - (2 ^ (33 - (253 - (141 + 95))));
							end)();
						elseif (v114 == #"asd") then
							local v151 = 0 + 0;
							local v152;
							local v153;
							while true do
								if ((0 - 0) == v151) then
									v152 = (function()
										return 0;
									end)();
									v153 = (function()
										return;
									end)();
									v151 = 2 - 1;
								end
								if ((1 + 0) == v151) then
									while true do
										if (v152 == (0 - 0)) then
											v153 = (function()
												return 0 + (0 - 0);
											end)();
											while true do
												if (v153 == (0 + 0 + 0 + 0)) then
													v116[#"-19"] = (function()
														return v23() - (((2 - 0) + 0) ^ ((20 + 13) - 17));
													end)();
													v116[#".dev"] = (function()
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
						end
						v113 = (function()
							return 165 - (92 + 71);
						end)();
					end
					if (v113 == (1638 - (1373 + 263))) then
						if (v20(v115, #".", #"~") ~= #"!") then
						else
							v116[1 + 1] = (function()
								return v62[v116[2 - 0]];
							end)();
						end
						if (v20(v115, (767 - (574 + 191)) - (0 + 0), 4 - 2) == #">") then
							v116[#"-19"] = (function()
								return v62[v116[#"asd"]];
							end)();
						end
						v113 = (function()
							return 2 + 1;
						end)();
					end
					if (v113 ~= ((1849 - (254 + 595)) - (451 + 549))) then
					else
						local v127 = (function()
							return 0 - 0;
						end)();
						local v128 = (function()
							return;
						end)();
						while true do
							if (v127 ~= ((126 - (55 + 71)) + 0)) then
							else
								v128 = (function()
									return 0 - 0;
								end)();
								while true do
									if (v128 == (1 - (1790 - (573 + 1217)))) then
										v113 = (function()
											return (2 - 1) - (0 + 0);
										end)();
										break;
									end
									if (v128 ~= ((0 - 0) + 0)) then
									else
										v114 = (function()
											return v20(v72, 941 - (714 + 225), #"91(");
										end)();
										v115 = (function()
											return v20(v72, #".com", 17 - 11);
										end)();
										v128 = (function()
											return (1 - 0) + 0 + 0;
										end)();
									end
								end
								break;
							end
						end
					end
				end
			end
		end
		for v73 = #">", v23() do
			v58, v73, v28 = (function()
				return v56(v58, v73, v28);
			end)();
		end
		return v60;
	end
	local function v29(v64, v65, v66)
		local v67 = v64[(1 - 0) + (806 - (118 + 688))];
		local v68 = v64[((49 - (25 + 23)) + 1 + 0) - ((1886 - (927 + 959)) + (0 - 0))];
		local v69 = v64[344 - ((950 - (16 + 716)) + (237 - 114))];
		return function(...)
			local v74 = v67;
			local v75 = v68;
			local v76 = v69;
			local v77 = v27;
			local v78 = 1582 - (1535 + (143 - (11 + 86)));
			local v79 = -(2 - 1);
			local v80 = {};
			local v81 = {...};
			local v82 = v12("#", ...) - ((2 - 1) + (0 - 0));
			local v83 = {};
			local v84 = {};
			for v111 = (2356 - (503 + 1293)) - ((854 - 548) + ((545 + 208) - (1560 - (810 + 251)))), v82 do
				if ((v111 >= v76) or (4942 == (2709 + 1194))) then
					v80[v111 - v76] = v81[v111 + 1 + 0 + 0 + 0];
				else
					v84[v111] = v81[v111 + ((534 - (43 + 490)) - (733 - (711 + 22)))];
				end
			end
			local v85 = (v82 - v76) + (3 - 2);
			local v86;
			local v87;
			while true do
				local v112 = 859 - (240 + 619);
				while true do
					if (v112 == (1 + 0 + 0)) then
						if (v87 <= ((2367 - 878) - (899 + 568))) then
							if ((v87 <= 10) or ((170 + 2385) < (2984 - (1344 + 400))) or (248 > 4845)) then
								if (((1974 - (255 + 150)) == 1569) and (v87 <= ((6 + 1) - (2 + 1)))) then
									if ((v87 <= (4 - 3)) or ((15267 - 10540) <= (6461 - (404 + 1335))) or ((5333 - (183 + 223)) <= (3919 - 698))) then
										if (((740 < (3272 + 1665)) and (v87 > (0 + 0 + 0))) or (1780 > 2787)) then
											do
												return;
											end
										else
											local v154 = v86[4 - 2];
											v84[v154](v84[v154 + (604 - ((605 - (10 + 327)) + 335))]);
										end
									elseif (((2548 + 1110) >= 280) and (v87 <= (340 - (118 + 220)))) then
										local v155 = 0 + 0;
										local v156;
										while true do
											if (v155 == (452 - (108 + 341))) then
												v86 = v74[v78];
												v156 = v86[2];
												v84[v156] = v84[v156](v13(v84, v156 + 1 + 0 + (0 - 0), v86[(2520 - (711 + 782)) - (706 + (609 - 291))]));
												v155 = 4;
											end
											if (v155 == (474 - (270 + 199))) then
												v78 = v78 + 1 + 0;
												v86 = v74[v78];
												if not v84[v86[1821 - (580 + 1239)]] then
													v78 = v78 + (2 - 1);
												else
													v78 = v86[(7 + 0) - (1 + 3)];
												end
												break;
											end
											if (v155 == (2 + 2)) then
												v78 = v78 + (2 - 1);
												v86 = v74[v78];
												v84[v86[2 + 0]] = v84[v86[(2421 - (645 + 522)) - (721 + (2320 - (1010 + 780)))]][v84[v86[1275 - (945 + 326 + 0)]]];
												v155 = 23 - 18;
											end
											if (v155 == (0 - 0)) then
												v156 = nil;
												v84[v86[1838 - (1045 + 791)]] = v84[v86[(741 - 448) - ((91 - 31) + 230)]];
												v78 = v78 + (573 - ((931 - (351 + 154)) + (1720 - (1281 + 293))));
												v155 = 267 - (28 + 238);
											end
											if (v155 == (4 - 2)) then
												v86 = v74[v78];
												v84[v86[813 - (569 + 242)]] = v86[(1567 - (1381 + 178)) - 5];
												v78 = v78 + 1;
												v155 = 3 + 0;
											end
											if (v155 == (1 + 0)) then
												v86 = v74[v78];
												v84[v86[1 + 0 + 1]] = v86[(5029 - 3570) - (282 + 609 + 565)];
												v78 = v78 + (471 - (381 + 89));
												v155 = 2;
											end
										end
									elseif (v87 == (3 + 0 + 0)) then
										local v192 = 0 + 0;
										local v193;
										local v194;
										local v195;
										while true do
											if (v192 == (1 - 0)) then
												v78 = v78 + (1501 - ((2564 - (1074 + 82)) + (133 - 72) + 31));
												v86 = v74[v78];
												v84[v86[(2872 - (214 + 1570)) - (461 + 625)]] = v86[1291 - ((2448 - (990 + 465)) + 122 + 173)];
												v78 = v78 + 1 + 0 + 0;
												v192 = 2;
											end
											if (v192 == (0 + 0)) then
												v193 = nil;
												v194 = nil;
												v195 = nil;
												v84[v86[702 - (264 + 7 + (1688 - 1259))]] = v84[v86[(1729 - (1668 + 58)) + (626 - (512 + 114))]];
												v192 = 1;
											end
											if (v192 == (10 - 6)) then
												v194 = v84[v195];
												v193 = v84[v195 + ((1097 - 566) - ((1412 - 1006) + 58 + 65))];
												if (v193 > (1769 - (328 + 1421 + 18 + 2))) then
													if (v194 > v84[v195 + (3 - 2) + (1994 - (109 + 1885))]) then
														v78 = v86[1325 - ((2718 - (1269 + 200)) + (139 - 66))];
													else
														v84[v195 + (817 - (98 + 717)) + (826 - (802 + 24)) + (1 - 0)] = v194;
													end
												elseif (v194 < v84[v195 + ((1447 - 301) - ((899 - (153 + 42 + 238)) + 522 + 157))]) then
													v78 = v86[(1 + 5) - 3];
												else
													v84[v195 + ((2 + 6) - (13 - 8))] = v194;
												end
												break;
											end
											if (v192 == (9 - 6)) then
												v84[v86[1 + 1]] = v86[1 + 0 + 2 + 0];
												v78 = v78 + 1 + 0 + 0 + 0 + 0;
												v86 = v74[v78];
												v195 = v86[1 + 1];
												v192 = 1437 - (797 + 636);
											end
											if (v192 == 2) then
												v86 = v74[v78];
												v84[v86[(5695 - 4522) - ((2037 - (1427 + 192)) + 261 + 492)]] = #v84[v86[(4 - 2) + 1 + 0 + 0 + 0]];
												v78 = v78 + 1;
												v86 = v74[v78];
												v192 = 329 - (192 + 134);
											end
										end
									else
										v84[v86[(3178 - (316 + 960)) - (59 + 47 + 1385 + 409)]] = v84[v86[1 + 0 + (7 - 5)]];
									end
								elseif (v87 <= (((556 - (83 + 468)) - (1809 - (1202 + 604))) + (23 - 18))) then
									if ((v87 <= (7 - 2)) or ((2450 - 1565) >= 1031)) then
										local v157 = 0;
										local v158;
										local v159;
										local v160;
										local v161;
										while true do
											if (v157 == (327 - (45 + 280))) then
												for v331 = v158, v79 do
													local v332 = 0 + 0;
													while true do
														if (v332 == 0) then
															v161 = v161 + ((2 + 0) - (1 + 0));
															v84[v331] = v159[v161];
															break;
														end
													end
												end
												break;
											end
											if (v157 == (1 + 0)) then
												v79 = (v160 + v158) - ((1 + 1) - (1 + 0));
												v161 = 0;
												v157 = 3 - 1;
											end
											if (v157 == (1911 - (340 + 1571))) then
												v158 = v86[1 + 1];
												v159, v160 = v77(v84[v158](v13(v84, v158 + (1773 - (1733 + 39)), v79)));
												v157 = 2 - 1;
											end
										end
									elseif (v87 == ((1154 - (125 + 909)) - ((1952 - (1096 + 852)) + 50 + 60))) then
										v78 = v86[(838 - 251) - (56 + 1 + (1039 - (409 + 103)))];
									else
										v84[v86[(1665 - (46 + 190)) - ((136 - (51 + 44)) + 391 + 995)]] = {};
									end
								elseif (v87 <= ((1428 - (1114 + 203)) - (17 + 86))) then
									v84[v86[(728 - (228 + 498)) + 0 + 0]]();
								elseif (v87 == (19 - (6 + 4))) then
									local v200 = v86[(668 - (174 + 489)) - (7 - 4)];
									v84[v200](v13(v84, v200 + ((2072 - (830 + 1075)) - (122 + (568 - (303 + 221)))), v79));
								else
									v84[v86[(1271 - (231 + 1038)) - (0 + 0)]] = v86[(4 + (1167 - (171 + 991))) - 6];
								end
							elseif (((14646 - 11092) >= (1409 - 884)) and (v87 <= ((34 - 20) + 2 + 0 + 0))) then
								if (v87 <= (45 - 32)) then
									if (v87 <= ((5 - 3) + (13 - 4) + (0 - 0))) then
										local v162 = 1248 - (111 + 1137);
										local v163;
										local v164;
										local v165;
										while true do
											if (v162 == (158 - (91 + 67))) then
												v163 = v86[2];
												v164 = v84[v163 + (5 - 3)];
												v162 = 1 + 0;
											end
											if (v162 == (525 - (423 + 100))) then
												if ((v164 > ((0 + 0) - (0 - 0))) or ((2053 + 1884) <= (2001 - (326 + 445)))) then
													if (v165 <= v84[v163 + ((287 - 221) - ((66 - 36) + (81 - 46)))]) then
														local v505 = 711 - (530 + 181);
														while true do
															if (v505 == 0) then
																v78 = v86[(884 - (614 + 267)) + 0 + (32 - (19 + 13))];
																v84[v163 + (4 - 1)] = v165;
																break;
															end
														end
													end
												elseif ((v165 >= v84[v163 + ((2931 - 1673) - ((2979 - 1936) + 214))]) or ((685 + 1952) < (2999 - 1293))) then
													local v506 = 0 - 0;
													while true do
														if (v506 == (1212 - (323 + (1843 - 954)))) then
															v78 = v86[7 - (1816 - (1293 + 519))];
															v84[v163 + (5 - 2)] = v165;
															break;
														end
													end
												end
												break;
											end
											if (v162 == (2 - 1)) then
												v165 = v84[v163] + v164;
												v84[v163] = v165;
												v162 = 2;
											end
										end
									elseif (v87 == (592 - ((690 - 329) + (944 - 725)))) then
										local v203 = 0;
										local v204;
										local v205;
										local v206;
										local v207;
										while true do
											if ((2 - 1) == v203) then
												v86 = v74[v78];
												v84[v86[(4 + 3) - (1 + 3 + (2 - 1))]] = v65[v86[1 + 1 + 1 + 0]];
												v78 = v78 + 1 + 0;
												v86 = v74[v78];
												v84[v86[(533 + 319) - ((1116 - (709 + 387)) + (2688 - (673 + 1185)))]] = v65[v86[(14 - 9) - 2]];
												v78 = v78 + 1 + (0 - 0);
												v86 = v74[v78];
												v84[v86[(210 - 82) - (83 + 33 + 8 + 2)]] = v65[v86[(1 - 0) + 2]];
												v203 = 1 + 1;
											end
											if (v203 == (19 - 9)) then
												v78 = v78 + ((3796 - 1862) - ((2445 - (446 + 1434)) + (2651 - (1040 + 243))));
												v86 = v74[v78];
												v207 = v86[7 - (14 - 9)];
												v84[v207] = v84[v207](v13(v84, v207 + ((3509 - (559 + 1288)) - ((4092 - 2615) + 184)), v79));
												v78 = v78 + (1932 - (609 + 1322));
												v86 = v74[v78];
												v84[v86[((456 - (13 + 441)) + (0 - 0)) - (0 - 0)]] = v84[v86[3 + (0 - 0)]] % v86[1 + 3];
												v78 = v78 + (857 - (564 + (781 - ((1659 - 1202) + 32))));
												v203 = 4 + 7;
											end
											if (v203 == (3 + 2)) then
												v86 = v74[v78];
												v84[v86[(2 - 0) + (0 - 0)]] = v65[v86[2 + 1]];
												v78 = v78 + (1 - 0) + 0 + 0;
												v86 = v74[v78];
												v84[v86[2 + 0]] = v84[v86[2 + 0 + 1 + 0]];
												v78 = v78 + 1 + 0 + (433 - (153 + 280));
												v86 = v74[v78];
												v84[v86[4 - 2]] = #v84[v86[(19 - 12) - (4 + 0)]];
												v203 = 6;
											end
											if (v203 == (1 + 1)) then
												v78 = v78 + ((387 + 352) - (492 + 50 + 143 + 53));
												v86 = v74[v78];
												v84[v86[(4 - 1) - (1050 - (572 + 295 + 182))]] = v84[v86[3]];
												v78 = v78 + (668 - (89 + 578));
												v86 = v74[v78];
												v84[v86[1 + 0 + (1 - 0)]] = v84[v86[1052 - (572 + 477)]];
												v78 = v78 + 1 + 0 + 0;
												v86 = v74[v78];
												v203 = 2 + 1;
											end
											if (v203 == (1 + 3)) then
												v78 = v78 + ((88 - (84 + 2)) - (1 - 0));
												v86 = v74[v78];
												v207 = v86[379 - (((165 + 63) - ((926 - (497 + 345)) + 1 + 1)) + 235)];
												v84[v207] = v84[v207](v13(v84, v207 + ((1 + 3) - (1336 - (605 + 728))), v79));
												v78 = v78 + 1 + 0 + (0 - 0);
												v86 = v74[v78];
												v84[v86[979 - (553 + 20 + 404)]] = v65[v86[(18 - 13) - (2 + 0)]];
												v78 = v78 + (2 - 1) + 0 + 0;
												v203 = 494 - (457 + 32);
											end
											if (v203 == (5 + 6)) then
												v86 = v74[v78];
												v207 = v86[(1404 - (832 + 570)) - (0 + 0 + 0 + 0)];
												v205, v206 = v77(v84[v207](v84[v207 + (2 - 1)]));
												v79 = (v206 + v207) - (((6040 - 4333) - (401 + 431 + (1366 - (588 + 208)))) - ((657 - 413) + (1860 - (884 + 916))));
												v204 = 0 + (0 - 0);
												for v463 = v207, v79 do
													local v464 = 0 + 0;
													local v465;
													while true do
														if (0 == v464) then
															v465 = 476 - ((694 - (232 + 421)) + (2324 - (1569 + 320)));
															while true do
																if (((232 + 712 + 57) - (47 + 198 + 693 + (212 - 149))) == v465) then
																	v204 = v204 + ((608 - (316 + 289)) - 2) + 0 + 0;
																	v84[v463] = v205[v204];
																	break;
																end
															end
															break;
														end
													end
												end
												v78 = v78 + ((2947 - 1821) - (44 + 892 + 189));
												v86 = v74[v78];
												v203 = 1465 - (666 + 787);
											end
											if (v203 == (428 - (360 + 65))) then
												v84[v86[1 + 0 + (255 - (79 + 175)) + 0]] = v84[v86[(10 - 3) - (3 + 1 + 0)]] + v86[4];
												v78 = v78 + (2 - 1);
												v86 = v74[v78];
												v207 = v86[(7 - 3) - (901 - (503 + 396))];
												v205, v206 = v77(v84[v207](v13(v84, v207 + ((1733 - (92 + 89)) - (1126 + (98 - 47) + 192 + 182)), v86[408 - (70 + 48 + (1123 - 836))])));
												v79 = (v206 + v207) - 1;
												v204 = (0 + 0) - (0 - 0);
												for v466 = v207, v79 do
													v204 = v204 + (1122 - (103 + 15 + 1003));
													v84[v466] = v205[v204];
												end
												v203 = 2 + 2;
											end
											if (v203 == 12) then
												v207 = v86[(2 - 1) + 1];
												v84[v207](v13(v84, v207 + ((202 + 1412) - (1565 + (73 - 25))), v79));
												break;
											end
											if ((1253 - (485 + 759)) == v203) then
												for v469 = v207, v79 do
													v204 = v204 + ((3658 - 2077) - (1183 + (1586 - (442 + 747))));
													v84[v469] = v205[v204];
												end
												v78 = v78 + ((7 - (1140 - (832 + 303))) - (947 - (88 + 858)));
												v86 = v74[v78];
												v207 = v86[2];
												v205, v206 = v77(v84[v207](v13(v84, v207 + 1 + 0 + 0, v79)));
												v79 = (v206 + v207) - (1 + 0 + 0);
												v204 = (82 + 1893) - ((2702 - (766 + 23)) + 62);
												for v472 = v207, v79 do
													local v473 = 0 - 0;
													local v474;
													while true do
														if (v473 == (0 - 0)) then
															v474 = (0 - 0) + 0;
															while true do
																if (v474 == (0 - 0)) then
																	v204 = v204 + (((1075 - (1036 + 37)) + 0 + 0) - (1 - 0));
																	v84[v472] = v205[v204];
																	break;
																end
															end
															break;
														end
													end
												end
												v203 = 8 + 2;
											end
											if (v203 == (1487 - (641 + 839))) then
												v84[v86[((914 - (910 + 3)) + 3) - (4 - 2)]] = #v84[v86[3]];
												v78 = v78 + (1203 - (64 + (1993 - (1466 + 218)) + 829));
												v86 = v74[v78];
												v84[v86[(337 + 396) - ((1624 - (556 + 592)) + 91 + 164)]] = v84[v86[(1941 - (329 + 479)) - ((1223 - (174 + 680)) + (2614 - 1853))]] % v84[v86[((2768 - 1432) - (432 + 173 + (1467 - (396 + 343)))) + 1 + 0]];
												v78 = v78 + (1 - 0);
												v86 = v74[v78];
												v84[v86[(1480 - (29 + 1448)) - 1]] = v86[241 - (64 + (1563 - (135 + 1254)))] + v84[v86[(3 - 2) + (13 - 10)]];
												v78 = v78 + ((1 + 0 + 0) - (1527 - (389 + 1138)));
												v203 = 8;
											end
											if (v203 == (582 - (102 + 472))) then
												v86 = v74[v78];
												v84[v86[(319 + 19) - (80 + 64 + 180 + 12)]] = v84[v86[1548 - (320 + 1225)]] + v86[220 - (42 + (309 - 135))];
												v78 = v78 + 1 + 0 + 0;
												v86 = v74[v78];
												v207 = v86[2];
												v205, v206 = v77(v84[v207](v13(v84, v207 + (1465 - (157 + 1307)) + (1859 - (821 + 1038)), v86[3])));
												v79 = (v206 + v207) - ((2 - 1) + 0);
												v204 = ((366 + 2977) - (3266 - 1427)) - (7 + 10 + (857 - 511) + (2167 - (834 + 192)));
												v203 = 9;
											end
											if (v203 == (0 + 0)) then
												v204 = nil;
												v205, v206 = nil;
												v207 = nil;
												v84[v86[322 - (((21 + 59) - 27) + 6 + 261)]] = v84[v86[1 + 2]];
												v78 = v78 + 1;
												v86 = v74[v78];
												v84[v86[2]] = v65[v86[(644 - 228) - ((319 - (300 + 4)) + 66 + 180 + (397 - 245))]];
												v78 = v78 + ((1650 - (89 + 578)) - ((380 - (112 + 250)) + 964));
												v203 = 1;
											end
											if (v203 == (3 + 3)) then
												v78 = v78 + (2 - (2 - 1));
												v86 = v74[v78];
												v84[v86[1 + 1]] = v84[v86[(9 + 5) - (6 + 5)]] % v84[v86[(567 + 190) - (239 + 514)]];
												v78 = v78 + 1 + 0;
												v86 = v74[v78];
												v84[v86[1 + 0 + 0 + (1415 - (1001 + 413))]] = v86[(2174 - (497 + (769 - 424))) - ((1679 - (244 + 638)) + (1225 - (627 + 66)))] + v84[v86[(8 - 5) + (603 - (512 + 90))]];
												v78 = v78 + (1907 - (1665 + 241)) + (717 - (373 + 344));
												v86 = v74[v78];
												v203 = 4 + 3;
											end
										end
									else
										local v208 = 0 + 0;
										local v209;
										while true do
											if ((5 - 3) == v208) then
												v86 = v74[v78];
												v84[v86[1094 - ((1649 - 674) + (1216 - (35 + 1064)))]] = v84[v86[1878 - (115 + 42 + (3675 - 1957))]][v86[1 + 3 + 0]];
												v78 = v78 + (3 - (1238 - (298 + 938)));
												v208 = 1262 - (233 + 1026);
											end
											if (v208 == (1670 - (636 + 1030))) then
												v78 = v78 + (2 - (2 - (1 + 0)));
												v86 = v74[v78];
												v84[v86[(3 + 0) - (1 + 0)]]();
												v208 = 1 + 4;
											end
											if (v208 == (224 - (55 + 166))) then
												v86 = v74[v78];
												v209 = v86[6 - (1 + 3)];
												v84[v209] = v84[v209](v84[v209 + (1019 - (697 + 33 + 288))]);
												v208 = 4;
											end
											if (v208 == (3 - 2)) then
												v86 = v74[v78];
												v84[v86[269 - ((473 - (36 + 261)) + 91)]] = v65[v86[(12 - 5) - (1372 - (34 + 1334))]];
												v78 = v78 + ((1 + 0) - 0);
												v208 = 2 + 0;
											end
											if (v208 == 0) then
												v209 = nil;
												v84[v86[(1285 - (1035 + 248)) + (21 - (20 + 1))]] = v66[v86[2 + 1]];
												v78 = v78 + ((1458 - (134 + 185)) - ((1915 - (549 + 584)) + ((1837 - (314 + 371)) - (588 + (713 - 505)))));
												v208 = 969 - (478 + 490);
											end
											if (v208 == 5) then
												v78 = v78 + ((2 + 0) - (1173 - (786 + 386)));
												v86 = v74[v78];
												do
													return;
												end
												break;
											end
										end
									end
								elseif (v87 <= ((19 - 13) + ((3187 - (1055 + 324)) - (884 + 916)))) then
									v84[v86[1342 - (1093 + 247)]][v84[v86[(5 + 0) - 2]]] = v84[v86[(2 + 8) - (23 - 17)]];
								elseif ((v87 > ((4214 - 2972) - (((1914 - 1241) - 351) + (2274 - 1369)))) or ((950 + 1719) <= (9280 - 6871))) then
									for v297 = v86[(2112 - 1499) - (454 + 148 + 9)], v86[1192 - ((1147 - 698) + (1428 - (364 + 324)))] do
										v84[v297] = nil;
									end
								else
									local v210 = 0;
									local v211;
									local v212;
									local v213;
									while true do
										if (v210 == (0 - 0)) then
											v211 = 0;
											v212 = nil;
											v210 = 2 - 1;
										end
										if ((1 + 0) == v210) then
											v213 = nil;
											while true do
												if (v211 == ((3652 - 2779) - ((1322 - 496) + (81 - 54) + (1287 - (1249 + 19))))) then
													for v547 = (856 + 92) - (((3495 - 2597) - (232 + (1507 - (686 + 400)))) + 702), #v83 do
														local v548 = v83[v547];
														for v557 = 0 + 0, #v548 do
															local v558 = v548[v557];
															local v559 = v558[(232 - (73 + 156)) - 2];
															local v560 = v558[1 + 0 + (812 - (721 + 90))];
															if ((v559 == v84) and (v560 >= v212)) then
																v213[v560] = v559[v560];
																v558[1] = v213;
															end
														end
													end
													break;
												end
												if (v211 == ((22 + 1876) - ((844 - 584) + (3527 - (1569 + (790 - (224 + 246))))))) then
													v212 = v86[2 - 0];
													v213 = {};
													v211 = 441 - ((703 - 321) + 58);
												end
											end
											break;
										end
									end
								end
							elseif ((2414 <= (540 + 2432)) and (v87 <= ((15 + 45) - (1 + 40)))) then
								if (v87 <= (12 + 3 + 2)) then
									if (((3529 <= (7033 - 3495)) and not v84[v86[(9 - 6) - (514 - (203 + 310))]]) or ((3394 - (1238 + 755)) > (329 + 4367))) then
										v78 = v78 + (2 - (1535 - (709 + 825)));
									else
										v78 = v86[3];
									end
								elseif (v87 > (1223 - ((1661 - 759) + 303))) then
									local v215 = 0;
									local v216;
									local v217;
									while true do
										if (v215 == (1 - 0)) then
											v84[v216 + ((865 - (196 + 668)) - (0 - 0))] = v217;
											v84[v216] = v217[v86[7 - 3]];
											break;
										end
										if (v215 == (833 - (171 + 662))) then
											v216 = v86[95 - (4 + 89)];
											v217 = v84[v86[3]];
											v215 = 1;
										end
									end
								elseif ((v86[6 - 4] == v84[v86[9 - 5]]) or (2861 < (167 + 291))) then
									v78 = v78 + (4 - 3) + 0 + 0;
								else
									v78 = v86[1693 - ((2607 - (35 + 1451)) + (2022 - (28 + 1425)))];
								end
							elseif (((3710 - (941 + 1052)) <= (4339 + 186)) and (v87 <= (234 - ((1536 - (822 + 692)) + (273 - 81))))) then
								local v168 = 0 + 0;
								local v169;
								while true do
									if (v168 == 0) then
										v169 = v86[685 - (483 + (497 - (45 + 252)))];
										do
											return v84[v169](v13(v84, v169 + (1464 - (265 + 2 + 392 + 745 + (143 - 84))), v86[436 - (114 + 319)]));
										end
										break;
									end
								end
							elseif ((v87 > (57 - 36)) or ((4562 - 1384) <= (1952 - 428))) then
								local v218 = 0 + 0;
								local v219;
								local v220;
								local v221;
								local v222;
								local v223;
								while true do
									if (((6337 - 2083) > 370) and (v218 == 6)) then
										do
											return;
										end
										v78 = v78 + (1 - 0);
										v86 = v74[v78];
										v78 = v86[3 - (1963 - (556 + 1407))];
										break;
									end
									if ((v218 == ((1974 - (741 + 465)) - (468 + 297))) or ((2100 - (170 + 295)) == (937 + 840))) then
										v86 = v74[v78];
										v84[v86[2 + 0]] = v86[(1390 - 825) - (277 + 57 + ((493 + 275) - (306 + 234)))];
										v78 = v78 + (1231 - (957 + 273));
										v86 = v74[v78];
										v84[v86[((164 + 447) - (127 + 189 + (1101 - 812))) - 4]] = v86[(15 - 9) - 3];
										v78 = v78 + ((2 - 1) - (0 - 0));
										v218 = (1782 - (389 + 1391)) + ((4 + 1) - (1 + 2));
									end
									if (v218 == (((26 - 14) + (1179 - (783 + 168))) - ((473 - 332) + 95))) then
										local v423 = 0 + 0;
										while true do
											if (v423 == (311 - (309 + 2))) then
												v86 = v74[v78];
												v223 = v86[(5 - 3) + (1212 - (1090 + 122))];
												v423 = 1 + 0;
											end
											if (v423 == (3 - 2)) then
												v220, v221 = v77(v84[v223](v13(v84, v223 + ((2 + 0) - (1119 - (628 + 490))), v86[1 + 2])));
												v79 = (v221 + v223) - ((3599 - 2145) - ((3043 - 2377) + 787));
												v423 = 776 - (431 + 343);
											end
											if (v423 == (3 - 1)) then
												v219 = 0 - 0;
												for v549 = v223, v79 do
													local v550 = 0 + 0;
													while true do
														if (v550 == 0) then
															v219 = v219 + ((1 + 1) - (1696 - (556 + 1139)));
															v84[v549] = v220[v219];
															break;
														end
													end
												end
												v423 = 3;
											end
											if (v423 == (18 - (6 + 9))) then
												v218 = 2 + 1 + 2;
												break;
											end
										end
									end
									if ((v218 == ((2 + 0) - ((595 - (28 + 141)) - (360 + 65)))) or ((1271 + 2009) < (1630 - 309))) then
										v86 = v74[v78];
										v84[v86[2 + 0 + (1317 - (486 + 831))]] = v84[v86[2 + 1]][v86[(12 - 7) - ((3 - 2) + 0)]];
										v78 = v78 + 1 + 0 + 0;
										v86 = v74[v78];
										v223 = v86[165 - ((290 - 198) + 71)];
										v222 = v84[v86[2 + 1]];
										v218 = (1265 - (668 + 595)) - 0;
									end
									if (v218 == ((693 + 77) - (574 + ((90 + 355) - ((215 - 136) + 175))))) then
										local v429 = 290 - (23 + 267);
										while true do
											if (2 == v429) then
												v78 = v78 + 1 + (1944 - (1129 + 815));
												v86 = v74[v78];
												v429 = 390 - (371 + 16);
											end
											if (v429 == (1751 - (1326 + 424))) then
												v223 = v86[(7 - 3) - (7 - 5)];
												v84[v223](v13(v84, v223 + 1, v79));
												v429 = 120 - (88 + 30);
											end
											if (v429 == (774 - (720 + 51))) then
												v218 = 855 - (254 + (1323 - 728));
												break;
											end
											if (v429 == (1776 - (421 + 1355))) then
												v78 = v78 + 1 + (0 - 0);
												v86 = v74[v78];
												v429 = 1 + 0;
											end
										end
									end
									if (v218 == (128 - ((1138 - (286 + 797)) + 71))) then
										local v430 = 0 - 0;
										while true do
											if (v430 == (1 - 0)) then
												v78 = v78 + ((2823 - 1032) - (573 + (1656 - (397 + 42))));
												v86 = v74[v78];
												v430 = 1 + 1;
											end
											if (v430 == (802 - (24 + 776))) then
												v84[v86[2 - 0]] = v84[v86[8 - (790 - (222 + 563))]];
												v78 = v78 + (1 - 0) + 0;
												v430 = 3 + 0;
											end
											if ((190 - (23 + 167)) == v430) then
												v84[v223 + (1799 - (690 + 1108))] = v222;
												v84[v223] = v222[v86[(2 + 3) - 1]];
												v430 = 1 + 0;
											end
											if (v430 == 3) then
												v218 = 851 - (40 + 808);
												break;
											end
										end
									end
									if (v218 == 0) then
										v219 = nil;
										v220, v221 = nil;
										v222 = nil;
										v223 = nil;
										v84[v86[1 + 0 + (3 - 2)]] = v84[v86[(12 - 8) - (1 + 0)]][v86[((961 + 854) - 872) - (392 + 322 + (796 - (47 + 524)))]];
										v78 = v78 + (2 - (1 + 0));
										v218 = ((2460 - 1560) - ((751 - 248) + 396)) - 0;
									end
								end
							else
								local v224;
								v84[v86[(2 - 1) + (182 - ((1818 - (1165 + 561)) + 3 + 86))]] = v84[v86[(9 - 6) - (0 + 0)]];
								v78 = v78 + ((1286 - (341 + 138)) - (32 + 86 + (1419 - 731)));
								v86 = v74[v78];
								v84[v86[50 - (((374 - (89 + 237)) - (73 - 50)) + 23)]] = v86[1 + (3 - 1)];
								v78 = v78 + (1887 - ((1808 - (581 + 300)) + (2179 - (855 + 365))));
								v86 = v74[v78];
								v84[v86[(4 + 2) - 4]] = v86[6 - 3];
								v78 = v78 + (733 - (6 + 10 + (1951 - (1030 + 205))));
								v86 = v74[v78];
								v224 = v86[(3 + 0) - (1 + 0)];
								v84[v224] = v84[v224](v13(v84, v224 + ((384 - (156 + 130)) - ((24 - 13) + (144 - 58))), v86[6 - (5 - 2)]));
								v78 = v78 + ((76 + 210) - (103 + 72 + (179 - (10 + 59))));
								v86 = v74[v78];
								v84[v86[(2 + 2) - ((9 - 7) + (1163 - (671 + 492)))]][v84[v86[14 - (9 + 2)]]] = v84[v86[1800 - ((1718 - (369 + 846)) + 1293)]];
								v78 = v78 + ((1 + 1) - (1 + 0));
								v86 = v74[v78];
								v84[v86[2 + (1945 - (1036 + 909))]] = v84[v86[1064 - (645 + 165 + (982 - 731))]];
								v78 = v78 + (1 - 0) + (203 - (11 + 192));
								v86 = v74[v78];
								v84[v86[1 + 0 + (176 - (135 + 40))]] = v86[(2 - 1) + ((3 + 1) - (4 - 2))];
								v78 = v78 + (1 - 0) + 0 + (176 - (50 + 126)) + (0 - 0);
								v86 = v74[v78];
								v84[v86[1 + 1]] = v86[1416 - (1233 + 180)];
								v78 = v78 + (((2595 - (522 + 447)) - (2513 - (107 + 1314))) - (20 + 23 + (1493 - 1003)));
								v86 = v74[v78];
								v224 = v86[1 + 1];
								v84[v224] = v84[v224](v13(v84, v224 + (1 - 0), v86[(2912 - 2176) - ((2621 - (716 + 1194)) + 1 + 21)]));
								v78 = v78 + (3 - (1 + 1));
								v86 = v74[v78];
								v84[v86[(1364 - (74 + 429)) - ((462 - 222) + 307 + 312)]] = v84[v86[(2 - 1) + 1 + 0 + 1]];
							end
						elseif (v87 <= (53 - ((86 - 58) - (21 - 12)))) then
							if (v87 <= ((435 - (279 + 154)) + 26)) then
								if ((4927 >= (3081 - (454 + 324))) and ((v87 <= ((1392 + 377) - ((1361 - (12 + 5)) + 400))) or (3338 >= (2153 + 1840)))) then
									if (((2940 - 1786) <= (546 + 929)) and (v87 <= ((1521 - (277 + 816)) - (255 + 150)))) then
										v84[v86[2 + (0 - 0)]][v84[v86[(1246 - ((1668 - (1058 + 125)) + 759)) + (2 - 1)]]] = v86[16 - 12];
									elseif ((3462 >= (194 + 838)) and ((v87 > ((1052 - (815 + 160)) - (227 - 174))) or ((6195 - 3585) < (294 + 936)))) then
										v84[v86[(5089 - 3348) - ((2302 - (41 + 1857)) + (3228 - (1222 + 671)))]] = v65[v86[3]];
									else
										local v247 = 0 - 0;
										local v248;
										local v249;
										while true do
											if (v247 == (0 - 0)) then
												v248 = 406 - (183 + ((2594 - (229 + 953)) - (442 + (2521 - (1111 + 663)))));
												v249 = nil;
												v247 = 1580 - (874 + 705);
											end
											if (1 == v247) then
												while true do
													if (v248 == ((1 + 1) - 0)) then
														local v524 = 0;
														while true do
															if (v524 == 0) then
																v78 = v78 + 1;
																v86 = v74[v78];
																v524 = 1 + 0;
															end
															if (v524 == (1 - 0)) then
																v84[v86[1 + 1]][v84[v86[(681 - (642 + 37)) + 1]]] = v84[v86[4]];
																v248 = 1 + 1 + 1 + 0;
																break;
															end
														end
													end
													if (((848 - 510) - ((464 - (233 + 221)) + ((3380 - 1918) - (832 + 303)))) == v248) then
														local v525 = 0 + 0;
														while true do
															if (v525 == (1541 - (718 + 823))) then
																v86 = v74[v78];
																v249 = v86[2 + 0 + (805 - (266 + 539))];
																v525 = 1;
															end
															if (1 == v525) then
																v84[v249] = v84[v249](v13(v84, v249 + ((959 - 620) - (118 + 220)), v86[1228 - (636 + 589)]));
																v248 = (2 - 1) + (1 - 0);
																break;
															end
														end
													end
													if (v248 == ((360 + 94) - (40 + 68 + (1356 - (657 + 358))))) then
														v84[v86[(2 - 1) + (2 - 1)]] = v66[v86[(1199 - (1151 + 36)) - (9 + 0)]];
														break;
													end
													if ((((394 + 1102) - ((2123 - 1412) + (1728 - ((1920 - (1552 + 280)) + (1692 - (64 + 770)))))) == v248) or ((732 + 345) >= 2011)) then
														v78 = v78 + ((2 - 1) - (0 + 0));
														v86 = v74[v78];
														v249 = v86[((1387 - (157 + 1086)) + 327) - ((540 - 270) + 199)];
														v248 = (8 - 6) + (2 - 0);
													end
													if ((v248 == (1819 - ((656 - 175) + (918 - (599 + 220)) + 1239))) or ((2883 - 1435) == 3083)) then
														v249 = nil;
														v84[v86[(1936 - (1813 + 118)) - (3 + 0)]] = v86[(1220 - (841 + 376)) + (0 - 0)];
														v78 = v78 + 1 + 0 + 0;
														v248 = 1 + 0 + 0;
													end
													if (((8567 - 5428) > (1775 - (464 + 395))) and (v248 == (10 - 6))) then
														v84[v249] = v84[v249](v84[v249 + ((1 + 1) - (838 - (467 + 370)))]);
														v78 = v78 + (1 - 0) + 0 + 0;
														v86 = v74[v78];
														v248 = (4017 - 2845) - (101 + 544 + (1214 - 692));
													end
												end
												break;
											end
										end
									end
								elseif (v87 <= ((2336 - (150 + 370)) - ((2292 - (74 + 1208)) + 780))) then
									local v172 = 0;
									local v173;
									local v174;
									while true do
										if (v172 == 0) then
											v173 = (0 - 0) + 0;
											v174 = nil;
											v172 = 4 - 3;
										end
										if (v172 == (1 + 0)) then
											while true do
												if (v173 == (390 - (14 + 376))) then
													v174 = v86[(14 - 5) - (5 + 2)];
													v84[v174] = v84[v174](v13(v84, v174 + 1 + 0, v86[8 - (5 + 0)]));
													break;
												end
											end
											break;
										end
									end
								elseif (v87 > ((5458 - 3595) - (1045 + ((1189 + 391) - ((844 - (23 + 55)) + 23))))) then
									v84[v86[((44 - 25) - 15) - (2 + 0)]] = v84[v86[(4 + 0) - (1 - 0)]][v86[509 - (111 + 240 + (1055 - (652 + 249)))]];
								else
									local v252 = v86[(4217 - 2641) - ((3149 - (708 + 1160)) + (399 - 106))];
									local v253, v254 = v77(v84[v252](v13(v84, v252 + (2 - 1), v86[269 - ((50 - 22) + (265 - (10 + 17)))])));
									v79 = (v254 + v252) - ((4 - 2) - (1 + 0));
									local v255 = 1559 - ((3113 - (1400 + 332)) + (604 - (816 - 390)));
									for v300 = v252, v79 do
										v255 = v255 + (1909 - (242 + 1666)) + 0 + 0;
										v84[v300] = v253[v255];
									end
								end
							elseif (((566 + 977) < (2059 + 356)) and (v87 <= (25 + (946 - (850 + 90))))) then
								if ((v87 <= (50 - 21)) or ((5834 - (360 + 1030)) < (1784 + 231))) then
									local v175 = (0 - 0) + 0;
									local v176;
									while true do
										if (v175 == (24 - ((1499 - 409) - ((2697 - (909 + 752)) + 37)))) then
											v78 = v78 + (1224 - (109 + 1114)) + (0 - 0);
											v86 = v74[v78];
											v84[v86[(184 + 288) - (381 + (331 - (6 + 236)))]] = v84[v86[2 + 1]];
											break;
										end
										if ((v175 == 0) or ((3381 + 819) == 2332)) then
											local v306 = 0 - 0;
											while true do
												if (v306 == (1 - 0)) then
													v78 = v78 + 1 + (1133 - (1076 + 57));
													v86 = v74[v78];
													v306 = 2;
												end
												if (v306 == 2) then
													v175 = 1;
													break;
												end
												if (v306 == (0 + 0)) then
													v176 = nil;
													v84[v86[(691 - (579 + 110)) + 0 + 0 + 0]] = v84[v86[3]];
													v306 = 1 + 0;
												end
											end
										end
										if ((v175 == ((1 + 0) - 0)) or (1278 >= (1723 - (174 + 233)))) then
											local v307 = 0;
											while true do
												if (v307 == (2 - 1)) then
													v86 = v74[v78];
													v84[v86[(2556 - 1099) - (441 + 549 + (1639 - (663 + 511)))]] = v86[2 + 0 + 1 + 0];
													v307 = 2;
												end
												if (2 == v307) then
													v175 = (2 - 1) + 1 + 0;
													break;
												end
												if (v307 == 0) then
													v84[v86[((5306 - 3052) - (2652 - 1556)) - (404 + 441 + (445 - 216) + 59 + 23)]] = v86[(1 + 5) - (725 - (478 + 244))];
													v78 = v78 + ((2302 - (440 + 77)) - (98 + 116 + 1570));
													v307 = 3 - 2;
												end
											end
										end
										if (((1561 - (655 + 901)) + 0 + 0) == v175) then
											local v308 = 0;
											while true do
												if (v308 == (2 + 0)) then
													v175 = (8 + 3) - 5;
													break;
												end
												if (v308 == 0) then
													v84[v86[(28 - 21) - 5]] = v86[1729 - ((3113 - (695 + 750)) + (197 - 139))];
													v78 = v78 + (1 - 0);
													v308 = 1;
												end
												if (v308 == (3 - 2)) then
													v86 = v74[v78];
													v84[v86[628 - (((2343 - (285 + 66)) - ((1493 - 852) + (2149 - (682 + 628)))) + 114)]] = v86[(2 + 5) - (303 - (176 + 123))];
													v308 = 1 + 1;
												end
											end
										end
										if (((666 + 251) - ((1179 - (239 + 30)) + 1 + 2)) == v175) then
											local v309 = 0 + 0;
											while true do
												if (v309 == (1 - 0)) then
													v78 = v78 + (2 - 1) + (0 - (315 - (306 + 9)));
													v86 = v74[v78];
													v309 = 6 - 4;
												end
												if (v309 == (0 + 0)) then
													v86 = v74[v78];
													v84[v86[(4 + 2) - (2 + 2)]] = v84[v86[(5 - 3) + (1376 - (1140 + 235))]];
													v309 = 1 + 0;
												end
												if (v309 == (2 + 0)) then
													v175 = 2 + 3;
													break;
												end
											end
										end
										if (((55 - (33 + 19)) + 0) == v175) then
											v78 = v78 + ((2 + 1) - (5 - 3));
											v86 = v74[v78];
											v84[v86[2]][v84[v86[1997 - (49 + 60 + (3696 - 1811))]]] = v86[4 + 0];
											v78 = v78 + (((3843 - (586 + 103)) - (134 + 1332 + 218)) - ((1797 - 1213) + 685 + 200));
											v175 = 7 - (1491 - (1309 + 179));
										end
										if (((1474 - 657) - (98 + 717)) == v175) then
											v78 = v78 + (827 - (802 + 24));
											v86 = v74[v78];
											v176 = v86[2 - (0 + 0)];
											v84[v176] = v84[v176](v13(v84, v176 + ((2 - 1) - 0), v86[1 + 2 + 0]));
											v175 = 5 - 2;
										end
										if (((5885 - 2931) == 2954) and (v175 == (615 - (295 + 314)))) then
											local v316 = 0 - 0;
											while true do
												if (v316 == (1964 - (1300 + 662))) then
													v175 = ((28 - 19) + (1769 - (1178 + 577))) - ((428 + 396) - ((972 - 643) + 479));
													break;
												end
												if (v316 == (1406 - (851 + 554))) then
													v176 = v86[1 + 1];
													v84[v176] = v84[v176](v13(v84, v176 + 1 + 0 + ((3183 - 2035) - (556 + (1285 - 693))), v86[(310 - (115 + 187)) - (4 + 1)]));
													v316 = 2 + 0;
												end
												if (v316 == 0) then
													v78 = v78 + (3 - 2) + 0;
													v86 = v74[v78];
													v316 = 1162 - (160 + 1001);
												end
											end
										end
									end
								elseif (v87 == (11 + 19)) then
									v84[v86[1 + 0 + 1]] = v66[v86[3 + 0]];
								else
									local v258 = 0 - 0;
									local v259;
									while true do
										if (v258 == (358 - (237 + 121))) then
											v259 = nil;
											v84[v86[2 + (897 - (525 + 372))]] = v84[v86[(4 - 1) + ((2805 - 1951) - ((316 - (96 + 46)) + (1457 - (643 + 134))))]];
											v78 = v78 + 1 + 0 + 0;
											v86 = v74[v78];
											v258 = 2 - 1;
										end
										if (v258 == (7 - 5)) then
											v78 = v78 + 1 + 0 + 0 + (0 - 0);
											v86 = v74[v78];
											v259 = v86[(1 - 0) + (720 - (316 + 403))];
											v84[v259] = v84[v259](v13(v84, v259 + (327 - (128 + 64 + (368 - 234))), v86[(463 + 816) - ((795 - 479) + 681 + 279)]));
											v258 = 1 + 2;
										end
										if (v258 == (10 - 7)) then
											v78 = v78 + 1 + (0 - 0);
											v86 = v74[v78];
											v84[v86[(3 - 1) + 0 + 0]] = v84[v86[(5 - 2) + 0 + 0]][v84[v86[(44 - 29) - (28 - (12 + 5))]]];
											v78 = v78 + (552 - (83 + 468));
											v258 = 15 - 11;
										end
										if ((8 - 4) == v258) then
											v86 = v74[v78];
											if (((248 - 131) <= 2892) and v84[v86[((6315 - 3768) - (396 + 70 + 273)) - ((3175 - (1656 + 317)) + 49 + 5 + 441 + 109)]]) then
												v78 = v78 + (4 - 3);
											else
												v78 = v86[4 - 1];
											end
											break;
										end
										if (v258 == (2 - 1)) then
											v84[v86[(7062 - 5627) - (797 + (990 - (5 + 349)))]] = v86[14 - (52 - 41)];
											v78 = v78 + ((5566 - 3946) - ((2698 - (266 + 1005)) + 192));
											v86 = v74[v78];
											v84[v86[1 + 1]] = v86[(11 - (4 + 1)) - 3];
											v258 = 2;
										end
									end
								end
							elseif (((3691 - 2609) == 1082) and ((v87 <= (41 - 9)) or ((2149 - (561 + 1135)) > (6074 - 1412)))) then
								local v177 = v86[(16 - 11) - (1069 - (507 + 559))];
								local v178, v179 = v77(v84[v177](v84[v177 + (2 - 1)]));
								v79 = (v179 + v177) - ((1803 - ((89 - 60) + (1836 - (212 + 176)))) - (45 + (1185 - (250 + 655))));
								local v180 = ((3787 - 2398) - (135 + (2190 - 936))) + (0 - 0);
								for v185 = v177, v79 do
									v180 = v180 + (1957 - (1869 + 87)) + (0 - 0);
									v84[v185] = v178[v180];
								end
							elseif (((3221 - (484 + 1417)) > (1275 - 680)) and (v87 == ((48 - (58 - 23)) + (793 - (48 + 725))))) then
								local v260 = (0 - 0) + (0 - 0);
								while true do
									if (v260 == (1 + 0 + 3)) then
										v84[v86[(7 - 4) - (1 + 0)]] = v66[v86[1 + 2]];
										v78 = v78 + ((2765 - (152 + 701)) - ((1651 - (430 + 881)) + 1571));
										v86 = v74[v78];
										v260 = (9 - (3 + 4)) + (898 - (557 + 338));
									end
									if (((393 + 935) <= (13746 - 8868)) and (v260 == (1775 - (1733 + (136 - 97))))) then
										v84[v86[5 - (7 - 4)]] = v84[v86[3]][v86[8 - 4]];
										v78 = v78 + (1035 - (125 + (1710 - (499 + 302))));
										v86 = v74[v78];
										v260 = (2818 - (39 + 827)) - (1096 + (2351 - 1499));
									end
									if ((2 - 1) == v260) then
										local v454 = 0 - 0;
										while true do
											if ((1 - 0) == v454) then
												v86 = v74[v78];
												v260 = (21 + 217) - ((134 - 88) + 21 + 106 + (99 - 36));
												break;
											end
											if (v454 == 0) then
												v84[v86[(105 - (103 + 1)) + 1]] = v84[v86[(557 - (475 + 79)) - 0]][v86[(8 - 4) + (0 - 0)]];
												v78 = v78 + ((67 + 446) - (409 + 91 + 12));
												v454 = 1504 - (1395 + 108);
											end
										end
									end
									if (((11892 - 7805) >= (2559 - (7 + 1197))) and (v260 == ((44 + 56) - (18 + 33 + (363 - (27 + 292)))))) then
										v84[v86[(1528 - (389 + (3334 - 2196))) + (1 - 0)]] = v84[v86[1320 - ((1688 - (102 + (1979 - 1507))) + (399 - 196))]][v86[730 - (228 + (947 - 449))]];
										v78 = v78 + (140 - (43 + 96));
										v86 = v74[v78];
										v260 = 24 - 18;
									end
									if (v260 == ((0 - 0) + 0 + 0 + 0)) then
										v84[v86[1 + 1]] = v66[v86[(3 - 1) + 1]];
										v78 = v78 + ((255 + 409) - ((325 - 151) + 154 + 335));
										v86 = v74[v78];
										v260 = (1 + 1) - 1;
									end
									if ((v260 == (((2809 - (1414 + 337)) + 849) - ((2770 - (1642 + 298)) + 1075))) or ((8338 - 5139) < (1697 - 1107))) then
										local v461 = 0;
										while true do
											if (v461 == 0) then
												v84[v86[(1560 - 1034) - (303 + 73 + 148)]] = v66[v86[(990 + 282) - ((1203 - (357 + 615)) + 1038)]];
												v78 = v78 + 1 + 0 + 0;
												v461 = 2 - 1;
											end
											if (v461 == (1 + 0)) then
												v86 = v74[v78];
												v260 = 1165 - ((366 - 195) + 793 + 198);
												break;
											end
										end
									end
									if (v260 == 6) then
										local v462 = 0 + 0;
										while true do
											if (v462 == (0 + 0)) then
												v84[v86[8 - (1307 - (384 + 917))]] = v66[v86[(704 - (128 + 569)) - (1547 - (1407 + 136))]];
												v78 = v78 + (2 - (1888 - (687 + 1200)));
												v462 = 1711 - (556 + 1154);
											end
											if (v462 == (3 - 2)) then
												v86 = v74[v78];
												v260 = (101 - (9 + 86)) + (422 - (275 + 146));
												break;
											end
										end
									end
									if (v260 == ((4 + 20) - (81 - (29 + 35)))) then
										if (not v84[v86[(22 - 17) - ((8 - 5) + (0 - 0))]] or (590 > (3029 + 1621))) then
											v78 = v78 + 1;
										else
											v78 = v86[(1016 - (53 + 959)) - (409 - (312 + 96))];
										end
										break;
									end
								end
							else
								local v261 = v86[6 - 4];
								v84[v261] = v84[v261](v84[v261 + ((2167 - 918) - ((396 - (147 + 138)) + (2036 - (813 + 86))))]);
							end
						elseif (v87 <= ((179 + 19) - ((168 - 77) + (559 - (18 + 474))))) then
							if (v87 <= ((38 + 72) - (238 - 165))) then
								if ((v87 <= ((1095 - (860 + 226)) + 26)) or ((4077 - (121 + 182)) <= (452 + 3215))) then
									v84[v86[525 - (423 + 100)]] = v84[v86[(1241 - (988 + 252)) + 1 + 1]][v84[v86[2 + 2]]];
								elseif ((v87 > ((2069 - (49 + 1921)) - 63)) or ((5683 - (223 + 667)) < (82 - (51 + 1)))) then
									local v263 = v86[(2 - 0) + ((3308 - 1763) - (320 + (2350 - (146 + 979))))];
									do
										return v13(v84, v263, v79);
									end
								else
									v84[v86[(219 + 554) - ((931 - (311 + 294)) + 445)]] = v84[v86[3]] % v84[v86[(47 - 30) - (6 + 7)]];
								end
							elseif (v87 <= 38) then
								if (((2713 - (496 + 947)) < 2146) and (v84[v86[(1362 - (1233 + 125)) - (1 + 1)]] == v86[9 - (5 + 0)])) then
									v78 = v78 + 1 + 0;
								else
									v78 = v86[(2359 - (963 + 682)) - (530 + (321 - 140))];
								end
							elseif (v87 == ((768 + 152) - ((2118 - (504 + 1000)) + 180 + 87))) then
								local v266 = v75[v86[(32 + 3) - (19 + 2 + 11)]];
								local v267;
								local v268 = {};
								v267 = v10({}, {__index=function(v317, v318)
									local v319 = v268[v318];
									return v319[1 - (0 - 0)][v319[(4 + 0) - (2 + 0)]];
								end,__newindex=function(v320, v321, v322)
									local v323 = 182 - (156 + 26);
									local v324;
									while true do
										if (v323 == 0) then
											v324 = v268[v321];
											v324[(2 + 0) - (1 - 0)][v324[(165 - (149 + 15)) + (961 - (890 + 70))]] = v322;
											break;
										end
									end
								end});
								for v325 = 1, v86[(123 - (39 + 78)) - (484 - (14 + 468))] do
									local v326 = 0 - 0;
									local v327;
									local v328;
									while true do
										if (v326 == (2 - 1)) then
											while true do
												if ((4563 >= 56) and (v327 == 1)) then
													if ((v328[1813 - (668 + 625 + 312 + 207)] == 4) or (1696 <= (225 + 834))) then
														v268[v325 - (1 - (0 + 0))] = {v84,v328[5 - 2]};
													else
														v268[v325 - ((1 + 0) - (0 - 0))] = {v65,v328[(57 - (12 + 39)) - 3]};
													end
													v83[#v83 + (1860 - (821 + 966 + 72)) + (0 - 0)] = v268;
													break;
												end
												if (v327 == ((0 - 0) + 0 + 0)) then
													local v552 = 0 + 0;
													while true do
														if (v552 == 1) then
															v327 = 2 - 1;
															break;
														end
														if (v552 == (0 + 0)) then
															v78 = v78 + ((9 - 7) - (1711 - (1596 + 114)));
															v328 = v74[v78];
															v552 = 1;
														end
													end
												end
											end
											break;
										end
										if (0 == v326) then
											v327 = (1464 - ((409 - 252) + 1307)) - (713 - (164 + 549));
											v328 = nil;
											v326 = 1;
										end
									end
								end
								v84[v86[1 + (1439 - (1059 + 379))]] = v29(v266, v267, v66);
							else
								local v270 = v86[(1 - 0) + 1];
								local v271 = v84[v270];
								local v272 = v84[v270 + 2 + 0];
								if ((((395 + 1948) == (2735 - (145 + 247))) and (v272 > (0 + 0 + 0))) or (446 == (288 + 334))) then
									if (v271 > v84[v270 + (2 - 1)]) then
										v78 = v86[(211 + 888) - (709 + 387)];
									else
										v84[v270 + ((1604 + 257) - (673 + (1923 - 738)))] = v271;
									end
								elseif (v271 < v84[v270 + ((722 - (254 + 466)) - (561 - (544 + 16)))]) then
									v78 = v86[9 - 6];
								else
									v84[v270 + (631 - (294 + 334))] = v271;
								end
							end
						elseif (v87 <= (137 - (347 - (236 + 17)))) then
							if ((2069 > 1009) and ((v87 <= ((29 + 38) - (64 - (30 + 8)))) or (1043 > (13524 - 9933)))) then
								local v183 = 0 - 0;
								local v184;
								while true do
									if (v183 == (0 + 0)) then
										v184 = v86[2 + 0 + (794 - (413 + 381))];
										v84[v184] = v84[v184](v13(v84, v184 + 1, v79));
										break;
									end
								end
							elseif ((v87 > (2 + 40)) or (2890 >= (8674 - 4595))) then
								v84[v86[4 - 2]] = v86[3 + (1970 - (582 + 1388))] + v84[v86[5 - (1 - 0)]];
							else
								v84[v86[1 + 0 + (365 - (326 + 38))]] = v84[v86[(14 - 9) - (2 - 0)]] + v86[(627 - (47 + 573)) - (2 + 1)];
							end
						elseif (v87 <= (1924 - ((1894 - 1448) + (2326 - 892)))) then
							if ((4474 <= (6434 - (1269 + 395))) and v84[v86[(1777 - (76 + 416)) - ((1483 - (319 + 124)) + 243)]]) then
								v78 = v78 + (2 - 1);
							else
								v78 = v86[(1015 - (564 + 443)) - (13 - 8)];
							end
						elseif (v87 == (1892 - ((520 - (337 + 121)) + (1456 - 959) + (4290 - 3002)))) then
							v84[v86[((5343 - (1261 + 650)) - 1499) - (609 + 560 + 762)]] = #v84[v86[3]];
						else
							v84[v86[(726 - 270) - ((1830 - (772 + 1045)) + 63 + 378)]] = v84[v86[(154 - (102 + 42)) - 7]] % v86[(4 + 6) - (1850 - (1524 + 320))];
						end
						v78 = v78 + (4 - (1273 - (1049 + 221)));
						break;
					end
					if (v112 == ((156 - (18 + 138)) + (0 - 0))) then
						local v125 = 1102 - (67 + 1035);
						while true do
							if (v125 == (348 - (136 + 212))) then
								v86 = v74[v78];
								v87 = v86[(12 - 9) - 2];
								v125 = 1 + 0;
							end
							if (v125 == (1 + 0)) then
								v112 = 1605 - (240 + 1364);
								break;
							end
						end
					end
				end
			end
		end;
	end
	return v29(v28(), {}, v17)(...);
end
return v15("LOL!263Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E736572742Q033Q0073796E03073Q0072657175657374030C3Q00682Q74705F7265717565737403023Q005F47030A3Q00EEE2C90BD991D411DF9203083Q007EB1A3BB4586DBA7030A3Q001CEC38EBC309DE25CBAE03053Q009C43AD4AA5028Q00026Q00F03F03043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203043Q004B69636B031C3Q0015B95D1FF1124739A74C04E6666A3BB64D13AE664B3DA45A1FB2210803073Q002654D72976DC46030B3Q006F37303CC163022315FB0203053Q009E307642722Q01035C3Q00A330042660FFB4E43611213DA2F2BF2C053466B6FEB9271F3867A0F5BF6A13397EEACDAE3C1F3A3EA3F2A721037972B7F8A36B023375B6B4A321113260EAF6AA2D1E7960B1FABF2D130970AAF5BF211E223CB6EFAA2315653DA9EEAA03073Q009BCB44705613C52Q033Q0073CF3A03083Q009826BD569C20188503063Q00D152B34EF35303043Q00269C37C72Q033Q008F584803083Q0023C81D1C4873149A03053Q007063612Q6C00933Q0012213Q00013Q00206Q000200122Q000100013Q00202Q00010001000300122Q000200013Q00202Q00020002000400122Q000300053Q00062Q0003000A000100010004063Q000A000100121E000300063Q00201C00040003000700121E000500083Q00201C00050005000900121E000600083Q00201C00060006000A00062700073Q000100062Q00043Q00054Q00043Q00064Q00048Q00043Q00044Q00043Q00014Q00043Q00023Q00121E0008000B3Q00062C0008001D00013Q0004063Q001D000100121E0008000B3Q00201C00080008000C00061100080021000100010004063Q0021000100121E0008000D3Q00061100080021000100010004063Q0021000100121E0008000C3Q00121E0009000E4Q001F000A00073Q00122Q000B000F3Q00122Q000C00106Q000A000C00024Q00090009000A00062Q0009003100013Q0004063Q0031000100121E0009000E4Q0002000A00073Q00122Q000B00113Q00122Q000C00126Q000A000C00024Q00090009000A00062Q00090072000100010004063Q0072000100120A000900134Q0010000A000C3Q002Q260009006C000100140004063Q006C00012Q0010000C000C3Q002Q26000A005D000100140004063Q005D0001002Q26000B0038000100130004063Q0038000100120A000C00133Q002Q26000C003B000100130004063Q003B000100120A000D00133Q002Q26000D003E000100130004063Q003E000100120A000E00134Q0010000F000F3Q002Q26000E0042000100130004063Q0042000100120A000F00133Q002Q26000F0045000100130004063Q0045000100120A001000133Q002Q2600100048000100130004063Q0048000100121E001100153Q00201600110011001600202Q00110011001700202Q0011001100184Q001300073Q00122Q001400193Q00122Q0015001A6Q001300156Q00113Q00016Q00013Q00044Q004800010004063Q004500010004063Q003E00010004063Q004200010004063Q003E00010004063Q003B00010004063Q007200010004063Q003800010004063Q00720001002Q26000A0036000100130004063Q0036000100120A000D00133Q002Q26000D0064000100140004063Q0064000100120A000A00143Q0004063Q00360001002Q26000D0060000100130004063Q0060000100120A000B00134Q0010000C000C3Q00120A000D00143Q0004063Q006000010004063Q003600010004063Q00720001002Q2600090033000100130004063Q0033000100120A000A00134Q0010000B000B3Q00120A000900143Q0004063Q0033000100121E0009000E4Q001D000A00073Q00122Q000B001B3Q00122Q000C001C6Q000A000C000200202Q0009000A001D4Q000900073Q00122Q000A001E3Q00122Q000B001F6Q0009000B00024Q000A00084Q0007000B3Q00022Q0015000C00073Q00122Q000D00203Q00122Q000E00216Q000C000E00024Q000B000C00094Q000C00073Q00122Q000D00223Q00122Q000E00236Q000C000E00024Q000D00073Q00120A000E00243Q001218000F00256Q000D000F00024Q000B000C000D4Q000A0002000200122Q000B00263Q000627000C0001000100012Q00043Q000A6Q000B000200012Q000F8Q00013Q00013Q00023Q00033Q00028Q00026Q00F03F026Q00704002633Q00120A000200014Q0010000300053Q002Q260002005C000100020004063Q005C00012Q0010000500053Q002Q260003004D000100020004063Q004D000100120A000600014Q0010000700073Q002Q2600060009000100010004063Q0009000100120A000700013Q002Q260007000C000100010004063Q000C0001002Q2600040014000100020004063Q001400012Q001900086Q0004000900054Q0014000800094Q002500085Q002Q2600040007000100010004063Q0007000100120A000800014Q0010000900093Q000E1200010018000100080004063Q0018000100120A000900013Q002Q260009001F000100020004063Q001F000100120A000400023Q0004063Q00070001002Q260009001B000100010004063Q001B00012Q0007000A6Q00030005000A3Q00122Q000A00026Q000B5Q00122Q000C00023Q00042Q000A004300012Q0019000E00014Q000C000F00056Q001000026Q001100036Q001200046Q001300056Q00148Q0015000D3Q00202Q0016000D00024Q001300166Q00123Q00024Q001300046Q001400056Q001500016Q001600016Q0016000D001600102Q0016000200164Q001700016Q0017000D001700102Q00170002001700202Q0017001700024Q001400176Q00138Q00113Q000200202Q0011001100034Q001000116Q000E3Q000100040B000A0027000100120A000900023Q0004063Q001B00010004063Q000700010004063Q001800010004063Q000700010004063Q000C00010004063Q000700010004063Q000900010004063Q000700010004063Q00620001002Q2600030005000100010004063Q0005000100120A000600013Q002Q2600060055000100010004063Q0055000100120A000400014Q0010000500053Q00120A000600023Q002Q2600060050000100020004063Q0050000100120A000300023Q0004063Q000500010004063Q005000010004063Q000500010004063Q00620001002Q2600020002000100010004063Q0002000100120A000300014Q0010000400043Q00120A000200023Q0004063Q000200012Q00013Q00017Q00023Q00030A3Q006C6F6164737472696E6703043Q00426F647900063Q00120D3Q00016Q00015Q00202Q0001000100026Q000200026Q000100016Q00017Q00", v9(), ...);
