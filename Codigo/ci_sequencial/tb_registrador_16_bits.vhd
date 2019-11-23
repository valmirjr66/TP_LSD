LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_registrador_16_bits IS
	GENERIC (
		DEFAULT_SIZE : INTEGER := 16
	);
END tb_registrador_16_bits;

ARCHITECTURE teste OF tb_registrador_16_bits IS
	COMPONENT registrador_16_bits IS
		PORT (
			D_IN : IN std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			Q_OUT : OUT std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
			clk : IN std_logic;
			R : IN std_logic
		);
	END COMPONENT;

	SIGNAL D_IN, Q_OUT : std_logic_vector(DEFAULT_SIZE - 1 DOWNTO 0);
	SIGNAL clk, r : std_logic := '0';
BEGIN
	instancia_registrador_16_bits : registrador_16_bits PORT MAP(D_IN => D_IN, Q_OUT => Q_OUT, R => r, clk => clk);
	clock_process : PROCESS
	BEGIN
		clk <= NOT(clk);
		WAIT FOR 3 ns;
	END PROCESS;

	entradas_process : PROCESS
	BEGIN
		D_IN <= "0000100110010110";
		WAIT FOR 20 ns;
		D_IN <= "0001101011100100";
		WAIT FOR 20 ns;
		D_IN <= "0001001001101000";
		WAIT FOR 20 ns;
		D_IN <= "0010100011010001";
		WAIT FOR 20 ns;
		D_IN <= "0001111000000000";
		WAIT FOR 20 ns;
		D_IN <= "0000110000000000";
		WAIT FOR 20 ns;
	END PROCESS;
END teste;