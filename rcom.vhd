library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rcom is

	port 
	(
		indice : in std_logic_vector  (7 downto 0);
		result : out std_logic_vector (7 downto 0)
	);

end rcom;

architecture Behavior of rcom is
begin
process(indice)
begin
	case indice is
   when "00000100" => result <= "00000001";
   when "00001000" => result <= "00000010";
   when "00001100" => result <= "00000100";
   when "00010000" => result <= "00001000";
   when "00010100" => result <= "00010000";
	when "00011000" => result <= "00100000";
   when "00011100" => result <= "01000000";
   when "00100000" => result <= "10000000";
   when "00100100" => result <= "00011011";
   when "00101000" => result <= "00110110";
   when "00110000" => result <= "11011011";
	when others => result <= "00000000";
end case;
end process;
end Behavior;
