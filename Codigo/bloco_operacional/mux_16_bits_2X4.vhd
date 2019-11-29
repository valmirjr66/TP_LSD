LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux_16_bits_2X4 IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);

	PORT (
		control1 : IN std_logic;
		control2 : IN std_logic;
		A_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		B_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		C_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		D_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		S_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0)
	);
END mux_16_bits_2X4;

ARCHITECTURE RTL OF mux_16_bits_2X4 IS
BEGIN
	PROCESS (control1, control2, A_IN, B_IN, C_IN, D_IN)
	BEGIN
		IF ((NOT(control1) AND NOT(control2)) = '1') THEN
			S_OUT <= A_IN;
		ELSIF ((NOT(control1) AND control2) = '1') THEN
			S_OUT <= B_IN;
		ELSIF ((control1 AND NOT(control2)) = '1') THEN
			S_OUT <= C_IN;
		ELSE
			S_OUT <= D_IN;
		END IF;
	END PROCESS;
END RTL;