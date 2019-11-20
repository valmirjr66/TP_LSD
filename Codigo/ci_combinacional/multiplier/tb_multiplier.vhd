LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_multiplier IS
	GENERIC (
		SHORT_SIZE : INTEGER := 16;
		LONG_SIZE : INTEGER := 32
	);
END tb_multiplier;

ARCHITECTURE teste OF tb_multiplier IS
	COMPONENT multiplier IS
		PORT (
			a : IN std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
			b : IN std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
			s : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL a, b : std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
	SIGNAL s : std_logic_vector(LONG_SIZE - 1 DOWNTO 0);

BEGIN
	instancia_multiplier : multiplier PORT MAP(a => a, b => b, s => s);
	entradas_process : PROCESS
	BEGIN
		a <= "0000000000000000";
		b <= "0000000011111111";
		WAIT FOR 20 ns;
		a <= "0100110010110000";
		b <= "1010001101000100";
		WAIT FOR 20 ns;
		a <= "0100110001011000";
		b <= "0010100011010001";
		WAIT FOR 20 ns;
		a <= "1111111111100001";
		b <= "0110110000000000";
		WAIT FOR 20 ns;
	END PROCESS;
END teste;