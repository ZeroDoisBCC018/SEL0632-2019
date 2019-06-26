library ieee;
use ieee.std_logic_1164.all;

-- MULTIPLICADOR
entity somador_1b is
	port	(in1, in2, incarry	: in  std_logic;
			 out1, outcarry		: out std_logic);
end somador_1b;

architecture rts of somador_1b is
begin
	out1 <= in1 xor in2 xor incarry;
	outcarry <= ((in1 and in2) or (in1 and incarry) or (in2 and incarry));
end rts;

library ieee;
use ieee.std_logic_1164.all;

entity multiplicador is
	generic (bussize : integer := 20);
	port	(a, b : in std_logic_vector(bussize-1 downto 0);
			 saida	  : out std_logic_vector(bussize-1 downto 0));
end multiplicador;

architecture mult of multiplicador is
	constant n	: integer := bussize-1;
	component somador_1b
		port	(in1, in2, incarry : in std_logic;	out1, outcarry : out std_logic);
	end component;
	type a_signal is array (0 to bussize-1) of std_logic_vector(bussize-2 downto 0);
	type a_pass is array (0 to bussize-1) of std_logic_vector(bussize-1 downto 0);
	signal carry : a_signal;
	signal result  : a_signal;
	signal p		: std_logic_vector(bussize-1 downto 0);
	signal test: a_pass;
begin

	
	genpass: for i in 1 to n generate
		genpass1: for j in 1 to n generate
			test(i)(j) <= a(i) and b(j);
		end generate genpass1;
	end generate genpass;
	
	c00: somador_1b port map (test(0)(1), test(1)(0), '0', result(0)(0), carry(0)(0));
	gen0: for j in 1 to n-2 generate
		c0x: somador_1b port map (test(j)(1), test(j+1)(0), '0', result(0)(j), carry(0)(j));
	end generate gen0;
	c0n: somador_1b port map (test(n-1)(1), test(n)(0), '0', result(0)(n-1), carry(0)(n-1));
	
	gen1: for i in 1 to n-1 generate
		cy0: somador_1b port map (test(0)(i+1), carry(i-1)(0), result(i-1)(1), result(i)(0), carry(i)(0));
		gen2: for j in 1 to n-2 generate
			cyx: somador_1b port map (test(j)(i+1), carry(i-1)(j), result(i-1)(j+1), result(i)(j), carry(i)(j));
		end generate gen2;
		cyn: somador_1b port map (test(n-1)(i+1), carry(i-1)(n-1), test(n)(i), result(i)(n-1), carry(i)(n-1));
	end generate gen1;
	
	cm0: somador_1b port map ('0', carry(n-1)(0), result(n-1)(1), result(n)(0), carry(n)(0));
	gen3: for j in 1 to n-2 generate
		cmx: somador_1b port map (carry(n)(j-1), carry(n-1)(j), result(n-1)(j+1), result(n)(j), carry(n)(j));
	end generate gen3;
	cmn: somador_1b port map (carry(n)(n-2), carry(n-1)(n-1), test(n)(n), result(n)(n-1), carry(n)(n-1));

	p <= carry(n)(n-1) & result(n);
	
	saida <= p;
	
end mult;

library ieee;
use ieee.std_logic_1164.all;
-- MUTIPLEXADOR
ENTITY MUX IS
        GENERIC (bussize : INTEGER := 20);
        PORT    (A, B : IN  std_logic_vector (bussize - 1 DOWNTO 0);
                 sel  : IN  std_logic;
                 C    : OUT std_logic_vector (bussize - 1 DOWNTO 0));
END MUX;

ARCHITECTURE behavioral OF MUX IS
BEGIN
        WITH sel SELECT C <=
                A WHEN '0',
		B WHEN OTHERS;
END behavioral;

library ieee;
use ieee.std_logic_1164.all;
-- SUBTRATOR
entity sub_1b is 
	port (in1, in2, Tin : in std_logic;
			S, Tout : out std_logic);
end sub_1b;

architecture  rts of sub_1b is 
begin
	S <= in1 xor in2 xor Tin;
	Tout <= (not in1 and in2) or (not in1 and Tin) or (in2 and Tin);
end rts;	

library ieee;
use ieee.std_logic_1164.all;
entity sub is 
	generic (bussize : integer := 20);
	port ( x, y : in std_logic_vector ((bussize-1) downto 0);
			 Te : in std_logic;
			 z : out std_logic_vector ((bussize-1) downto 0);
			 Ts : out std_logic );	
end sub;

architecture rts of sub is

	component sub_1b
		port (in1, in2, Tin : in std_logic;  S, Tout : out std_logic);
	end component;
	signal v : std_logic_vector ((bussize) downto 0);
begin
		v(0) <= Te;
		Ts <= v(bussize);
	gen: for i in 0 to bussize-1 generate
		celula: sub_1b port map( x(i), y(i), v(i), z(i), v(i+1));
	end generate gen;
end rts;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
library work;
use work.logisticmap_pkg.all;

-- Integracao do mapa logistico
entity logisticmap is
	generic(
		bussize	: integer := 20
		);
	port(
		clk, clr	: in	std_logic;
		start		: in	std_logic;
		x0		: in	std_logic_vector(bussize-1 downto 0);
		xnout		: out std_logic_vector(bussize-1 downto 0)
		);
end logisticmap;

architecture estrutura of logisticmap is
    
	signal x1, x2, x3, x4 : std_logic_vector(bussize-1 downto 0);

	signal x5 : std_logic_vector(bussize-1 downto 0);
begin
	
	y0: entity work.MUX port map(x5, x0, start, x1);
	savedata(clk, clr, x1, x2);
	y2: entity work.multiplicador port map(x2, x2, x3);
	y3: entity work.sub port map(x3, x2, '0', x4);
	x5 <= desloca2 (x4);
	xnout <= desloca2 (x4);

	writefile: process is
		--type unsigned_file_type is file of unsigned;
		file write_file_my_mult: text open write_mode is "GrupoXX_tb.txt";
		variable linha: line;
	begin
		def: for i in 1 to 10 loop
			wait on x5;
			write(linha, now);
			write(linha, ht);
			write(linha, string'("x1 = "));
			write(linha, To_bitvector(x1));
			write(linha, ht);
			write(linha, string'("x2 = "));
			write(linha, To_bitvector(x2));
			write(linha, ht);
			write(linha, string'("x3 = "));
			write(linha, To_bitvector(x3));
			write(linha, ht);
			write(linha, string'("x4 = "));
			write(linha, To_bitvector(x4));
			write(linha, ht);
			write(linha, string'("x5 = "));
			write(linha, To_bitvector(x5));
			write(linha, ht);
			writeline(write_file_my_mult,linha);
		end loop;
	end process;
	
end architecture estrutura;