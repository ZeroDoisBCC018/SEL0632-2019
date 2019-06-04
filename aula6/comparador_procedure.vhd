----------------------------
--João Vitor Nascimento Villaça
--10724239
--Lista 06
--Exercício II)
----------------------------

entity entradas is
	port (a, b       : in  bit;
	      s_ma, s_me : out bit);
end entradas;

architecture comparador_procedure of entradas is

procedure comparar (a, b       : in  bit;
		    s_ma, s_me : out bit) is
begin
	with a > b select s_ma
		'1' when true,
		'0' when others;
	with a < b select s_me
		'1' when true,
		'0' when others;
end comparar;

begin
	comparar(a, b, s_ma, s_me);
end comparador_procedure;
