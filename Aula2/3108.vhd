----------------------------
--João Vitor Nascimento Villaça
--10724239
--Exercício 3.10.8
----------------------------

ENTITY bcd IS 
	PORT (bcd    : IN  BIT_VECTOR(3 DOWNTO 0);    
	      dis    : OUT BIT_VECTOR(6 DOWNTO 0); -- display de 7 segmentos
END bcd;

ARCHITECTURE display7 OF bcd IS
	BEGIN
         
	dis <=  "1111110" WHEN bcd = "0000" ELSE  -- 0
		"1100000" WHEN bcd = "0001" ELSE      -- 1 
		"1011010" WHEN bcd = "0010" ELSE      -- 2
		"1110011" WHEN bcd = "0011" ELSE      -- 3
		"1100101" WHEN bcd = "0100" ELSE      -- 4
		"0110111" WHEN bcd = "0101" ELSE      -- 5
		"0111111" WHEN bcd = "0110" ELSE      -- 6
		"1100010" WHEN bcd = "0111" ELSE      -- 7
		"1111111" WHEN bcd = "1000" ELSE      -- 8
		"1110111" WHEN bcd = "1001" ELSE      -- 9
		"0000000";
END display7;