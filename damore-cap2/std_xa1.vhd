ENTITY std_xa1 IS
  PORT( a, b, c, d         : IN  BIT; 
        x1, x2, x3, x4, x5 : OUT BIT); 
END std_xa1;

ARCHITECTURE exemplo OF std_xa1 IS
BEGIN                             
   x1 <= a OR NOT b;            -- Certo:  operador NOT tem precedencia mais elevada
   x2 <= a AND b AND c;         -- Certo:  operadores iguais
-- x3 <= a AND b  OR c;         -- Errado: expressao ambigua x3=(a.b)+c  ou x3=a.(b+c) ?   
   x3 <=(a AND b) OR c;         -- Certo:  empregando parentesis
-- x4 <= a AND b  OR  c AND d;  -- Errado: expressao ambibua, operadores com mesma precedecia
   x4 <=(a AND b) OR (c AND d); -- Certo:  x4 = a.b + c.d
-- x5 <= a NAND b  NAND c;      -- Errado: operadores com negacao necessitam parentesis
   x5 <=(a NAND b) NAND c;      -- Certo:  operador com negacaco entre parentesis
END exemplo;













