ENTITY std_a IS
  PORT (s1, s2, s3, s4, s5  : OUT BIT_VECTOR (4 DOWNTO 0));                     
END std_a;

ARCHITECTURE teste OF std_a IS
  CONSTANT c1   : BIT_VECTOR(4 DOWNTO 0) := "01011";  -- constante
  CONSTANT zero : BIT := '0';
  CONSTANT um   : BIT := '1';
BEGIN 
  s1 <= c1;                            -- valor atraves de constante
  s2 <= "01011";                       -- valor (01011) direto - base binaria
  s3 <= B"01_0_11";                    -- valor (01011) direto - base binaria com separadores
  s4 <= '0' & X"B";                    -- bit (0) concatenado com valor hexadecimal (1011)
  s5(4 DOWNTO 3) <= "01";              -- valor (01), parte do vetor          
  s5(2 DOWNTO 0) <= zero & um & um;    -- valor (010), parte do vetor com concatenacao
END teste;