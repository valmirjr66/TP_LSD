LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_ci_combinacional IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);
END tb_ci_combinacional;

ARCHITECTURE teste OF tb_ci_combinacional IS
	COMPONENT ci_combinacional IS
		PORT (
			A_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			B_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			SUM_CIN : IN std_logic;
			SUM_COUT : OUT std_logic;
			OUTPUT_SUM : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			OUTPUT_MULTIPLICATION : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL a, b, soma : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL multiplicacao : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL cin, cout : std_logic;
BEGIN
	instancia_ci_combinacional : ci_combinacional PORT MAP(A_IN => a, B_IN => b, SUM_CIN => cin, OUTPUT_SUM => soma, SUM_COUT=> cout, OUTPUT_MULTIPLICATION => multiplicacao);
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