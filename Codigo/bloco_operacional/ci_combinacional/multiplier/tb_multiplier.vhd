LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY tb_multiplier IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);
END tb_multiplier;

ARCHITECTURE teste OF tb_multiplier IS
	COMPONENT multiplier IS
		PORT (
			a : IN unsigned(DEFAULT_SIZE - 1 DOWNTO 0);
			b : IN unsigned(DEFAULT_SIZE - 1 DOWNTO 0);
			s : OUT unsigned(DEFAULT_SIZE - 1 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL a, b : unsigned(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL s : unsigned(DEFAULT_SIZE - 1 DOWNTO 0);

BEGIN
	instancia_multiplier : multiplier PORT MAP(a => a, b => b, s => s);
	entradas_process : PROCESS
	BEGIN
		a <= "0000000000000000";
		b <= "0000000011111111";
		WAIT FOR 20 ns;
		a <= "0100110010110000";
		b <= "0010001101000100";
		WAIT FOR 20 ns;
		a <= "0100110001011000";
		b <= "0010100011010001";
		WAIT FOR 20 ns;
		a <= "0111111111100001";
		b <= "0110110000000000";
		WAIT FOR 20 ns;
	END PROCESS;
END teste;