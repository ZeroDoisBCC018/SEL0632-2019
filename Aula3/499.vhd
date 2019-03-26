----------------------------
--João Vitor Nascimento Villaca
--10724239
--
--Exercício 4.9.9
----------------------------
ENTITY prioridade IS
	PORT   (p0, p1, p2, p3  : IN  BIT;
		    int, x1,x0      : OUT BIT);
END prioridade;

ARCHITECTURE tabela OF prioridade IS
	SIGNAL entrada : BIT_VECTOR (0 TO 3);
	SIGNAL saida   : BIT_VECTOR (2 DOWNTO 0);
BEGIN
	abc: PROCESS(p0, p1, p2, p3)
	BEGIN
	entrada <= p0 & p1 & p2 & p3; -- bits concatenados
	x1  <= saida(0);
	x0  <= saida(1);	
	int <= saida(2);	

	CASE entrada IS      
		WHEN "1111"|"1110"|"1101"|"1100"|"1011"|"1010"|"1001"|"1000" => saida <= "001";          -- entrada = 1  -- circuito normal 4x4, importa apenas p0
		WHEN "0111"|"0110"|"0101"|"0100" => saida <= "011";                             	 -- entrada = 01 -- circuito normal 3x3, importa apenas p1 e p0 = 0
		WHEN "0011"|"0010" => saida <= "101";                                          	         -- entrada = 001 
		WHEN "0001" => saida <= "111";                                                	         -- entrada = 0001
		WHEN "0000" => saida <= "110";                                                           -- entrada = 0000
	END CASE;                                                     
END tabela;
