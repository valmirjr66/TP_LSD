LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_ci_combinacional IS
	GENERIC (
		LONG_SIZE : INTEGER := 16
	);
END tb_ci_combinacional;

ARCHITECTURE teste OF tb_ci_combinacional IS
	COMPONENT ci_combinacional IS
		PORT (
			A_IN : IN std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
			B_IN : IN std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
			SUM_CIN : IN std_logic;
			SUM_COUT : OUT std_logic;
			OUTPUT_SUM : OUT std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
			OUTPUT_MULTIPLICATION : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL a, b, s : std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
	SIGNAL cin, cout : std_logic;
BEGIN
	instancia_ci_combinacional : ci_combinacional PORT MAP(A_IN => a, B_IN => b, CIN => cin, S_OUT => s, COUT => cout);
	entradas_process : PROCESS
	BEGIN
		a <= "00000000000000000000000000000000";
		b <= "00000000000000000000000000000000";
		cin <= '1';
		WAIT FOR 20 ns;
		a <= "00000000000000000000100110010110";
		b <= "00000000000000001010001101000100";
		cin <= '0';
		WAIT FOR 20 ns;
		a <= "00000000000100110001011000000000";
		b <= "00000000000000000010100011010001";
		cin <= '1';
		WAIT FOR 20 ns;
		a <= "00000000000000000111100000000000";
		b <= "00000000000000000000110000000000";
		cin <= '1';
		WAIT FOR 20 ns;
	END PROCESS;
END teste;