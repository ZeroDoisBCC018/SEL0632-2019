----------------------------
--Joao Vitor Nascimento Villaca
--10724239
--
--Exercício 7.6.6
----------------------------

library ieee;
use ieee.std_logic_1164.all;

entity multiplicador is
	port (a : in  bit_vector (2 downto 0);
	      b : in  bit_vector (2 downto 0);
	      p : out bit_vector (5 downto 0);
end multiplicador;

architecture easy of multiplicador is
	signal aux : std_logic_vector (7 downto 0);
begin
	aux <= a * b;
	p <= aux;
end easy;
