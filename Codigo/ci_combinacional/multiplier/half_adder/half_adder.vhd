LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
	PORT (
		x : IN std_logic;
		y : IN std_logic;
		s : OUT std_logic;
		Cout : OUT std_logic
	);
END full_adder;

ARCHITECTURE RTL OF full_adder IS
BEGIN
	PROCESS (x, y) IS
	BEGIN
		s <= x XOR y;
		Cout <= x AND y;
	END PROCESS;
END RTL;