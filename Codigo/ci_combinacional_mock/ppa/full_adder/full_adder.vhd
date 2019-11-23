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
BEGIN
	PROCESS (Cin, x, y) IS
	BEGIN
		s <= x XOR y XOR Cin;
		Cout <= (x AND y) OR (Cin AND x) OR (Cin AND y);
	END PROCESS;
END RTL;