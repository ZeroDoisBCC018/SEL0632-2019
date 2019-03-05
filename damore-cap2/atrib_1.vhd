ENTITY atrib_1 IS
  PORT (x1     : IN  INTEGER RANGE -16 TO 15;
        y1,z1  : OUT INTEGER RANGE -16 TO 15);
END;

ARCHITECTURE teste OF atrib_1 IS

SIGNAL   s1 : INTEGER RANGE -16 TO 15 := 12;
CONSTANT c1 : INTEGER := 7;

BEGIN 
  y1 <= s1;
  s1 <= x1;

  z1 <= c1;
END teste;















