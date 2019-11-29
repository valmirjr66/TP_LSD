LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_ci_sequencial IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);
END tb_ci_sequencial;

ARCHITECTURE teste OF tb_ci_sequencial IS
	COMPONENT ci_sequencial IS
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
	END COMPONENT;

	SIGNAL A_IN, A_OUT, B_IN, B_OUT : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL shift_a, shift_b, load_div_a, load_div_b, clock, reset : std_logic := '0';
BEGIN
	instancia_ci_sequencial : ci_sequencial PORT MAP(
		A_IN => A_IN,
		A_OUT => A_OUT,
		B_IN => B_IN,
		B_OUT => B_OUT,
		shift_a => shift_a,
		shift_b => shift_b,
		load_div_a => load_div_a,
		load_div_b => load_div_b,
		clock => clock,
		reset => reset
	);

	clock_process : PROCESS
	BEGIN
		clock <= NOT(clock);
		WAIT FOR 5 ns;
	END PROCESS;

	entradas_process : PROCESS
	BEGIN
		a <= "0000011110000001";
		b <= "1100010000100000";
		WAIT FOR 20 ns;
		load_div_a <= '1';
		WAIT FOR 20 ns;
		load_div_b <= '1';
		WAIT FOR 10 ns;
		load_div_a <= '0';
		load_div_b <= '0';
		WAIT FOR 20 ns;
		a <= "0001001001101000";
		b <= "0010100011010001";
		WAIT FOR 20 ns;
		shift_a <= '1';
		WAIT FOR 20 ns;
		shift_b <= '1';
	END PROCESS;
END teste;