----------------------------
--Joao Vitor Nascimento Villaca
--10724239
--
--Exercício 7.6.9
----------------------------

library ieee;
use ieee.std_logic_1164.all;

entity blocos is
	port (de     : in  bit_vector (3 downto 0);
	      end_de : in  bit;
	      sgm    : out bit;
	      mst    : out bit_vector (3 downto 0)
	      clk    : in  bit);
end blocos;

architecture compnts of blocos is

	signal regs     : bit_vector (3 downto 0);
	signal clockaux : std_logic;

	component modulo1
		port (qs     : out std_logic_vector (3 downto 0);
		      end_qs : in  std_logic);
	end modulo1;

	component modulo2
		port (clock   : in  std_logic;
		      end_qs_ : out std_logic);
	end modulo2;
begin
	transfer: process(clk, de, end_de)
	begin

	regs <= de;
	clockaux <= clk;
        
        prox_ : modulo2 port map (clockaux, clockaux);
        prox  : modulo1 port map (regs, clockaux);
        
        if sgm = '0' then
                mst = "0000";
        else
                mst <= regs;
        end if;
        
        end process transfer;
end compnts;
        
        






		
