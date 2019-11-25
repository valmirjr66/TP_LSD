LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY FlipFlopD IS
	PORT (
		clock : IN std_logic;
		D : IN std_logic;
		Reset : IN std_logic;
		Q : OUT std_logic
	);
END FlipFlopD;

ARCHITECTURE RTL OF FlipFlopD IS
	SIGNAL s : std_logic;
	SIGNAL r : std_logic;
	SIGNAL nQ : std_logic;
	SIGNAL rQ : std_logic;
BEGIN
	s <= (D AND NOT clock) NOR r;
	r <= (NOT D AND NOT clock) NOR s;
	rQ <= (s AND clock) NOR nQ;
	nQ <= (r AND clock) NOR rQ;
	Q <= rQ AND NOT(Reset);
END RTL;