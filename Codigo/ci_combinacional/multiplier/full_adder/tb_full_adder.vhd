LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_full_adder IS
END tb_full_adder;

ARCHITECTURE teste OF tb_full_adder IS
	COMPONENT full_adder IS
		PORT (
			Cin : IN std_logic;
			x : IN std_logic;
			y : IN std_logic;
			s : OUT std_logic;
			Cout : OUT std_logic
		);
	END COMPONENT;

	SIGNAL X, Y, CIN, S, COUT : std_logic;
BEGIN
	instancia_full_adder : full_adder PORT MAP(x => X, y => Y, Cin => CIN, s => S, Cout => COUT);
	entradas_process : PROCESS
	BEGIN
		X <= '0';
		Y <= '0';
		CIN <= '0';
		WAIT FOR 100 ns;
		X <= '0';
		Y <= '1';
		CIN <= '0';
		WAIT FOR 100 ns;
		X <= '0';
		Y <= '1';
		CIN <= '1';
		WAIT FOR 100 ns;
		X <= '1';
		Y <= '1';
		CIN <= '1';
		WAIT FOR 100 ns;
	END PROCESS;
END teste;