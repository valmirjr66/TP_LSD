LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
	PORT (
		Cin : IN std_logic;
		x : IN std_logic;
		y : IN std_logic;
		s : OUT std_logic;
		Cout : OUT std_logic
	);
END full_adder;

ARCHITECTURE RTL OF full_adder IS
	SIGNAL adder : std_logic_vector (1 DOWNTO 0);

BEGIN
	PROCESS (Cin, x, y) IS
	BEGIN
		IF ((x XOR y XOR Cin) = '1') THEN
			s <= '1';
		ELSE
			s <= '0';
		END IF;
	END PROCESS;

	PROCESS (Cin, x, y) IS
	BEGIN
		IF (((x AND y) OR (Cin AND x) OR (Cin AND y)) = '1') THEN
			Cout <= '1';
		ELSE
			Cout <= '0';
		END IF;
	END PROCESS;
END RTL;