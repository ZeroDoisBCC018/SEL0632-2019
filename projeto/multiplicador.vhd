library ieee;
use ieee.std_logic_1164.all;

-- MULTIPLICADOR
entity somador_1b is
	port	(in1, in2, incarry	: in  std_logic;
			 out1, outcarry		: out std_logic);
end somador_1b;

architecture rts of somador_1b is
	signal s1, s2, scarry	: std_logic;
begin
	out1 <= s1 xor s2 xor scarry;
	outcarry <= (s1 and s2) or (s1 and scarry) or (s2 and scarry);
end rts;

library ieee;
use ieee.std_logic_1164.all;

entity multiplicador is
	generic (bussize : integer := 16);
	port	(a, b : in std_logic_vector(bussize-1 downto 0);
			 saida	  : out std_logic_vector(bussize-1 downto 0));
end multiplicador;

architecture mult of multiplicador is
	component somador_1b
		port	(in1, in2, incarry : in std_logic;	out1, outcarry : out std_logic);
	end component;
	signal s1, s2 : std_logic_vector(bussize-1 downto 0);
	signal carry : std_logic_vector(bussize*(bussize-1) downto 0);
	signal result  : std_logic_vector(bussize*(bussize-1) downto 0);
	signal pass : std_logic_vector(2 downto 0);
	signal p		: std_logic_vector(2*bussize-1 downto 0);
begin
	
	s1 <= a;
	s2 <= b;
	p(0) <= s1(0) and s2(0);
	
	pass(0) <= s1(0) and s2(1);
	pass(1) <= s1(1) and s2(0);
	c00: somador_1b port map (pass(0), pass(1), '0', carry(0), result(0));
	p(1) <= result(0);
	gen0: for i in 1 to bussize-2 generate
		pass(0) <= s1(0) and s2(i+1);
		c0x: somador_1b port map (result(bussize+i-1), pass(0), carry(i-1), carry(i), result(i));
		p(i+1) <= result(i);
	end generate gen0;
	c0n: somador_1b port map (result(2*bussize-2), '0', carry(bussize-2), carry(bussize-1), result(bussize-1));
	p(bussize) <= result(bussize-1);
	
	gen1: for i in 1 to bussize-3 generate
		pass(0) <= s1(i) and b(1);
		pass(1) <= s1(i+1) and s2(0);
		cx0: somador_1b port map (pass(0), pass(1), '0', carry(i*bussize), result(i*bussize));
		gen2: for j in 1 to bussize-2 generate
			pass(0) <= s1(i) and s2(j+1);
			cxx: somador_1b port map (result((i+1)*bussize+j-1), pass(0), carry(i*bussize+j-1), carry(i*bussize+j), result(i*bussize+j));
		end generate gen2;
		cxn: somador_1b port map (result((i+1)*bussize+bussize-2), result(i*bussize-1), carry(i*bussize+bussize-2), carry(i*bussize+bussize-1), result(i*bussize+bussize-1));
		p(bussize+i) <= result(i*bussize+bussize-1);
	end generate gen1;

	pass(0) <= s1(bussize-2) and b(1);
	pass(1) <= s1(bussize-1) and s2(0);
	cn0: somador_1b port map (pass(0), pass(1), '0', carry((bussize-2)*bussize), result((bussize-2)*bussize));
	gen3: for i in 1 to bussize-2 generate
		pass(0) <= s1(bussize-1) and b(i);
		pass(1) <= s1(bussize-2) and s2(i+1);
		cnx: somador_1b port map (pass(0), pass(1), carry((bussize-2)*bussize+i-1), carry((bussize-2)*bussize+i), result((bussize-2)*bussize+i));
	end generate gen3;
	pass(0) <= s1(bussize-1) and s2(bussize-1);
	cnn: somador_1b port map (pass(0), result((bussize-2)*bussize-1), carry((bussize-2)*bussize+bussize-2), carry((bussize-2)*bussize+bussize-1), result((bussize-2)*bussize+bussize-1));
	p(2*bussize-2) <= result((bussize-2)*bussize+bussize-1);
	p(2*bussize-1) <= carry((bussize-2)*bussize+bussize-1);
	
	saida <= p(bussize-1 downto 0);
	
end mult;