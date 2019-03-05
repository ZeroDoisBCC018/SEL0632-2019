ENTITY std_c IS
  PORT( a_bit, b_bit             : IN  BIT_VECTOR(2 DOWNTO 0); 
        not_bit, and_bit, or_bit : OUT BIT_VECTOR(2 DOWNTO 0)); 
  END std_c;

ARCHITECTURE exemplo OF std_c IS
  TYPE     vetor_booleano IS ARRAY (0 TO 2) OF BOOLEAN;
  SIGNAL   not_bool, and_bool, or_bool : vetor_booleano;
  CONSTANT a_bool  : vetor_booleano := (TRUE,  FALSE, TRUE);
  CONSTANT b_bool  : vetor_booleano := (FALSE, TRUE,  FALSE);
BEGIN                             
  not_bit <=   NOT a_bit;
  and_bit <= a_bit AND b_bit;
  or_bit  <= a_bit   OR b_bit;
  
  not_bool <= NOT a_bool;
  and_bool <= a_bool AND b_bool;
  or_bool  <= a_bool  OR b_bool;
END exemplo;
