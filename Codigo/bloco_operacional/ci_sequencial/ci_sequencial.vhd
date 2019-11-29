LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ci_sequencial IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);

	PORT (
		A_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		A_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		B_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		B_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		shift_a : IN std_logic;
		shift_b : IN std_logic;
		load_div_a : IN std_logic;
		load_div_b : IN std_logic;
		clock : IN std_logic;
		reset : IN std_logic
	);
END ci_sequencial;

ARCHITECTURE RTL OF ci_sequencial IS
	COMPONENT shifter IS
		PORT (
			A_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			B_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			shift : IN std_logic;
			load_div : IN std_logic;
			clock : IN std_logic;
			reset : IN std_logic
		);
	END COMPONENT;
BEGIN
	SHIFTER_A : shifter PORT MAP(
		A_IN => A_IN,
		B_OUT => A_OUT,
		shift => shift_a,
		load_div => load_div_a,
		clock => clock,
		reset => reset);

	SHIFTER_B : shifter PORT MAP(
		A_IN => B_IN,
		B_OUT => B_OUT,
		shift => shift_b,
		load_div => load_div_b,
		clock => clock,
		reset => reset);
END RTL;