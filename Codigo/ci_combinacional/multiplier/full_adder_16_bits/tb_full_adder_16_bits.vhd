LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_Somador4 IS
END tb_Somador4;

ARCHITECTURE teste OF tb_Somador4 IS

	COMPONENT Somador4 IS
		PORT (
			A_IN : IN std_logic_vector(15 DOWNTO 0);
			B_IN : IN std_logic_vector(15 DOWNTO 0);
			CIN : IN std_logic;
			S_OUT : OUT std_logic_vector(15 DOWNTO 0);
			COUT : OUT std_logic
		);
	END COMPONENT;

	SIGNAL a, b, s : std_logic_vector(3 DOWNTO 0);
	SIGNAL cin, cout : std_logic;

BEGIN
	instancia_Somador4 : Somador4 PORT MAP(A_IN => a, B_IN => b, CIN => cin, S_OUT => s, COUT => cout);
	entradas_process : PROCESS
	BEGIN
		a <= "0000000000000000";
		b <= "0000000000000000";
		cin <= '1';
		WAIT FOR 100 ns;
		a <= "01001100101100";
		b <= "10100011010001";
		cin <= '0';
		WAIT FOR 100 ns;
		a <= "01001100101100";
		b <= "10100011010001";
		cin <= '1';
		WAIT FOR 100 ns;
		a <= "1111000000000000";
		b <= "0000110000000000";
		cin <= '1';
		WAIT FOR 100 ns;
	END PROCESS;
END teste;