LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY multiplier IS
	GENERIC (
		SHORT_SIZE : INTEGER := 16;
		LONG_SIZE : INTEGER := 32
	);

	PORT (
		a : IN unsigned(SHORT_SIZE - 1 DOWNTO 0);
		b : IN unsigned(SHORT_SIZE - 1 DOWNTO 0);
		s : OUT unsigned(LONG_SIZE - 1 DOWNTO 0)
	);
END multiplier;

ARCHITECTURE RTL OF multiplier IS
	SIGNAL result : unsigned(LONG_SIZE - 1 DOWNTO 0);
BEGIN
	PROCESS (a, b)
	BEGIN
		result <= a * b;
	END PROCESS;
	s <= result;
END RTL;