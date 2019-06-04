----------------------------
--João Vitor Nascimento Villaça
--10724239
--Lista 06
--Exercício I)
----------------------------

entity entradas is
	port (a, b       : in  bit;
	      s_ma, s_me : out bit);
end entradas;

architecture comparador of entradas is

function compara_ma (signal a, b : in bit) return boolean is
begin
	if a > b then return true;
	else return false;
end compara_ma;

function compara_me (signal a, b : in bit) return boolean is
begin
	if a < b then return true;
	else return false;
end compara_me;

begin
	s_ma <= compara_ma(a, b);
	s_me <= compara_me(a, b);
end comparador;
