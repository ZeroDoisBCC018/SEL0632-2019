----------------------------
--João Vitor Nascimento Villaca
--10724239
--
--Exercício 4.9.9
----------------------------

library ieee;
use ieee.std_logic_1164.all;

ENTITY deslocador IS
	PORT   (V        : IN  BIT_VECTOR  (3 DOWNTO 0);
		d0, d1   : IN  BIT;
		S        : OUT BIT_VECTOR  (3 DOWNTO 0));
END ENTITY deslocador;

ARCHITECTURE ifelse1 OF deslocador IS

	abc: PROCESS (V, d0, d1)
	BEGIN
	
	IF     d0 & d1 = "00" THEN S <= V(3) & V(2) & V(1) & V(0)
	ELSIF  d0 & d1 = "01" THEN S <= V(2) & V(1) & V(0) & V(3)
	ELSIF  d0 & d1 = "10" THEN S <= V(1) & V(0) & V(3) & V(2)
	ELSE   S <= V(0) & V(3) & V(2) & V(1);
	END IF;
	END PROCESS abc;
END ifelse1;

ARCHITECTURE casewhen1 OF deslocador IS

	SIGNAL cat : std_logic_vector (1 DOWNTO 0);

	abc: PROCESS (V, d0, d1)
	BEGIN
	
	cat <= d0 & d1;

	CASE cat IS
		WHEN "00"   => S <= V(3) & V(2) & V(1) & V(0);
		WHEN "01"   => S <= V(2) & V(1) & V(0) & V(3);
		WHEN "10"   => S <= V(1) & V(0) & V(3) & V(2);
		WHEN OTHERS => S <= V(0) & V(3) & V(2) & V(1);
	END CASE;
	
	END PROCESS abc;
END casewhen1;

ARCHITECTURE ifelse2 OF deslocador IS
	abc: PROCESS (V, d0, d1)
	BEGIN
	IF d0 = '0' THEN
		IF d1 = '0' THEN S <= V(3) & V(2) & V(1) & V(0);
		ELSE             S <= V(2) & V(1) & V(0) & V(3);
	ELSIF d1 = '0' THEN      S <= V(1) & V(0) & V(3) & V(2);
	ELSE                     S <= V(0) & V(3) & V(2) & V(1);
	END IF;		
	END PROCESS abc;
END ifelse2;

ARCHITECTURE casewhen2 OF deslocador IS

	abc: PROCESS (V, d0, d1)
	BEGIN

	CASE d0 IS
		WHEN '0' =>
			CASE d1 IS
				WHEN '0'    => S <= V(3) & V(2) & V(1) & V(0);
				WHEN OTHERS => S <= V(2) & V(1) & V(0) & V(3);
			END CASE;
		WHEN OTHERS =>
			CASE d1 IS
				WHEN '0'    => S <= V(1) & V(0) & V(3) & V(2);
				WHEN OTHERS => S <= V(0) & V(3) & V(2) & V(1);
			END CASE;
		END CASE;
	END PROCESS abc;
END casewhen2;

















