----------------------------
--João Vitor Nascimento Villaça
--10724239
--Exercício 3.10.9
----------------------------

ENTITY bcd IS 
	PORT (bcd    : IN  BIT_VECTOR(3 DOWNTO 0);  
	      sel    : IN  BIT_VECTOR(1 DOWNTO 0);  
	      dis    : OUT BIT_VECTOR(6 DOWNTO 0);  -- display 7 segmentos
	      mst    : OUT BIT_VECTOR(3 DOWNTO 0)); -- ativador dos displays
END bcd;

ARCHITECTURE conversor OF bcd IS
	BEGIN
	
	-- mst seleciona a partir do valor dos seletores quais displays serão ativados
	
	mst <=  "0111" WHEN sel= "00" ELSE 
		"1011" WHEN sel= "01" ELSE
		"1101" WHEN sel= "10" ELSE
		"1110";
         
	dis <=  "1111110" WHEN bcd= "0000" ELSE  -- 0
		"1100000" WHEN bcd= "0001" ELSE      -- 1 
		"1011010" WHEN bcd= "0010" ELSE      -- 2
		"1110011" WHEN bcd= "0011" ELSE      -- 3
		"1100101" WHEN bcd= "0100" ELSE      -- 4
		"0110111" WHEN bcd= "0101" ELSE      -- 5
		"0111111" WHEN bcd= "0110" ELSE      -- 6
		"1100010" WHEN bcd= "0111" ELSE      -- 7
		"1111111" WHEN bcd= "1000" ELSE      -- 8
		"1110111" WHEN bcd= "1001" ELSE      -- 9
		"0000000";
END conversor;
