----------------------------
--Joao Vitor Nascimento Villaca
--10724239
--
--Exercício 5.6.6
----------------------------

entity c4e3 is
	port (ck, d  : in bit;
	      q1, q2 : out bit);
end c4e3;

architecture teste of c4e3 is
begin
	p_d1: process(ck)
	begin

	if ck'EVENT and ck = '1' then q1 <= d;
	end if;
	end process;

	p_d2: process(ck)
	begin

	if ck'EVENT and ck = '0' then q2 <=d;
	end if;
	end process;
end teste;

--ck |_______|_______/'''''''|'''''''\_______|_______/'''''''|'''''''\_______
--   |       |       |       |       |       |       |       |       |
--d  |_______/'''''''''''''''|'''''''|'''''''\_______________|_______________
--   |       |       |       |       |       |       |       |       |
--q1 |_______________/'''''''|'''''''\_______________/'''''''|'''''''\_______
--   |       |       |       |       |       |       |       |       |
--q2 /'''''''\_______|_______|_______/'''''''\_______________|_______________
--   |       |       |       |       |       |       |       |       |
--t  0ns     100ns   200ns   300ns   400ns   500ns   600ns   700ns   800ns
