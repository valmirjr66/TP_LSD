LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY sistema IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);

	PORT (
		A : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		B : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		Y : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		R, S, M, Da, Db, La, Lb : IN std_logic;
		clock, reset : IN std_logic
	);
END sistema;

ARCHITECTURE RTL OF sistema IS
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

	COMPONENT bloco_controle IS
		PORT (
			CLOCK : IN std_logic;
			RESET : IN std_logic;
			R, S, M, Da, Db, La, Lb : IN std_logic;
			s1, s2, s3, s4 : OUT std_logic;
			load, clear, shift, load_mult : OUT std_logic
		);
	END COMPONENT;

	SIGNAL s1, s2, s3, s4 : std_logic;
	SIGNAL load, clear, shift, load_mult : std_logic;
BEGIN
	OPERACIONAL : bloco_operacional PORT MAP(
		A => A,
		B => B,
		Y => Y,
		clock => clock,
		reset => reset,
		s1 => s1,
		s2 => s2,
		s3 => s3,
		s4 => s4,
		load => load,
		clear => clear,
		shift => shift,
		load_mult => load_mult
	);

	CONTROLE : bloco_controle PORT MAP(
		CLOCK => clock,
		RESET => reset,
		R => R,
		S => S,
		M => M,
		Da => Da,
		Db => Db,
		La => La,
		Lb => Lb,
		s1 => s1,
		s2 => s2,
		s3 => s3,
		s4 => s4,
		load => load,
		clear => clear,
		shift => shift,
		load_mult => load_mult
	);
END RTL;