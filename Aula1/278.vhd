----------------------------
-- João Vitor Nascimento Villaça
-- 10724239
--Exercício 2.7.7
--Resolver os erros nas linhas do código em 2.7.5.
----------------------------

library IEEE;
use IEEE.std_logic_vector.all;

ENTITY errad_2 IS
	PORT(a, b, c, d       : IN  BIT;
		 r, s, t, u, v, x : OUT BIT_VECTOR (5 DOWNTO 0)); 
END errad_2;

ARCHITECTURE correto OF errad_2 IS
	BEGIN
		r(0 to 2) <= (a AND  b) AND c; 

		s <= (((a AND b) AND c) AND d) AND "010"; -- utilizando parenteses para corrigir a precedencia

		t(0 to 2) AND u(3 to 5) <= "101101";      -- ja estava correto, apesar de output ser sempre 0
		
		v <= a AND (OTHERS => '0');               -- ja estava correta, apenas troquei "->" por "=>"
		
		x <= a AND (OTHERS => '0');               -- operacao and 1 desnecessaria
END correto;
