----------------------------
--Joao Vitor Nascimento Villaca
--10724239
--
--Exercício 5.6.2
----------------------------

entity latch is
	port(x0     : in bit;
	     x1, x2 : out bit);
end latch;

architecture teste of latch is


	--usei os seguintes sinais para evitar o uso de BUFFER
	signal buf1 : std_logic;
	signal buf2 : std_logic;
	signal buf3 : std_logic;

	begin
		buf1 <= not x0;
		buf2 <= not x1;
		buf3 <= not x2;
		
		x0 <=     buf1 after 100 ns;
		x1 <=     buf2 after 100 ns when not buf1 else
		      not buf2 after 100 ns;
		x2 <=     buf3 after 200 ns when not buf2 else
		      not buf3 after 200 ns;
end teste;


--x0 ----|_______________/'''''''''''''''\_______
--       |       |       |       |       |       |
--x1 ----|_______________/'''''''''''''''\_______
--       |       |       |       |       |       |
--x2 ----/'''''''''''''''\_______________/'''''''
--       |       |       |       |       |       |
--t     0ns     50ns    100ns   150ns   200ns   250ns
--
--Nível lógico 0: __________
--
--Nível lógico 1: ''''''''''
--
--Borda de subida:  /
--Borda de descida: \


