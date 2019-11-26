LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY shifter IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);

	PORT (
		A_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		B_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		shift : IN std_logic;
		load_div : IN std_logic;
		clock : IN std_logic;
		reset : IN std_logic
	);
END shifter;

ARCHITECTURE RTL OF shifter IS
	COMPONENT registrador_16_bits IS
		PORT (
			D_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			Q_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			clk : IN std_logic;
			R : IN std_logic
		);
	END COMPONENT;

	SIGNAL register_output : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL carregamento_inicial : std_logic := '0';
	SIGNAL proto_output : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
BEGIN
	register_component : registrador_16_bits PORT MAP(
		D_IN => A_IN,
		Q_OUT => register_output,
		clk => load_div,
		R => reset);

	PROCESS (reset)
	BEGIN
		IF (reset = '1') THEN
			carregamento_inicial <= '0';
		END IF;
	END PROCESS;

	PROCESS (register_output, carregamento_inicial)
	BEGIN
		IF (NOT(carregamento_inicial) = '1') THEN
			proto_output <= register_output;
		END IF;
	END PROCESS;

	PROCESS (load_div)
	BEGIN
		IF (load_div = '1') THEN
			carregamento_inicial <= '1';
		END IF;
	END PROCESS;

	PROCESS (proto_output, shift)
	BEGIN
		IF (shift'event AND shift = '1') THEN
			proto_output <= '0' & proto_output(DEFAULT_SIZE - 1 DOWNTO 1);
		ELSE
			proto_output <= proto_output;
		END IF;

		B_OUT <= proto_output;
	END PROCESS;
END RTL;