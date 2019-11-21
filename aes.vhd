library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--63cab7040953d051cd60e0e7ba70e18c
--00101011011111100001010100010110001010001010111011010010101001101010101111110111000101011000100000001001110011110100111100111100

--chave2
--000102030405060708090a0b0c0d0e0f
-- mensagem2
-- 00112233445566778899aabbccddeeff

entity aes is

	port 
	(
		keyW: in std_logic_vector (127 downto 0);
		saidaOut: out std_logic_vector (127 downto 0);
		mensagem: in std_logic_vector(127 downto 0);
		clkW:in std_logic;
		resetW : in std_logic
	);

end aes;

architecture Behavior of aes is

component geradorKey is
	 port(
		key: in std_logic_vector(127 downto 0);
		saida: out std_logic_vector(127 downto 0);
		clk: in std_logic;
		reset: in std_logic;
		count: in std_logic;
		saidaContador : out std_logic_vector(7 downto 0)
	 );

end component;

component addRoundKey is
	port (
		men_in : in std_logic_vector (127 downto 0);
      key	: in std_logic_vector (127 downto 0);
		men_out : out std_logic_vector (127 downto 0);
		clk : in std_logic
	);
end component;


component subbytes is
port ( 
		men_in : in std_logic_vector (127 downto 0);
      men_out : out std_logic_vector (127 downto 0)
		);
end component;

component mixcolumns is
port (
		 m_in : in STD_LOGIC_VECTOR (127 downto 0);
       m_out : out STD_LOGIC_VECTOR (127 downto 0)
		);
end component;

component fsm is

	port(
		clk		 : in	std_logic;
		enRegSaidaAddRoudKey : out std_logic;
		enRegSaidaAes: out std_logic; --Signal habilita registrador
		enRegEntradaAes: out std_logic; --Signal habilita registrador
		enRegSaidaSubBytes: out std_logic;
		enRegSaidaShiftRows: out std_logic;
		enRegSaidaMixColuns: out std_logic;
		enMux: out std_logic;
		enFinal: out std_logic;
		contador: in std_logic_vector(7 downto 0);
		enMux2: out std_logic;
		reset	 : in	std_logic; --Signal reset na maquida de estados
		resetFsm : out std_logic; --Signal de saida para reset
		countFsm	 : out	std_logic; --Signal habilita contador +4
		estado : out std_logic_vector(3 downto 0);
		roud1 : out std_logic
	);

end component;

component shiftRows is
	
	 port(
		mensagem: in std_logic_vector(127 downto 0); --mensagem a ser codificada
		saida: out std_logic_vector(127 downto 0)	--saida
		);

end component;
component mux is

	port 
	(
		men1	   : in std_logic_vector (127 downto 0);
		men2	   : in std_logic_vector (127 downto 0);
		sel : in std_logic;
		result : out std_logic_vector (127 downto 0)
	);
end component;
--Declarando sinais
signal saidaRegMixColuns,saidaRegGeradorKey,saidaRegAddroudKey,saidaRegSubBytes,saidaRegShiftRows:std_logic_vector(127 downto 0);
signal saidaMuxGerador,saidaGeradorKey,key,saidaAddroudKey,saidaSubBytes,saidaShiftRows,saidaMixColuns,saidamuxChave,saidamuxReEntrada,saidaFinal:std_logic_vector(127 downto 0);
signal contadorGeradorKey : std_logic_vector(7 downto 0);
signal enMux,enFinal,enmux2,enRegSaidaMixColuns,enRegSaidaShiftRows,enRegSaidaSubBytes,countFsm,resetFsm,enRegSaidaAes,enRegEntradaAes,enRegSaidaAddRoudKey,roud1: std_logic;

begin

--Realizando por map
gerador: geradorKey port map(
			key(127 downto 0),
			saidaGeradorKey(127 downto 0),
			clk => clkW,
			saidaContador => contadorGeradorKey,
			reset => resetFsm,
			count =>countFsm
			);

f:fsm port map(enRegSaidaMixColuns => enRegSaidaMixColuns,
				 enRegSaidaShiftRows => enRegSaidaShiftRows,
				 enRegSaidaSubBytes => enRegSaidaSubBytes,
				 clk => clkW,
				 reset =>resetW,
				 countFsm=>countFsm,
				 resetFsm => resetFsm,
			    enRegSaidaAes=>enRegSaidaAes,
				 enregEntradaAes=>enRegEntradaAes,
				 roud1=>roud1,
				 contador => contadorGeradorKey,
				 enRegSaidaAddRoudKey => enRegSaidaAddRoudKey,
				 enMux => enMux,
				 enmux2 => enmux2,
				 enFinal => enFinal
				);
muxGeradorKey:mux port map(
		sel => roud1,
		men1 => saidaRegGeradorKey,
		men2 => keyW,
		result => saidaMuxGerador
	);
compAddroud: addRoundKey port map(
					men_in => saidaFinal,
					key => saidaMuxGerador,
					men_out => saidaAddroudKey,
					clk => clkW
				);
compSubbytes: subbytes port map(
						men_in => saidaRegAddroudKey,
						men_out => saidaSubBytes
				  );
compShiftRows: shiftRows port map (
						mensagem => saidaRegSubBytes,
						saida => saidaShiftRows
					);
compMixColuns: mixcolumns port map(
									m_in => saidaRegShiftRows,
									m_out => saidaMixColuns
								  );
compMuxChave: mux port map(
						sel => enmux,
						men1 => saidaRegGeradorKey,
						men2 => keyW,
						result => saidamuxChave
					);
compMuxReEntrada: mux port map(
							sel => enmux2,
							men1 => saidaRegMixColuns,
							men2 => mensagem,
							result => saidamuxReEntrada
						);
compMuxFina: mux port map(
						sel => enFinal,
						men1 => saidamuxReEntrada,
						men2 => saidaRegShiftRows,
						result => saidaFinal
					);

process(clkW,saidaGeradorKey,saidaAddroudKey,saidaMixColuns,saidaShiftRows,saidaSubBytes,enRegEntradaAes,enRegSaidaAes,enRegSaidaAddRoudKey,enregSaidaSubBytes,enRegSaidaShiftRows,enRegSaidaMixColuns)
	begin
		if(rising_edge(clkW) and enRegEntradaAes = '1') then
			key <= saidamuxChave;
		end if;
		if(rising_edge(clkW) and enRegSaidaAes = '1') then
			saidaRegGeradorKey <= saidaGeradorKey;
		end if;
		if(rising_edge(clkW) and enRegSaidaAddRoudKey = '1') then
			saidaRegAddroudKey <= saidaAddroudKey;
		end if;
		if(rising_edge(clkW) and enregSaidaSubBytes = '1') then
			saidaRegSubBytes <= saidaSubBytes;
		end if;
		if(rising_edge(clkw) and enRegSaidaShiftRows = '1') then
			saidaRegShiftRows <= saidaShiftRows;
		end if;
		if(rising_edge(clkW) and enRegSaidaMixColuns = '1') then
			saidaRegMixColuns <= saidaMixColuns;
		end if;
end process;

saidaOut <= saidaRegAddroudKey;
end Behavior;
