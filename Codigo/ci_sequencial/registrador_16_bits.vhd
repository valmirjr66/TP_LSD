LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY registrador_16_bits IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);

	PORT (
		D_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		Q_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
		clk : IN std_logic;
		R : IN std_logic
	);
END registrador_16_bits;

ARCHITECTURE RTL OF registrador_16_bits IS
	COMPONENT flip_flop_d IS
		PORT (
			clock : IN std_logic;
			D : IN std_logic;
			Reset : IN std_logic;
			Q : OUT std_logic
		);
	END COMPONENT;
BEGIN
	REGISTRADOR : FOR i IN 0 TO 15 GENERATE
	BEGIN
		dff : COMPONENT flip_flop_d PORT MAP(
			clock => clk,
			Reset => R,
			D => D_IN(i),
			Q => Q_OUT(i));
	END GENERATE REGISTRADOR;
END RTL;