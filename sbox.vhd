-- Libraries definitions for LUT rLPS
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity sbox is
	port(
		--reset				: in 	std_logic;
		--clock				: in 	std_logic;
		state_index			: in 	std_logic_vector(7 downto 0);
		rlps_0				: out 	std_logic_vector(7 downto 0)
			
		);
end entity;
			
architecture behaviour of sbox is

type lut_rlps is array (integer range 0 to 255) of std_logic_vector(7 downto 0); --definition of the type for the four LUTS to be used.
signal lut_rlps_0		: lut_rlps; -- Lut for Range[7:6] = 00

begin


--process (clock)
--begin
--	if clock = '1' and clock'event then
--		if reset = '0' then
		
			-- LUT 0
			
lut_rlps_0 (0) <=		 x"63";
lut_rlps_0 (1) <=		 x"7c";
lut_rlps_0 (2) <=		 x"77";
lut_rlps_0 (3) <=		 x"7b";
lut_rlps_0 (4) <=		 x"f2";
lut_rlps_0 (5) <=		 x"6b";
lut_rlps_0 (6) <=		 x"6f";
lut_rlps_0 (7) <=		 x"c5";
lut_rlps_0 (8) <=		 x"30";
lut_rlps_0 (9) <=		 x"01";
lut_rlps_0 (10) <=	 x"67";
lut_rlps_0 (11) <=		 x"2b";
lut_rlps_0 (12) <=		 x"fe";
lut_rlps_0 (13) <=		 x"d7";
lut_rlps_0 (14) <=		 x"ab";
lut_rlps_0 (15) <=		 x"76";
lut_rlps_0 (16) <=		 x"ca";
lut_rlps_0 (17) <=		 x"82";
lut_rlps_0 (18) <=		 x"c9";
lut_rlps_0 (19) <=		 x"7d";
lut_rlps_0 (20) <=		 x"fa";
lut_rlps_0 (21) <=		 x"59";
lut_rlps_0 (22) <=		 x"47";
lut_rlps_0 (23) <=		 x"f0";
lut_rlps_0 (24) <=		 x"ad";
lut_rlps_0 (25) <=		 x"d4";
lut_rlps_0 (26) <=		 x"a2";
lut_rlps_0 (27) <=		 x"af";
lut_rlps_0 (28) <=		 x"9c";
lut_rlps_0 (29) <=		 x"a4";
lut_rlps_0 (30) <=		 x"72";
lut_rlps_0 (31) <=		 x"c0";
lut_rlps_0 (32) <=		 x"b7";
lut_rlps_0 (33) <=		 x"fd";
lut_rlps_0 (34) <=		 x"93";
lut_rlps_0 (35) <=		 x"26";
lut_rlps_0 (36) <=		 x"36";
lut_rlps_0 (37) <=		 x"3f";
lut_rlps_0 (38) <=		 x"f7";
lut_rlps_0 (39) <=		 x"cc";
lut_rlps_0 (40) <=		 x"34";
lut_rlps_0 (41) <=		 x"a5";
lut_rlps_0 (42) <=		 x"e5";
lut_rlps_0 (43) <=		 x"f1";
lut_rlps_0 (44) <=		 x"71";
lut_rlps_0 (45) <=		 x"d8";
lut_rlps_0 (46) <=		 x"31";
lut_rlps_0 (47) <=		 x"15";
lut_rlps_0 (48) <=		 x"04";
lut_rlps_0 (49) <=		 x"c7";
lut_rlps_0 (50) <=		 x"23";
lut_rlps_0 (51) <=		 x"c3";
lut_rlps_0 (52) <=		 x"18";
lut_rlps_0 (53) <=		 x"96";
lut_rlps_0 (54) <=		 x"05";
lut_rlps_0 (55) <=		 x"9a";
lut_rlps_0 (56) <=		 x"07";
lut_rlps_0 (57) <=		 x"12";
lut_rlps_0 (58) <=		 x"80";
lut_rlps_0 (59) <=		 x"e2";
lut_rlps_0 (60) <=		 x"eb";
lut_rlps_0 (61) <=		 x"27";
lut_rlps_0 (62) <=		 x"b2";
lut_rlps_0 (63) <=		 x"75";
lut_rlps_0 (64) <=		 x"09";
lut_rlps_0 (65) <=		 x"83";
lut_rlps_0 (66) <=		 x"2c";
lut_rlps_0 (67) <=		 x"1a";
lut_rlps_0 (68) <=		 x"1b";
lut_rlps_0 (69) <=		 x"6e";
lut_rlps_0 (70) <=		 x"5a";
lut_rlps_0 (71) <=		 x"a0";
lut_rlps_0 (72) <=		 x"52";
lut_rlps_0 (73) <=		 x"3b";
lut_rlps_0 (74) <=		 x"d6";
lut_rlps_0 (75) <=		 x"b3";
lut_rlps_0 (76) <=		 x"29";
lut_rlps_0 (77) <=		 x"e3";
lut_rlps_0 (78) <=		 x"2f";
lut_rlps_0 (79) <=		 x"84";
lut_rlps_0 (80) <=		 x"53";
lut_rlps_0 (81) <=		 x"d1";
lut_rlps_0 (82) <=		 x"00";
lut_rlps_0 (83) <=		 x"ed";
lut_rlps_0 (84) <=		 x"20";
lut_rlps_0 (85) <=		 x"fc";
lut_rlps_0 (86) <=		 x"b1";
lut_rlps_0 (87) <=		 x"5b";
lut_rlps_0 (88) <=		 x"6a";
lut_rlps_0 (89) <=		 x"cb";
lut_rlps_0 (90) <=		 x"be";
lut_rlps_0 (91) <=		 x"39";
lut_rlps_0 (92) <=		 x"4a";
lut_rlps_0 (93) <=		 x"4c";
lut_rlps_0 (94) <=		 x"58";
lut_rlps_0 (95) <=		 x"cf";
lut_rlps_0 (96) <=		 x"d0";
lut_rlps_0 (97) <=		 x"ef";
lut_rlps_0 (98) <=		 x"aa";
lut_rlps_0 (99) <=		 x"fb";
lut_rlps_0 (100) <=		 x"43";
lut_rlps_0 (101) <=		 x"4d";
lut_rlps_0 (102) <=		 x"33";
lut_rlps_0 (103) <=		 x"85";
lut_rlps_0 (104) <=		 x"45";
lut_rlps_0 (105) <=		 x"f9";
lut_rlps_0 (106) <=		 x"02";
lut_rlps_0 (107) <=		 x"7f";
lut_rlps_0 (108) <=		 x"50";
lut_rlps_0 (109) <=		 x"3c";
lut_rlps_0 (110) <=		 x"9f";
lut_rlps_0 (111) <=		 x"a8";
lut_rlps_0 (112) <=		 x"51";
lut_rlps_0 (113) <=		 x"a3";
lut_rlps_0 (114) <=		 x"40";
lut_rlps_0 (115) <=		 x"8f";
lut_rlps_0 (116) <=		 x"92";
lut_rlps_0 (117) <=		 x"9d";
lut_rlps_0 (118) <=		 x"38";
lut_rlps_0 (119) <=		 x"f5";
lut_rlps_0 (120) <=		 x"bc";
lut_rlps_0 (121) <=		 x"b6";
lut_rlps_0 (122) <=		 x"da";
lut_rlps_0 (123) <=		 x"21";
lut_rlps_0 (124) <=		 x"10";
lut_rlps_0 (125) <=		 x"ff";
lut_rlps_0 (126) <=		 x"f3";
lut_rlps_0 (127) <=		 x"d2";
lut_rlps_0 (128) <=		 x"cd";
lut_rlps_0 (129) <=		 x"0c";
lut_rlps_0 (130) <=		 x"13";
lut_rlps_0 (131) <=		 x"ec";
lut_rlps_0 (132) <=		 x"5f";
lut_rlps_0 (133) <=		 x"97";
lut_rlps_0 (134) <=		 x"44";
lut_rlps_0 (135) <=		 x"17";
lut_rlps_0 (136) <=		 x"c4";
lut_rlps_0 (137) <=		 x"a7";
lut_rlps_0 (138) <=		 x"7e";
lut_rlps_0 (139) <=		 x"3d";
lut_rlps_0 (140) <=		 x"64";
lut_rlps_0 (141) <=		 x"5d";
lut_rlps_0 (142) <=		 x"19";
lut_rlps_0 (143) <=		 x"73";
lut_rlps_0 (144) <=		 x"60";
lut_rlps_0 (145) <=		 x"81";
lut_rlps_0 (146) <=		 x"4f";
lut_rlps_0 (147) <=		 x"dc";
lut_rlps_0 (148) <=		 x"22";
lut_rlps_0 (149) <=		 x"2a";
lut_rlps_0 (150) <=		 x"90";
lut_rlps_0 (151) <=		 x"88";
lut_rlps_0 (152) <=		 x"46";
lut_rlps_0 (153) <=		 x"ee";
lut_rlps_0 (154) <=		 x"b8";
lut_rlps_0 (155) <=		 x"14";
lut_rlps_0 (156) <=		 x"de";
lut_rlps_0 (157) <=		 x"5e";
lut_rlps_0 (158) <=		 x"0b";
lut_rlps_0 (159) <=		 x"db";
lut_rlps_0 (160) <=		 x"e0";
lut_rlps_0 (161) <=		 x"32";
lut_rlps_0 (162) <=		 x"3a";
lut_rlps_0 (163) <=		 x"0a";
lut_rlps_0 (164) <=		 x"49";
lut_rlps_0 (165) <=		 x"06";
lut_rlps_0 (166) <=		 x"24";
lut_rlps_0 (167) <=		 x"5c";
lut_rlps_0 (168) <=		 x"c2";
lut_rlps_0 (169) <=		 x"d3";
lut_rlps_0 (170) <=		 x"ac";
lut_rlps_0 (171) <=		 x"62";
lut_rlps_0 (172) <=		 x"91";
lut_rlps_0 (173) <=		 x"95";
lut_rlps_0 (174) <=		 x"e4";
lut_rlps_0 (175) <=		 x"79";
lut_rlps_0 (176) <=		 x"e7";
lut_rlps_0 (177) <=		 x"c8";
lut_rlps_0 (178) <=		 x"37";
lut_rlps_0 (179) <=		 x"6d";
lut_rlps_0 (180) <=		 x"8d";
lut_rlps_0 (181) <=		 x"d5";
lut_rlps_0 (182) <=		 x"4e";
lut_rlps_0 (183) <=		 x"a9";
lut_rlps_0 (184) <=		 x"6c";
lut_rlps_0 (185) <=		 x"56";
lut_rlps_0 (186) <=		 x"f4";
lut_rlps_0 (187) <=		 x"ea";
lut_rlps_0 (188) <=		 x"65";
lut_rlps_0 (189) <=		 x"7a";
lut_rlps_0 (190) <=		 x"ae";
lut_rlps_0 (191) <=		 x"08";
lut_rlps_0 (192) <=		 x"ba";
lut_rlps_0 (193) <=		 x"78";
lut_rlps_0 (194) <=		 x"25";
lut_rlps_0 (195) <=		 x"2e";
lut_rlps_0 (196) <=		 x"1c";
lut_rlps_0 (197) <=		 x"a6";
lut_rlps_0 (198) <=		 x"b4";
lut_rlps_0 (199) <=		 x"c6";
lut_rlps_0 (200) <=		 x"e8";
lut_rlps_0 (201) <=		 x"dd";
lut_rlps_0 (202) <=		 x"74";
lut_rlps_0 (203) <=		 x"1f";
lut_rlps_0 (204) <=		 x"4b";
lut_rlps_0 (205) <=		 x"bd";
lut_rlps_0 (206) <=		 x"8b";
lut_rlps_0 (207) <=		 x"8a";
lut_rlps_0 (208) <=		 x"70";
lut_rlps_0 (209) <=		 x"3e";
lut_rlps_0 (210) <=		 x"b5";
lut_rlps_0 (211) <=		 x"66";
lut_rlps_0 (212) <=		 x"48";
lut_rlps_0 (213) <=		 x"03";
lut_rlps_0 (214) <=		 x"f6";
lut_rlps_0 (215) <=		 x"0e";
lut_rlps_0 (216) <=		 x"61";
lut_rlps_0 (217) <=		 x"35";
lut_rlps_0 (218) <=		 x"57";
lut_rlps_0 (219) <=		 x"b9";
lut_rlps_0 (220) <=		 x"86";
lut_rlps_0 (221) <=		 x"c1";
lut_rlps_0 (222) <=		 x"1d";
lut_rlps_0 (223) <=		 x"9e";
lut_rlps_0 (224) <=		 x"e1";
lut_rlps_0 (225) <=		 x"f8";
lut_rlps_0 (226) <=		 x"98";
lut_rlps_0 (227) <=		 x"11";
lut_rlps_0 (228) <=		 x"69";
lut_rlps_0 (229) <=		 x"d9";
lut_rlps_0 (230) <=		 x"8e";
lut_rlps_0 (231) <=		 x"94";
lut_rlps_0 (232) <=		 x"9b";
lut_rlps_0 (233) <=		 x"1e";
lut_rlps_0 (234) <=		 x"87";
lut_rlps_0 (235) <=		 x"e9";
lut_rlps_0 (236) <=		 x"ce";
lut_rlps_0 (237) <=		 x"55";
lut_rlps_0 (238) <=		 x"28";
lut_rlps_0 (239) <=		 x"df";
lut_rlps_0 (240) <=		 x"8c";
lut_rlps_0 (241) <=		 x"a1";
lut_rlps_0 (242) <=		 x"89";
lut_rlps_0 (243) <=		 x"0d";
lut_rlps_0 (244) <=		 x"bf";
lut_rlps_0 (245) <=		 x"e6";
lut_rlps_0 (246) <=		 x"42";
lut_rlps_0 (247) <=		 x"68";
lut_rlps_0 (248) <=		 x"41";
lut_rlps_0 (249) <=		 x"99";
lut_rlps_0 (250) <=		 x"2d";
lut_rlps_0 (251) <=		 x"0f";
lut_rlps_0 (252) <=		 x"b0";
lut_rlps_0 (253) <=		 x"54";
lut_rlps_0 (254) <=		 x"bb";
lut_rlps_0 (255) <= 		 x"16";

			
--		end if;
--	end if;
--end process;

-- the lut to be selected depends on the range_index (bits 7 and 6)
--rlps_out	<= 	lut_rlps_0 (conv_integer(state_index)) when range_index = "00" else
--				lut_rlps_1 (conv_integer(state_index)) when range_index = "01" else
--				lut_rlps_2 (conv_integer(state_index)) when range_index = "10" else
--				lut_rlps_3;




rlps_0 <= lut_rlps_0 (conv_integer(state_index));

end behaviour;