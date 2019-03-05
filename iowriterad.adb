-- Simple file opener and writer.
-- João Villaça - ICMC/USP - March, 2019.

WITH Ada.Sequential_IO;
			 
PROCEDURE TEST1 is

PACKAGE Seq_Float_IO is new Ada.Sequential_IO (Element_Type => float);
blank, container : Seq_Float_IO.File_Type;
str : CONSTANT String := "stream_init.dat";
ord : CONSTANT String := "ordinate.mif";

BEGIN

	PROCEDURE Open_Data(File : in out Seq_Float_IO.File_Type; Name : in String) is
	
		BEGIN
		Seq_Float_IO.Open (
			File => File,
			Mode => Seq_Float_IO.Append_File,
			Name => str );
		EXCEPTION
		WHEN Seq_Float_IO.Name_Error =>
			Seq_Float_IO.Create (
				File => File,
				Mode => Seq_Float_IO.Out_File,
				Name => str);
	END;
			
END Open_Data;


   x  : CONSTANT float := 2.0;


BEGIN -- bloco principal do programa

   Open_Data(File => blank, Name => str);
   Seq_Float_IO.Write(File => blank, Item => x);
   Seq_Float_IO.Close(File => blank);

   Open_Data(File => container, Name => ord);
  Seq_Float_IO.Write(File => container, Item => x);
  Seq_Float_IO.Close(File => container);

END TEST1;
