-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity fsm is

	port(
		clk		 : in	std_logic;
		enRegSaidaAddRoudKey : out std_logic;
		enRegSaidaAes: out std_logic; --Signal habilita registrador
		enRegEntradaAes: out std_logic; --Signal habilita registrador
		enRegSaidaSubBytes: out std_logic;
		enRegSaidaShiftRows: out std_logic;
		enRegSaidaMixColuns: out std_logic;
		contador: in std_logic_vector(7 downto 0);
		enMux: out std_logic;
		enMux2: out std_logic;
		enFinal: out std_logic;
		reset	 : in	std_logic; --Signal reset na maquida de estados
		resetFsm : out std_logic; --Signal de saida para reset
		countFsm	 : out	std_logic; --Signal habilita contador +4
		estado : out std_logic_vector(3 downto 0);
		roud1 : out std_logic
	);

end entity;

architecture rtl of fsm is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3, s4, s5, s6,s7,s8,s9,s10,s11,s12);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset,contador)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					if clk = '1' then
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>
					if clk = '1' then
						state <= s2;
					else
						state <= s1;
					end if;
				when s2=>
					if clk = '1' then
						state <= s3;
					else
						state <= s2;
					end if;
				when s3 =>
					if clk = '1' then
						state <= s4;
					else
						state <= s3;
					end if;
				when s4 =>
					if clk = '1' then
						state <= s5;
					else
						state <= s4;
					end if;
				when s5 =>
					if contador >= "00101100" then
						state <= s12;
					else
						state <= s6;
					end if;
				when s6 =>
					if contador >= "00101100" then
						state <= s12;
					else
						state <= s7;
					end if;
				when s7 =>
					if contador >= "00101100" then
						state <= s12;
					else
						state <= s8;
					end if;
				when s8 =>
					if clk = '1' then
						state <= s9;
					else
						state <= s8;
					end if;
				when s9 =>
					if clk ='1' then
						state <= s10;
					else
						state <= s9;
					end if;
				when s10 =>
					if clk='1' then
						state <= s11;
					else
						state <= s10;
					end if;
				when s11 =>
					if clk ='1' then
						state <= s5;
					else
						state <= s10;
					end if;
					when s12 =>
					if clk ='1' then
						state <= s12;
					else
						state <= s12;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				resetFsm <= '1';
				countFsm <= '0';
				enRegEntradaAes <='1';
				enRegSaidaAes <='0';
				estado <= "0000";
				roud1 <='1';
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '0';
				enMux <= '1';
				enMux2 <= '1';
				enFinal <= '0';
			when s1 =>
				resetFsm <= '0';
				countFsm <= '0';
				enRegEntradaAes <='0';
				enRegSaidaAes <='1';
				estado <= "0001";
				enRegSaidaAddRoudKey <= '1';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '0';
				enMux <= '1';
				enMux2 <= '1';
				enFinal <= '0';
			when s2 =>
				roud1 <='0';
			   enRegEntradaAes <='0';
				enRegSaidaAes <='0';
				countFsm <= '0';
				estado <= "0010";
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '1' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '0';
				enMux <= '1';
				enMux2 <= '1';
				enFinal <= '0';
			when s3 =>
				roud1 <='0';
			   enRegEntradaAes <='0';
				enRegSaidaAes <='0';
				countFsm <= '0';
				estado <= "0011";
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='1';
				enRegSaidaMixColuns <= '0';
				enMux <= '1';
				enMux2 <= '1';
				enFinal <= '0';
			when s4 =>
				resetFsm <= '0';
				countFsm <= '0';
				enRegEntradaAes <='0';
				enRegSaidaAes <='0';
				estado <= "0000";
				roud1 <='0';
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '1';
				enMux <= '1';
				enMux2 <= '1';
				enFinal <= '0';
			when s5 =>
				estado <= "0101";
				enRegEntradaAes <='0';
				enRegSaidaAes <='0';
				countFsm <= '1';
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '0';
				enMux <= '0';
				enMux2 <= '0';
				enFinal <= '0';
			when s6 =>
				estado <= "0110";
				countFsm <= '0';
				enRegEntradaAes <='0';
				enRegSaidaAes <='0';
				enRegSaidaAddRoudKey <= '1';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '0';
				enMux <= '0';
				enMux2 <= '0';
				enFinal <= '0';
			when s7 =>
				estado <= "0111";
				roud1 <='0';
			   enRegEntradaAes <='0';
				enRegSaidaAes <='0';
				countFsm <= '0';
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '1' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '0';
				enMux <= '0';
				enMux2 <= '0';
				enFinal <= '0';
			when s8 =>
				estado <= "1000";
				roud1 <='0';
			   enRegEntradaAes <='0';
				enRegSaidaAes <='0';
				countFsm <= '0';
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='1';
				enRegSaidaMixColuns <= '0';
				enMux <= '0';
				enMux2 <= '0';
				enFinal <= '0';
			when s9 =>
				enMux2 <= '0';
				estado <= "1001";
				roud1 <='0';
			   enRegEntradaAes <='0';
				enRegSaidaAes <='0';
				countFsm <= '0';
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '1';
				enMux <= '0';
				enFinal <= '0';
			when s10 =>
				enMux2 <= '0';
				estado <= "1010";
				roud1 <='0';
			   enRegEntradaAes <='1';
				enRegSaidaAes <='0';
				countFsm <= '0';
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '0';
				enMux <= '0';
				enFinal <= '0';
			when s11 =>
				enMux2 <= '0';
				estado <= "1011";
				roud1 <='0';
			   enRegEntradaAes <='1';
				enRegSaidaAes <='1';
				countFsm <= '0';
				enRegSaidaAddRoudKey <= '0';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '0';
				enMux <= '0';
				enFinal <= '0';
			when s12 =>
				enMux2 <= '0';
				estado <= "1100";
				roud1 <='0';
			   enRegEntradaAes <='0';
				enRegSaidaAes <='0';
				countFsm <= '0';
				enRegSaidaAddRoudKey <= '1';
				enRegSaidaSubBytes <= '0' ;
				enRegSaidaShiftRows <='0';
				enRegSaidaMixColuns <= '0';
				enMux <= '0';
				enFinal <= '1';
		end case;
	end process;

end rtl;
