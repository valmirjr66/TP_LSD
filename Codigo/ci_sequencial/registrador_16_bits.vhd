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
	reg1 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(0),
		Q => Q_OUT(0));

	reg2 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(1),
		Q => Q_OUT(1));

	reg3 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(2),
		Q => Q_OUT(2));

	reg4 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(3),
		Q => Q_OUT(3));

	reg5 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(4),
		Q => Q_OUT(4));

	reg6 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(5),
		Q => Q_OUT(5));

	reg7 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(6),
		Q => Q_OUT(6));

	reg8 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(7),
		Q => Q_OUT(7));

	reg9 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(8),
		Q => Q_OUT(8));

	reg10 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(9),
		Q => Q_OUT(9));

	reg11 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(10),
		Q => Q_OUT(10));

	reg12 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(11),
		Q => Q_OUT(11));

	reg13 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(13),
		Q => Q_OUT(13));

	reg14 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(13),
		Q => Q_OUT(13));

	reg15 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(14),
		Q => Q_OUT(14));

	reg16 : COMPONENT flip_flop_d PORT MAP(
		clock => clk,
		Reset => R,
		D => D_IN(15),
		Q => Q_OUT(15));
END RTL;