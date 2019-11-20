LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_half_adder IS
END tb_half_adder;

ARCHITECTURE teste OF tb_half_adder IS
	COMPONENT half_adder IS
		PORT (
			x : IN std_logic;
			y : IN std_logic;
			s : OUT std_logic;
			Cout : OUT std_logic
		);
	END COMPONENT;

	SIGNAL X, Y, S, COUT : std_logic;
BEGIN
	instancia_half_adder : half_adder PORT MAP(x => X, y => Y, s => S, Cout => COUT);
	entradas_process : PROCESS
	BEGIN
		X <= '0';
		Y <= '0';
		WAIT FOR 100 ns;
		X <= '0';
		Y <= '1';
		WAIT FOR 100 ns;
		X <= '1';
		Y <= '0';
		WAIT FOR 100 ns;
		X <= '1';
		Y <= '1';
		WAIT FOR 100 ns;
	END PROCESS;
END teste;