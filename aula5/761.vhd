----------------------------
--Joao Vitor Nascimento Villaca
--10724239
--
--Exercício 7.6.1
----------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp is
	generic (n    :     natural);
	port	(a    : in  integer range n downto 0;
		 b    : in  integer range n downto 0;
                 s    : out bit_vector    1 downto 0);
end comp;

architecture comparador of comp is

	signal s_ma : std_logic;
	signal s_me : std_logic;

	component celula
	port (  e_ma : in std_logic;
		e_me : in std_logic;
		ai   : in std_logic;
		bi   : in std_logic);
	end component;
begin

	s <= s_ma & s_me;
	
	s_ma <= '1' when a < b else
		'0' when b < a else
		'0' when a = b;
	
	s_me <= '0' when a < b else
		'1' when b < a else
		'0' when a = b;

	for i in n downto 0 generate
		port map (s_ma, s_me, a(i), b(i));
	end generate;

end comparador;






















