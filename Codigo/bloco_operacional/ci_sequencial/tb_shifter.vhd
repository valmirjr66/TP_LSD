LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_shifter IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);
END tb_shifter;

ARCHITECTURE teste OF tb_shifter IS
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

	SIGNAL A_IN, B_OUT : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL shift, load_div, clock, reset : std_logic := '0';
BEGIN
	instancia_shifter : shifter PORT MAP(A_IN => A_IN, B_OUT => B_OUT, shift => shift, load_div => load_div, clock => clock, reset => reset);
	clock_process : PROCESS
	BEGIN
		clock <= NOT(clock);
		WAIT FOR 3 ns;
	END PROCESS;

	entradas_process : PROCESS
	BEGIN
		A_IN <= "0000100110010110";
		WAIT FOR 20 ns;
		load_div <= '1';
		WAIT FOR 20 ns;
		load_div <= '0';
		WAIT FOR 20 ns;
		shift <= '1';
		WAIT FOR 20 ns;
		shift <= '0';
	END PROCESS;
END teste;