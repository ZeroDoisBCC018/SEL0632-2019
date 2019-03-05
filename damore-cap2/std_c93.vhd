-- somente IEEE 1076-1993
ENTITY std_c93 IS
  PORT( a_bit, b_bit      : IN  BIT_VECTOR(2 DOWNTO 0); 
        not_bit, xnor_bit : OUT BIT_VECTOR(2 DOWNTO 0)); 
END std_c93;

ARCHITECTURE exemplo OF std_c93 IS
  TYPE vetor_booleano IS ARRAY (0 TO 2) OF BOOLEAN;
  SIGNAL not_bool, xnor_bool : vetor_booleano;
  SIGNAL a_bool  : vetor_booleano := (TRUE,  FALSE, TRUE);
  SIGNAL b_bool  : vetor_booleano := (FALSE, TRUE,  FALSE);
BEGIN                             
  not_bit  <=   NOT a_bit;
  xnor_bit <= a_bit  XNOR b_bit;
  
  not_bool  <= NOT a_bool;
  xnor_bool <= a_bool  XNOR b_bool;
END exemplo;