LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY full_adder_32_bits IS
	GENERIC (
		LONG_SIZE : INTEGER := 32
	);

	PORT (
		A_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
		B_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
		CIN : IN std_logic;
		S_OUT : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
		COUT : OUT std_logic
	);
END full_adder_32_bits;

ARCHITECTURE RTL OF full_adder_32_bits IS
	COMPONENT full_adder IS
		PORT (
			Cin : IN std_logic;
			x : IN std_logic;
			y : IN std_logic;
			s : OUT std_logic;
			Cout : OUT std_logic
		);
	END COMPONENT;

	SIGNAL cout1, cout2, cout3, cout4, cout5, cout6, cout7, cout8,
	cout9, cout10, cout11, cout12, cout13, cout14, cout15, cout16,
	cout17, cout18, cout19, cout20, cout21, cout22, cout23, cout24,
	cout25, cout26, cout27, cout28, cout29, cout30, cout31 : std_logic;
BEGIN
	FA1 : full_adder PORT MAP(
		Cin => CIN,
		x => A_IN(0),
		y => B_IN(0),
		s => S_OUT(0),
		Cout => cout1);

	 FA2 : full_adder PORT MAP(
	 	Cin => cout1,
	 	x => A_IN(1),
	 	y => B_IN(1),
	 	s => S_OUT(1),
	 	Cout => cout2);

	 FA3 : full_adder PORT MAP(
	 	Cin => cout2,
	 	x => A_IN(2),
	 	y => B_IN(2),
	 	s => S_OUT(2),
	 	Cout => cout3);

	 FA4 : full_adder PORT MAP(
	 	Cin => cout3,
	 	x => A_IN(3),
	 	y => B_IN(3),
	 	s => S_OUT(3),
	 	Cout => cout4);

	 FA5 : full_adder PORT MAP(
	 	Cin => cout4,
	 	x => A_IN(4),
	 	y => B_IN(4),
	 	s => S_OUT(4),
	 	Cout => cout5);

	 FA6 : full_adder PORT MAP(
	 	Cin => cout5,
	 	x => A_IN(5),
	 	y => B_IN(5),
	 	s => S_OUT(5),
	 	Cout => cout6);

	 FA7 : full_adder PORT MAP(
	 	Cin => cout6,
	 	x => A_IN(6),
	 	y => B_IN(6),
	 	s => S_OUT(6),
	 	Cout => cout7);

	 FA8 : full_adder PORT MAP(
	 	Cin => cout7,
	 	x => A_IN(7),
	 	y => B_IN(7),
	 	s => S_OUT(7),
	 	Cout => cout8);

	 FA9 : full_adder PORT MAP(
	 	Cin => cout8,
	 	x => A_IN(8),
	 	y => B_IN(8),
	 	s => S_OUT(8),
	 	Cout => cout9);

	 FA10 : full_adder PORT MAP(
	 	Cin => cout9,
	 	x => A_IN(9),
	 	y => B_IN(9),
	 	s => S_OUT(9),
	 	Cout => cout10);

	 FA11 : full_adder PORT MAP(
	 	Cin => cout10,
	 	x => A_IN(10),
	 	y => B_IN(10),
	 	s => S_OUT(10),
	 	Cout => cout11);

	 FA12 : full_adder PORT MAP(
	 	Cin => cout11,
	 	x => A_IN(11),
	 	y => B_IN(11),
	 	s => S_OUT(11),
	 	Cout => cout12);

	 FA13 : full_adder PORT MAP(
	 	Cin => cout12,
	 	x => A_IN(12),
	 	y => B_IN(12),
	 	s => S_OUT(12),
	 	Cout => cout13);

	 FA14 : full_adder PORT MAP(
	 	Cin => cout13,
	 	x => A_IN(13),
	 	y => B_IN(13),
	 	s => S_OUT(13),
	 	Cout => cout14);

	 FA15 : full_adder PORT MAP(
	 	Cin => cout14,
	 	x => A_IN(14),
	 	y => B_IN(14),
	 	s => S_OUT(14),
	 	Cout => cout15);

	 FA16 : full_adder PORT MAP(
	 	Cin => cout15,
	 	x => A_IN(15),
	 	y => B_IN(15),
	 	s => S_OUT(15),
	 	Cout => cout16);

	 FA17 : full_adder PORT MAP(
	 	Cin => cout16,
	 	x => A_IN(16),
	 	y => B_IN(16),
	 	s => S_OUT(16),
	 	Cout => cout17);

	 FA18 : full_adder PORT MAP(
	 	Cin => cout17,
	 	x => A_IN(17),
	 	y => B_IN(17),
	 	s => S_OUT(17),
	 	Cout => cout18);

	 FA19 : full_adder PORT MAP(
	 	Cin => cout18,
	 	x => A_IN(18),
	 	y => B_IN(18),
	 	s => S_OUT(18),
	 	Cout => cout19);

	 FA20 : full_adder PORT MAP(
	 	Cin => cout19,
	 	x => A_IN(19),
	 	y => B_IN(19),
	 	s => S_OUT(19),
	 	Cout => cout20);

	 FA21 : full_adder PORT MAP(
	 	Cin => cout20,
	 	x => A_IN(20),
	 	y => B_IN(20),
	 	s => S_OUT(20),
	 	Cout => cout21);

	 FA22 : full_adder PORT MAP(
	 	Cin => cout21,
	 	x => A_IN(21),
	 	y => B_IN(21),
	 	s => S_OUT(21),
	 	Cout => cout22);

	 FA23 : full_adder PORT MAP(
	 	Cin => cout22,
	 	x => A_IN(22),
	 	y => B_IN(22),
	 	s => S_OUT(22),
	 	Cout => cout23);

	 FA24 : full_adder PORT MAP(
	 	Cin => cout23,
	 	x => A_IN(23),
	 	y => B_IN(23),
	 	s => S_OUT(23),
	 	Cout => cout24);

	 FA25 : full_adder PORT MAP(
	 	Cin => cout24,
	 	x => A_IN(24),
	 	y => B_IN(24),
	 	s => S_OUT(24),
	 	Cout => cout25);

	 FA26 : full_adder PORT MAP(
	 	Cin => cout25,
	 	x => A_IN(25),
	 	y => B_IN(25),
	 	s => S_OUT(25),
	 	Cout => cout26);

	 FA27 : full_adder PORT MAP(
	 	Cin => cout26,
	 	x => A_IN(26),
	 	y => B_IN(26),
	 	s => S_OUT(26),
	 	Cout => cout27);

	 FA28 : full_adder PORT MAP(
	 	Cin => cout27,
	 	x => A_IN(27),
	 	y => B_IN(27),
	 	s => S_OUT(27),
	 	Cout => cout28);

	 FA29 : full_adder PORT MAP(
	 	Cin => cout28,
	 	x => A_IN(28),
	 	y => B_IN(28),
	 	s => S_OUT(28),
	 	Cout => cout29);

	 FA30 : full_adder PORT MAP(
	 	Cin => cout29,
	 	x => A_IN(29),
	 	y => B_IN(29),
	 	s => S_OUT(29),
	 	Cout => cout30);

	 FA31 : full_adder PORT MAP(
	 	Cin => cout30,
	 	x => A_IN(30),
	 	y => B_IN(30),
	 	s => S_OUT(30),
	 	Cout => cout31);

	FA32 : full_adder PORT MAP(
		Cin => cout31,
		x => A_IN(31),
		y => B_IN(31),
		s => S_OUT(31),
		Cout => COUT);
END RTL;