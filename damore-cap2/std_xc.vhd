ENTITY std_xc IS
  PORT (bv_a,  bv_b  : IN  BIT_VECTOR(1 DOWNTO 0);
        int_a, int_b : IN  INTEGER RANGE -32 TO 31;
        bv_c,  bc_d  : OUT BIT_VECTOR(3 DOWNTO 0);
        int_c        : OUT INTEGER RANGE -64 TO 63);                     
END std_xc;

ARCHITECTURE teste OF std_xc IS
BEGIN 
  bv_c  <= bv_a & bv_b;
  bc_d  <= bv_a & '1' & '0';
  int_c <= -int_a +int_b;
END teste;














