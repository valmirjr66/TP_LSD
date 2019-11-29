LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY multiplier IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);

	PORT (
		a : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		b : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		s : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0)
	);
END multiplier;

ARCHITECTURE RTL OF multiplier IS
	SIGNAL result : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
BEGIN
	PROCESS (a, b)
	BEGIN
		result <= std_logic_vector(unsigned(a) * unsigned(b));
		s <= result(DEFAULT_SIZE - 1 DOWNTO 0);
	END PROCESS;
END RTL;