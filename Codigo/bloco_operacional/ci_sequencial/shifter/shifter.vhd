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
BEGIN
	register_component : registrador_16_bits PORT MAP(
		D_IN => A_IN,
		Q_OUT => register_output,
		clk => load_div,
		R => reset);

	PROCESS (register_output, shift)
	BEGIN
		IF (shift'event AND shift = '1') THEN
			B_OUT <= '0' & register_output(DEFAULT_SIZE - 1 DOWNTO 1);
		ELSE
			B_OUT <= register_output;
		END IF;
	END PROCESS;
END RTL;