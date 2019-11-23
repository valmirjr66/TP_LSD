LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY full_adder_16_bits IS
	GENERIC (
		LONG_SIZE : INTEGER := 16
	);

	PORT (
		A_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
		B_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
		CIN : IN std_logic;
		S_OUT : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
		COUT : OUT std_logic
	);
END full_adder_16_bits;

ARCHITECTURE RTL OF full_adder_16_bits IS
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
	cout9, cout10, cout11, cout12, cout13, cout14, cout15 : std_logic;
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
	 	Cout => COUT);
END RTL;