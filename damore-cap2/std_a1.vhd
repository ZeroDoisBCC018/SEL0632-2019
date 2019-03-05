ENTITY std_a1 IS
 PORT(s1, s2, s3, s4, s5   : OUT BIT_VECTOR(4 DOWNTO 0));                   
END std_a1;

ARCHITECTURE teste OF std_a1 IS
  CONSTANT zero : BIT := '0';
  CONSTANT um   : BIT := '1';
BEGIN
  s1 <= "00001";                                 -- valor 00001, direto
  s2 <= ('0','0','0','1','0');                   -- valor 00010, agregado notacao posicional
  s3 <= (1=>'1', 0=>'1', OTHERS=>'0');           -- valor 00011, agregado associacao por nomes
  s4 <= (zero, '0', um OR '0', '0', '0');        -- valor 00100, agregado com operacoes
  s5 <= (4 DOWNTO 3 =>'0', 1=>'0', OTHERS=>'1'); -- valor 00101, agregado faixa discreta
END teste;