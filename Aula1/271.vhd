----------------------------
-- João Vitor Nascimento Villaça
-- 10724239
--Exercício 2.7.1
--Resolver as expressões lógicas dadas.
----------------------------

ENTITY portas IS
	PORT (a, b, c, d  : IN     BIT;
		  s1          : BUFFER BIT;      -- como 's1' vai ser lido internamente, declarei como buffer
		  s2, s3, s4  : OUT    BIT);                     
END portas;

ARCHITECTURE resultado OF portas IS
	BEGIN 
		s1  <= a OR NOT b;              
		s2  <= a OR (NOT b AND c) OR d; 
		s3  <= s1 AND (c OR d);         
		s4  <= s1 AND NOT(c OR (a AND d));
END resultado;
