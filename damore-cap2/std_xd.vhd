ENTITY std_xd IS
  PORT (l, r             : IN  INTEGER RANGE -64 TO 63;
        l_mul_r, l_div_r : OUT INTEGER RANGE -64 TO 63;
        l_rem_r, l_mod_r : OUT INTEGER RANGE -64 TO 63);                     
END std_xd;

ARCHITECTURE teste OF std_xd IS
BEGIN
  l_mul_r <= l * r;
  l_div_r <= l / r;
  l_rem_r <= l REM r; -- l REM r = l -(l/r)*r
  l_mod_r <= l MOD r; -- l MOD r = l -(r*n)   sendo n um valor inteiro 
END teste;














