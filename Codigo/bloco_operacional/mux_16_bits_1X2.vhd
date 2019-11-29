LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux_16_bits_1X2 IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);

	PORT (
		control : IN std_logic := '0';
		A_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		B_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		S_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0)
	);
END mux_16_bits_1X2;

ARCHITECTURE RTL OF mux_16_bits_1X2 IS
BEGIN
	PROCESS (control, A_IN, B_IN)
	BEGIN
		IF (control = '1') THEN
			S_OUT <= A_IN;
		ELSE
			S_OUT <= B_IN;
		END IF;
	END PROCESS;
END RTL;