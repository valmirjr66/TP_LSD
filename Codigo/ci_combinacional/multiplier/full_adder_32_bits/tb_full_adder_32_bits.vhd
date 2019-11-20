LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_full_adder_32_bits IS
END tb_full_adder_32_bits;

ARCHITECTURE teste OF tb_full_adder_32_bits IS
	GENERIC (
		LONG_SIZE : INTEGER := 16;
	);

	COMPONENT full_adder_32_bits IS
		PORT (
			A_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			B_IN : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			CIN : IN std_logic;
			S_OUT : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			COUT : OUT std_logic
		);
	END COMPONENT;

	SIGNAL a, b, s : std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
	SIGNAL cin, cout : std_logic;

BEGIN
	instancia_Somador4 : Somador4 PORT MAP(A_IN => a, B_IN => b, CIN => cin, S_OUT => s, COUT => cout);
	entradas_process : PROCESS
	BEGIN
		a <= "00000000000000000000000000000000";
		b <= "00000000000000000000000000000000";
		cin <= '1';
		WAIT FOR 100 ns;
		a <= "010011001011000000000000000000";
		b <= "000000000000000010100011010001";
		cin <= '0';
		WAIT FOR 100 ns;
		a <= "010011001011000000000000000000";
		b <= "000000000000000010100011010001";
		cin <= '1';
		WAIT FOR 100 ns;
		a <= "11110000000000000000000000000000";
		b <= "00000000000000000000110000000000";
		cin <= '1';
		WAIT FOR 100 ns;
	END PROCESS;
END teste;