LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_ppa IS
	GENERIC (
		LONG_SIZE : INTEGER := 16
	);
END tb_ppa;

ARCHITECTURE teste OF tb_ppa IS
	COMPONENT ppa IS
		PORT (
			A_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			B_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			CIN : IN std_logic;
			S_OUT : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			COUT : OUT std_logic
		);
	END COMPONENT;

	SIGNAL a, b, s : std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
	SIGNAL cin, cout : std_logic;
BEGIN
	instancia_ppa : ppa PORT MAP(A_IN => a, B_IN => b, CIN => cin, S_OUT => s, COUT => cout);
	entradas_process : PROCESS
	BEGIN
		a <= "0000000000000000";
		b <= "0000000000000000";
		cin <= '1';
		WAIT FOR 20 ns;
		a <= "0000100110010110";
		b <= "0001101011100100";
		cin <= '0';
		WAIT FOR 20 ns;
		a <= "0001001001101000";
		b <= "0010100011010001";
		cin <= '1';
		WAIT FOR 20 ns;
		a <= "0001111000000000";
		b <= "0000110000000000";
		cin <= '1';
		WAIT FOR 20 ns;
	END PROCESS;
END teste;