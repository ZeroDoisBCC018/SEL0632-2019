ENTITY std_yc IS
  PORT (a, b   : OUT BIT_VECTOR (2 DOWNTO 0);
        c, d   : OUT BIT_VECTOR (0 TO 2));                     
END std_yc;

ARCHITECTURE teste OF std_yc IS
  CONSTANT x : BIT_VECTOR(0 TO 7) := B"1101_1001";
  SIGNAL   y : BIT_VECTOR(3 DOWNTO 0);
BEGIN 
  a <= x(1 TO 3);
  b <= y(3 DOWNTO 1);
  c <= x(5 TO 7);
  d <= y(2 DOWNTO 0);
  y <= x(2 TO 5);
END teste;














