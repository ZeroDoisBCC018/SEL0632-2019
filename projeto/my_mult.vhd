library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity mult_tb is
	generic (my_mult_bussize : integer := 20);
end mult_tb;

architecture testbench of mult_tb is

	signal	a, b	: std_logic_vector(my_mult_bussize-1 downto 0) := ((my_mult_bussize-1) => '1', others => '0');
	signal  ab	: std_logic_vector(my_mult_bussize-1 downto 0) := (others => '0');
	

	component my_mult is
		generic(
			mult_size	: integer := 16
			);
		port(
			mult_a, mult_b	: in	std_logic_vector(mult_size-1 downto 0);
			mult_ab		: out	std_logic_vector(mult_size-1 downto 0)
			);
		end component;
		
--	Especificacao de configuracao	Altere conforme a implementacao do seu multiplicador desenvolvido
	for inst_mult: my_mult use 
			entity work.multiplicador(mult)
			generic map(bussize => mult_size)
			port map(a => mult_a, b => mult_b, saida => mult_ab);

begin
	inst_mult: component my_mult generic map(my_mult_bussize) port map (a, b, ab);

	data: process is
	begin
			
		abc: for t in 1 to 10 loop
			wait for 100 ns;
			a <= std_logic_vector(unsigned(a)/2+1);
			b <= std_logic_vector(unsigned(b)/3+3);
		end loop;
	end process;

	writefile: process is
		--type unsigned_file_type is file of unsigned;
		file write_file_my_mult: text;
		variable linha: line;
	begin
		file_open(write_file_my_mult, "Grupo11_tb.txt", Write_Mode);
		def: for i in 1 to 10 loop			
			wait on ab;
			write(linha, now);
			write(linha, ht);
			write(linha, string'("a = "));
			write(linha, To_bitvector(a));
			write(linha, ht);
			write(linha, string'("b = "));
			write(linha, To_bitvector(b));
			write(linha, ht);
			write(linha, string'("ab = "));
			write(linha, To_bitvector(ab));
			writeline(write_file_my_mult, linha);
		end loop;	
		file_close(write_file_my_mult);
	end process;
end;