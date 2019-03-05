ENTITY lista1 IS
  PORT (c, d   : OUT STRING(1 TO 9));
END lista1;

ARCHITECTURE teste OF lista1 IS
   SIGNAL x : STRING(1 TO 3) := "Alo";
   SIGNAL y : STRING(1 TO 5) := "mundo";
BEGIN
  c <= x & " " & y;
  d <= x(1 TO 2) & "o " & y;
END teste;

