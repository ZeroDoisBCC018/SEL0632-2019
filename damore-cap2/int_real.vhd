ENTITY int_real IS
  PORT (ci1,ci2     : OUT INTEGER RANGE 0    TO 31;
        ci3,ci4     : OUT INTEGER RANGE 31   DOWNTO 0;
        ci5,ci6,ci7 : OUT INTEGER RANGE -15  TO 15;
        cr1,cr2     : OUT REAL    RANGE 0.0  TO 31.0;
        cr3,cr4     : OUT REAL    RANGE 31.0 DOWNTO 0.0);        
END int_real;

ARCHITECTURE teste OF int_real IS
  CONSTANT i1 : INTEGER  :=  11;                 -- valor 11, base 10
  CONSTANT i2 : INTEGER  :=  10#11#;             -- valor 11, base 10
  CONSTANT i3 : INTEGER  :=  2#01011#;           -- valor 11, base 2
  CONSTANT i4 : INTEGER  :=  2#01_01_1#;         -- valor 11, base 2
  CONSTANT i5 : INTEGER  :=  5#21#;              -- valor 11, base 5    
  CONSTANT i6 : NATURAL  :=  8#13#;              -- valor 11, base 8
  CONSTANT i7 : POSITIVE :=  16#B#;              -- valor 11, base 16  

  CONSTANT r1 : REAL     :=  11.0;               -- valor 11, base 10
  CONSTANT r2 : REAL     :=  1.1E01;             -- valor 11, base 10 formato nn.nExx
  CONSTANT r3 : REAL     :=  2#01011.0#;         -- valor 11, base 2
  CONSTANT r4 : REAL     :=  8#1.3#E01;          -- valor 11, base 8  formato nn.nExx
  CONSTANT r5 : REAL     :=  16#B.0#;            -- valor 11, base 16
BEGIN
  ci1 <= i1; ci2 <= i2; ci3 <= i3; ci4 <= i4; ci5 <= i5; ci6 <= i6; ci7 <= i7;
  cr1 <= r1; cr2 <= r2; cr3 <= r3; cr4 <= r5;  
END teste;

