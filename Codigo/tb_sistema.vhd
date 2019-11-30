LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_sistema IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);
END tb_sistema;

ARCHITECTURE teste OF tb_sistema IS
	COMPONENT sistema IS
		PORT (
			A : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			B : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			Y : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			R, S, M, Da, Db, La, Lb : IN std_logic;
			clock, reset : IN std_logic
		);
	END COMPONENT;

	SIGNAL A, B, Y : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL R, S, M, Da, Db, La, Lb : std_logic := '0';
	SIGNAL clock, reset : std_logic := '0';
BEGIN
	instancia_sistema : sistema
	PORT MAP(
		A => A,
		B => B,
		Y => Y,
		clock => clock,
		reset => reset,
		R => R,
		S => S,
		M => M,
		Da => Da,
		Db => Db,
		La => La,
		Lb => Lb
	);

	entradas_process : PROCESS
	BEGIN
		A <= "0000100110010110";
		B <= "0010100011010001";
		WAIT FOR 20 ns;
		m <= '1';
		WAIT FOR 20 ns;
		r <= '1';
		WAIT FOR 100 ns;
	END PROCESS;

	clock_process : PROCESS
	BEGIN
		clock <= NOT(clock);
		WAIT FOR 1 ns;
	END PROCESS;
END teste;