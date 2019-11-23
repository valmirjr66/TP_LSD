LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ci_combinacional IS
	GENERIC (
		SHORT_SIZE : INTEGER := 16;
		LONG_SIZE : INTEGER := 32
	);

	PORT (
		A_IN : IN std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
		B_IN : IN std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
		SUM_CIN : IN std_logic;
		SUM_COUT : OUT std_logic;
		OUTPUT_SUM : OUT std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
		OUTPUT_MULTIPLICATION : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0)
	);
END ci_combinacional;

ARCHITECTURE RTL OF ci_combinacional IS
	COMPONENT ppa IS
		PORT (
			A_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			B_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			CIN : IN std_logic;
			S_OUT : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			COUT : OUT std_logic
		);
	END COMPONENT;

	COMPONENT multiplier IS
		PORT (
			a : IN unsigned(SHORT_SIZE - 1 DOWNTO 0);
			b : IN unsigned(SHORT_SIZE - 1 DOWNTO 0);
			s : OUT unsigned(LONG_SIZE - 1 DOWNTO 0)
		);
	END COMPONENT;
BEGIN
	SOMA : ppa PORT MAP(
		CIN => SUM_CIN,
		A_IN => A_IN,
		B_IN => B_IN,
		S_OUT => OUTPUT_SUM,
		COUT => SUM_COUT);

	MULTIPLICACAO : multiplier PORT MAP(
		a => A_IN,
		b => B_IN,
		s => OUTPUT_MULTIPLICATION);
END RTL;