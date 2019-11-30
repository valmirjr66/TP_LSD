LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bloco_controle IS
	PORT (
		CLOCK : IN std_logic;
		RESET : IN std_logic;
		R, S, M, Da, Db, La, Lb : IN std_logic;
		s1, s2, s3, s4 : OUT std_logic;
		load, clear, shift, load_mult : OUT std_logic
	);
END bloco_controle;

ARCHITECTURE arch OF bloco_controle IS
	TYPE state_type IS (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11);
	SIGNAL A_S : state_type := E0;
	SIGNAL N_S : state_type;
BEGIN
	sync_proc : PROCESS (CLOCK, N_S, RESET, A_S)
	BEGIN
		IF (RESET = '1') THEN
			A_S <= E0;
		ELSIF (rising_edge(CLOCK)) THEN
			A_S <= N_S;
		ELSE
			A_S <= A_S;
		END IF;
	END PROCESS sync_proc;

	fsm_proc : PROCESS (R, S, M, Da, Db, La, Lb, A_S)
	BEGIN
		-- Bloco principal
		CASE A_S IS
			WHEN E0 =>
				N_S <= E9;
			WHEN E1 =>
				N_S <= E5;
			WHEN E2 =>
				N_S <= E5;
			WHEN E3 =>
				N_S <= E7;
			WHEN E4 =>
				N_S <= E7;
			WHEN E5 =>
				N_S <= E8;
			WHEN E6 =>
				N_S <= E5;
			WHEN E7 =>
				N_S <= E6;
			WHEN E8 =>
				IF ((R AND NOT(La OR Lb)) = '1') THEN
					N_S <= E0;
				ELSIF ((La AND NOT(R OR Lb)) = '1') THEN
					N_S <= E10;
				ELSIF ((Lb AND NOT(R OR La)) = '1') THEN
					N_S <= E11;
				ELSE
					N_S <= E8;
				END IF;
			WHEN E9 =>
				IF ((S AND NOT(M OR Da OR Db)) = '1') THEN
					N_S <= E1;
				ELSIF ((M AND NOT(S OR Da OR Db)) = '1') THEN
					N_S <= E2;
				ELSIF ((Da AND NOT(M OR S OR Db)) = '1') THEN
					N_S <= E3;
				ELSIF ((Db AND NOT(M OR S OR Da)) = '1') THEN
					N_S <= E4;
				ELSE
					N_S <= E9;
				END IF;
			WHEN E10 =>
				N_S <= E9;
			WHEN E11 =>
				N_S <= E9;
		END CASE;
		-- Fim do bloco principal
	END PROCESS fsm_proc;

	outputs_proc : PROCESS (A_S)
	BEGIN
		CASE A_S IS
			WHEN E0 =>
				s1 <= '0';
				s2 <= '0';
				s3 <= '0';
				s4 <= '0';
				clear <= '1';
				shift <= '0';
				load <= '0';
				load_mult <= '0';
			WHEN E1 =>
				s1 <= '0';
				s2 <= '0';
				--s3 <= s3;
				--s4 <= s4;
				clear <= '0';
				shift <= '0';
				load <= '0';
				load_mult <= '0';
			WHEN E2 =>
				s1 <= '0';
				s2 <= '1';
				--s3 <= s3;
				--s4 <= s4;
				clear <= '0';
				shift <= '0';
				load <= '0';
				load_mult <= '0';
			WHEN E3 =>
				s1 <= '1';
				s2 <= '0';
				--s3 <= s3;
				--s4 <= s4;
				clear <= '0';
				shift <= '0';
				load <= '0';
				load_mult <= '0';
			WHEN E4 =>
				s1 <= '1';
				s2 <= '1';
				--s3 <= s3;
				--s4 <= s4;
				clear <= '0';
				shift <= '0';
				load <= '0';
				load_mult <= '0';
			WHEN E5 =>
				--s1 <= s1;
				--s2 <= s2;
				--s3 <= s3;
				--s4 <= s4;
				clear <= '0';
				shift <= '0';
				load <= '1';
				load_mult <= '0';
			WHEN E6 =>
				--s1 <= s1;
				--s2 <= s2;
				--s3 <= s3;
				--s4 <= s4;
				clear <= '0';
				load <= '0';
				load_mult <= '0';
				shift <= '1';
			WHEN E7 =>
				--s1 <= s1;
				--s2 <= s2;
				----s3 <= s3;
				--s4 <= s4;
				clear <= '0';
				load <= '0';
				shift <= '0';
				load_mult <= '1';
			WHEN E8 =>
				s1 <= '0';
				s2 <= '0';
				--s3 <= s3;
				--s4 <= s4;
				clear <= '0';
				shift <= '0';
				load <= '0';
				load_mult <= '0';
			WHEN E9 =>
				s1 <= '0';
				s2 <= '0';
				--s3 <= s3;
				--s4 <= s4;
				clear <= '0';
				shift <= '0';
				load <= '0';
				load_mult <= '0';
			WHEN E10 =>
				s1 <= '0';
				s2 <= '0';
				s3 <= '0';
				s4 <= '1';
				clear <= '0';
				shift <= '0';
				load <= '0';
				load_mult <= '0';
			WHEN E11 =>
				s1 <= '0';
				s2 <= '0';
				s3 <= '1';
				s4 <= '0';
				clear <= '0';
				shift <= '0';
				load <= '0';
				load_mult <= '0';
		END CASE;
	END PROCESS outputs_proc;
END arch;