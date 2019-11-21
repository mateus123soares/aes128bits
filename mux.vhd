-- Quartus II VHDL Template
-- Unsigned Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is

	port 
	(
		men1	   : in std_logic_vector (127 downto 0);
		men2	   : in std_logic_vector (127 downto 0);
		sel : in std_logic;
		result : out std_logic_vector (127 downto 0)
	);

end entity;

architecture rtl of mux is
begin
	result <= men1 when (sel ='0') else
				men2;
end rtl;
