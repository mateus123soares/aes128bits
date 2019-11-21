-- Quartus II VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_top is


end entity;

architecture rtl of aes_top is

component aes is

	port 
	(
		keyW: in std_logic_vector (127 downto 0);
		saidaOut: out std_logic_vector (127 downto 0);
		mensagem: in std_logic_vector(127 downto 0);
		clkW:in std_logic;
		resetW : in std_logic
	);

end component;

	--Signal entidade AES
	signal keyW_sg,saidaOut_sg:std_logic_vector(127 downto 0);
	signal clkW_sg: std_logic := '0';
	signal resetW_sg: std_logic := '0';
	signal mensagem_sg:std_logic_vector(127 downto 0);
	
begin

	inst_aes:aes port map(
							keyW => keyW_sg,
							mensagem => mensagem_sg,
							saidaOut => saidaOut_sg,
							clkW => clkW_sg,
							resetW => resetW_sg
							
	);
	
	clkW_sg <=not clkW_sg after 2ns;
	
	process
	begin
		wait for 0ns;
			keyW_sg <= x"2B7E151628AED2A6ABF7158809CF4F3C";
			mensagem_sg <= x"AE2D8A571E03AC9C9EB76FAC45AF8E51";
			resetW_sg <= '1';
			--00110000110010000001110001000110101000110101110011100100000100011110010111111011110000010001100100011010000010100101001011101111
			--n
			--00110000110010000001110001000110101000110101110011100100000100011110010111111011110000010001100100011010000010100101001011101111
		wait for  2ns;
			resetW_sg <= '0';
		wait;
	end process;
end rtl;
