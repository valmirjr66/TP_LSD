LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY multiplier IS
	GENERIC (
		SHORT_SIZE : INTEGER := 16;
		LONG_SIZE : INTEGER := 32
	);

	PORT (
		a : IN std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
		b : IN std_logic_vector(SHORT_SIZE - 1 DOWNTO 0);
		s : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0)
	);
END multiplier;

ARCHITECTURE RTL OF multiplier IS
	COMPONENT full_adder_32_bits IS
		PORT (
			Cin : IN std_logic;
			x : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			y : IN std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			s : OUT std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
			Cout : OUT std_logic
		);
	END COMPONENT;

	SIGNAL b_long_size : std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
	SIGNAL proto_b_long_size : std_logic_vector(LONG_SIZE DOWNTO 0);
	SIGNAL result : std_logic_vector(LONG_SIZE - 1 DOWNTO 0);
BEGIN
	PROCESS (a, b)
	BEGIN
		result <= (a'high DOWNTO 0 => a, OTHERS => '0');
		b_long_size <= (b'high DOWNTO 0 => b, OTHERS => '0');
		proto_b_long_size <= (b'high DOWNTO 0 => b, OTHERS => '0');

		FOR I IN 0 TO SHORT_SIZE - 1 GENERATE
			proto_b_long_size <= b_long_size & '0';
			b_long_size <= proto_b_long_size(LONG_SIZE - 1 DOWNTO 0);

			IF b(I) = '1'
				parcial_result : full_adder_32_bits PORT MAP(
					x => result,
					y => b_long_size,
					s => result,
					Cout => result);
			END IF;
		END LOOP;
	END PROCESS;
	s <= result;
END RTL;