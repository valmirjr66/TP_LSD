LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ci_combinacional IS
	GENERIC (
		LONG_SIZE : INTEGER := 32
	);

	PORT (
		A_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
		B_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
		SUM_COUT : IN std_logic;
		OUTPUT_SUM: OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
		OUTPUT_SUM : OUT std_logic
	);
END ci_combinacional;

ARCHITECTURE RTL OF ci_combinacional IS
	COMPONENT ppa IS
		PORT (
			Cin : IN std_logic;
			x : IN std_logic;
			y : IN std_logic;
			s : OUT std_logic;
			Cout : OUT std_logic
		);
	END COMPONENT;

	SIGNAL cout1 : std_logic;
BEGIN
	SOMA : full_adder PORT MAP(
		Cin => CIN,
		x => A_IN(0),
		y => B_IN(0),
		s => S_OUT(0),
		Cout => cout1);
	
	SOMA : full_adder PORT MAP(
		Cin => CIN,
		x => A_IN(0),
		y => B_IN(0),
		s => S_OUT(0),
		Cout => cout1);
END RTL;