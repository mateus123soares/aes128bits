library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity addRoundKey is
port ( men_in : in std_logic_vector (127 downto 0);
       key	: in std_logic_vector (127 downto 0);
		 men_out : out std_logic_vector (127 downto 0);
		 clk : in std_logic
		);
end addRoundKey;

architecture Behavioral of addRoundKey is

begin
	
	process (clk)
	begin
		if(rising_edge(clk)) then
			men_out <= men_in(127 downto 0) xor key(127 downto 0);
		end if;
	end process;

end Behavioral;