LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY bloco_operacional IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);

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
END bloco_operacional;

ARCHITECTURE RTL OF bloco_operacional IS
	COMPONENT mux_16_bits_1X2 IS
		PORT (
			control : IN std_logic := '0';
			A_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			B_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			S_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux_16_bits_2X4 IS
		PORT (
			control1 : IN std_logic := '0';
			control2 : IN std_logic := '0';
			A_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			B_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			C_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			D_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			S_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT ci_combinacional IS
		PORT (
			A_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			B_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			SUM_CIN : IN std_logic;
			SUM_COUT : OUT std_logic;
			OUTPUT_SUM : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			OUTPUT_MULTIPLICATION : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0)
		);
	END COMPONENT;

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

	COMPONENT registrador_16_bits IS
		PORT (
			D_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			Q_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			clk : IN std_logic;
			R : IN std_logic
		);
	END COMPONENT;

	SIGNAL mux_to_a : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL mux_to_b : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);

	SIGNAL sum_cout : std_logic;
	SIGNAL sum_signal : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL multiplication_signal : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);

	SIGNAL shift_a_signal : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL shift_b_signal : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);

	SIGNAL main_mux_signal : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);

	SIGNAL main_output_signal : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);

	SIGNAL ground : std_logic := '0';
BEGIN
	MUX_ENTRADA_A : mux_16_bits_1X2 PORT MAP(
		control => s4,
		A_IN => main_output_signal,
		B_IN => A,
		S_OUT => mux_to_a);

	MUX_ENTRADA_B : mux_16_bits_1X2 PORT MAP(
		control => s3,
		A_IN => main_output_signal,
		B_IN => B,
		S_OUT => mux_to_b);

	CIRCUITO_COMBINACIONAL : ci_combinacional PORT MAP(
		A_IN => mux_to_a,
		B_IN => mux_to_b,
		SUM_CIN => ground,
		SUM_COUT => sum_cout,
		OUTPUT_SUM => sum_signal,
		OUTPUT_MULTIPLICATION => multiplication_signal);

	CIRCUITO_SEQUENCIAL : ci_sequencial PORT MAP(
		A_IN => mux_to_a,
		A_OUT => shift_a_signal,
		B_IN => mux_to_b,
		B_OUT => shift_b_signal,
		shift_a => shift,
		shift_b => shift,
		load_div_a => load_mult,
		load_div_b => load_mult,
		clock => clock,
		reset => reset);

	MUX_PRINCIPAL : mux_16_bits_2X4 PORT MAP(
		control1 => s1,
		control2 => s2,
		A_IN => sum_signal,
		B_IN => multiplication_signal,
		C_IN => shift_a_signal,
		D_IN => shift_b_signal,
		S_OUT => main_mux_signal);

	REGISTRADOR_PRINCIPAL : registrador_16_bits PORT MAP(
		D_IN => main_mux_signal,
		Q_OUT => main_output_signal,
		clk => load,
		R => reset);

	PROCESS (main_output_signal)
	BEGIN
		Y <= main_output_signal;
	END PROCESS;
END RTL;