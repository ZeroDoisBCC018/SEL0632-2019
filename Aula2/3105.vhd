----------------------------
--João Vitor Nascimento Villaça
--10724239
--Exercício 3.10.5
----------------------------

ENTITY prioridade IS
	PORT   (p0, p1, p2, p3  : IN  BIT;
		    int, x1,x0      : OUT BIT);
END prioridade;

ARCHITECTURE tabela OF prioridade IS
	SIGNAL entrada : BIT_VECTOR (0 TO 3);
	SIGNAL saida   : BIT_VECTOR (2 DOWNTO 0);
BEGIN
	entrada <= p0 & p1 & p2 & p3; -- bits concatenados
	x1  <= saida(0);
	x0  <= saida(1);	
	int <= saida(2);	

	WITH entrada SELECT      
		saida <= "001" WHEN "1111"|"1110"|"1101"|"1100"|"1011"|"1010"|"1001"|"1000", -- entrada = 1  -- circuito normal 4x4, importa apenas p0
		"011" WHEN "0111"|"0110"|"0101"|"0100",                             	     -- entrada = 01 -- circuito normal 3x3, importa apenas p1 e p0 = 0
		"101" WHEN "0011"|"0010",                                          	         -- entrada = 001 
		"111" WHEN "0001",                                                	         -- entrada = 0001
		"110" WHEN "0000";                                                           -- entrada = 0000
END tabela;
