LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_bloco_operacional IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);
END tb_bloco_operacional;

ARCHITECTURE teste OF tb_bloco_operacional IS
	COMPONENT bloco_operacional IS
		PORT (
			-- Pinos principais
			A : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			B : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			Y : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			-- Pinos de controle
			s1, s2, s3, s4 : IN std_logic;
			clock, reset : IN std_logic;
			load, clear, shift, load_mult : IN std_logic
		);
	END COMPONENT;

	A, B, Y : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	s1, s2, s3, s4 : std_logic := '0';
	clock, reset : std_logic := '0';
	load, clear, shift, load_mult : std_logic := '0';

	instancia_bloco_operacional : bloco_operacional
	PORT MAP(
		A => A,
		B => B,
		Y => Y,
		s1 => s1,
		s2 => s2,
		s3 => s3,
		s4 => s4,
		clock => clock,
		reset => reset,
		load => load,
		clear => clear,
		shift => shift,
		load_mult => load_mult
	);

	entradas_process : PROCESS
	BEGIN
		A <= "0000100110010110";
		B <= "0010100011010001";
		WAIT FOR 20 ns;
	END PROCESS;

	clock_process : PROCESS
	BEGIN
		clock <= NOT(clock);
		WAIT FOR 1 ns;
	END PROCESS;
END teste;