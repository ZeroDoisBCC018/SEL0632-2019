----------------------------
-- João Vitor Nascimento Villaça
-- 10724239
--Exercício 2.7.7
--Resolver os erros nas linhas do código em 2.7.4,
--corrigindo a precedência das operações com parênteses.
----------------------------

library IEEE;
use IEEE.std_logic_vector.all;

ENTITY errad_1 IS
	PORT(a, b, c, d : IN  BIT;
		 s          : OUT BIT_VECTOR (4 DOWNTO 0)); -- passou de "5 DOWNTO 0" para "4 DOWNTO 0" 
END errad_1;

ARCHITECTURE correto OF errad_1 IS
	BEGIN
		s(0) <= (a AND  b) OR (c AND d); -- utilizando parenteses para corrigir a precedencia

		s(1) <= (a NOR b) NOR c;         -- mesmo caso de s(0)

		s(2) <= (a AND  b) OR c;         -- mesmo caso de s(0) e s(1)

		s(3) <= NOT (a AND b) NAND c;    -- ja estava correta
		
		s(4) <= a XOR  b XOR c;          -- ja estava correta
END correto;
