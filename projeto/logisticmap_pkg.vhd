library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package logisticmap_pkg is

	component MUX is	--Altere conforme o seu multiplexador
		generic(
			bussize	: integer := 20
			);
		port(
			A, B	: in	std_logic_vector(bussize-1 downto 0);
			sel 	: in	std_logic;
			C		: out	std_logic_vector(bussize-1 downto 0)
			);
	end component;
	
	component sub is	--Altere conforme o seu Subtrator
		generic(
			bussize	: integer := 20
			);
		port(
			x, y	: in	std_logic_vector(bussize-1 downto 0);
			Te 		: in std_logic;
			z		: out	std_logic_vector(bussize-1 downto 0);
			Ts : out std_logic
			);
	end component;

	component mult is	--Altere conforme o seu Multiplicador
		generic(
			bussize	: integer := 20
			);
		port(
			a, b	: in	std_logic_vector(bussize-1 downto 0);
			p		: out	std_logic_vector(bussize-1 downto 0)
			);
	end component;
	
	-- Acrescente demais componentes que julgar necessario
	
	--procedure dff 		--Altere conforme o seu FF Tipo-D
		--(signal clk : in std_logic; clr : in std_logic; signal d : in std_logic_vector; signal q : out std_logic_vector);
	
	function desloca2		--Altere conforme o seu Deslocador para a esquerda (<<2)
		(signal z : in std_logic_vector) return std_logic_vector;
	
	procedure savedaata
		(signal clock, clear : IN  std_logic;
		 signal d            : IN std_logic_vector;
         signal q            : OUT std_logic_vector);
	
end logisticmap_pkg;

package body logisticmap_pkg is

	--procedure dff		--Altere conforme o seu FF Tipo-D
		--(signal clk : in std_logic; clr : in std_logic; signal d : in std_logic_vector; signal q : out std_logic_vector) is
	--Inclua sua implementacao do PROCEDURE do FF Tipo-D
	--end procedure dff;
	
	function desloca2		--Altere conforme o seu Deslocador para a esquerda (<<2)
		(signal z : in std_logic_vector) return std_logic_vector is
		variable bussize: integer := 20;
		variable a: std_logic_vector ((bussize-1) downto 0);
	begin 
		a := z(bussize-3 DOWNTO 0) & "00";
    	return a;
	--Inclua sua implementacao da FUNCTION do Deslocador para a esquerda (<<2)
	end function desloca2;

	PROCEDURE savedata (clock, clear : IN  std_logic;
						d            : IN std_logic_vector;
                        q            : OUT std_logic_vector) IS
    variable bussize : integer := 20;
        BEGIN
            
            IF rising_edge(clock) THEN
                        q <= d;
			ELSE
				FOR i IN bussize-1 DOWNTO 0 LOOP
					q(i) <= '0';
				END LOOP
            END IF;            
    END savedata;
end logisticmap_pkg;

	

