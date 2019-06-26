library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	-- for /= [std_logic_vector, std_logic_vector]

use work.logisticmap_pkg.all;

use std.textio.all;

entity logisticmap_tb is
	generic(
		size : natural := 20
		);
	port (
		xnout : out std_logic_vector(size-1 downto 0)
		);
end logisticmap_tb;

architecture testbench of logisticmap_tb is

	component logisticmap is
		generic(
			bussize	: integer
			);
		port(
			clk, clr	: in	std_logic;
			start		: in	std_logic;
			x0			: in	std_logic_vector(bussize-1 downto 0);
			xnout		: out	std_logic_vector(bussize-1 downto 0)
			);
	end component;

	signal clk : std_logic := '1';
	signal clr, start : std_logic;
	signal x0, xout, x_tmp : std_logic_vector(size-1 downto 0);
	
	file arq : text open write_mode is "random.txt";

begin
	-- Signals initialization
	clk <= not clk after 50 ns;
	
	clr <= '1', '0' after 50 ns;
	
	start <= '0', '1' after 50 ns, '0' after 150 ns;
	
	x0 <= ((size-1) downto (size-3) => '1', others => '0');		-- x0 <= ("1110...0");
	
	lm: logisticmap generic map (size) port map (clk, clr, start, x0, xout);
	
	xnout <= xout;
	
	-- File writing
	postponed process (xout)
		variable linha: line;
	begin
		write(linha, to_bitvector(xout));
		writeline(arq, linha);
	end postponed process;

	-- Random assertion
	-- Temporary register
	process (clk)
	begin
		if rising_edge(clk) then
			x_tmp <= xout;
		end if;
	end process;
	
	-- Assertion
	process (clk)
	begin
		if falling_edge(clk) then
			if start = '0' and clr = '0' then 
				assert x_tmp /= xout
					report "Not random"
						severity FAILURE;
			end if;
		end if;
	end process;
	
end testbench;
