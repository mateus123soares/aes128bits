library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity subbytes is
port ( men_in : in std_logic_vector (127 downto 0);
       men_out : out std_logic_vector (127 downto 0)
		);
end subbytes;

architecture Behavioral of subbytes is

component sbox is
port (
		--reset				: in 	std_logic;
		--clock				: in 	std_logic;
		state_index			: in 	std_logic_vector(7 downto 0);
		rlps_0				: out 	std_logic_vector(7 downto 0)
		); 
end component;

begin

s0 : sbox port map (men_in(127 downto 120),men_out(127 downto 120));
s1 : sbox port map (men_in(119 downto 112),men_out(119 downto 112));
s2 : sbox port map (men_in(111 downto 104),men_out(111 downto 104));
s3 : sbox port map (men_in(103 downto 96),men_out(103 downto 96));
s4 : sbox port map (men_in(95 downto 88),men_out(95 downto 88));
s5 : sbox port map (men_in(87 downto 80),men_out(87 downto 80));
s6 : sbox port map (men_in(79 downto 72),men_out(79 downto 72));
s7 : sbox port map (men_in(71 downto 64),men_out(71 downto 64)); 
s8 : sbox port map (men_in(63 downto 56),men_out(63 downto 56)); 
s9 : sbox port map (men_in(55 downto 48),men_out(55 downto 48)); 
s10 : sbox port map (men_in(47 downto 40),men_out(47 downto 40)); 
s11 : sbox port map (men_in(39 downto 32),men_out(39 downto 32)); 
s12 : sbox port map (men_in(31 downto 24),men_out(31 downto 24)); 
s13 : sbox port map (men_in(23 downto 16),men_out(23 downto 16)); 
s14 : sbox port map (men_in(15 downto 8),men_out(15 downto 8));
s15 : sbox port map (men_in(7 downto 0),men_out(7 downto 0));

end Behavioral;