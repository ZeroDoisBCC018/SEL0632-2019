----------------------------
--João Vitor Nascimento Villaca
--10724239
--
--Exercício 4.9.4
----------------------------
entity mux is
	port (i0, i1, i2, i3 : in  bit;  -- entradas
	      s0, s1         : in  bit;  -- selecao
	      ot             : out bit); -- saida
end mux;

architecture errada of mux is
begin
	abc: process (i0, i1, i2, i3) -- sinais s0 e s1 removidos da lista
	begin
		if    s1 & s0 = "00" then ot <= i0;
		elsif s1 & s0 = "01" then ot <= i1;
		elsif s1 & s0 = "10" then ot <= i2;
		else                      ot <= i3;
		end if;
	end process abc;
end errada;

-- sem os bits s0 e s1 na lista de sensibilidade a arquitetura
-- nao sera ativada com a mudanca da selecao, logo o circuito
-- nao funciona pois os condicionais do processo dependem de s1 e s0
--
-- o processo seria ativado com apenas um comportamento constante
