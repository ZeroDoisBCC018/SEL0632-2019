-- Multiplexador de 2 entradas de tamanho genérico

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX IS
        GENERIC (BUSSIZE : INTEGER);
        PORT    (A, B : IN  std_logic_vector (BUSSIZE - 1 DOWNTO 0);
                 sel  : IN  std_logic;
                 C    : OUT std_logic_vector (BUSSIZE - 1 DOWNTO 0));
END MUX;

ARCHITECTURE behavioral OF MUX IS
BEGIN
        WITH sel SELECT C
                A WHEN '0',
                B WHEN '1';
END behavioral;
                
