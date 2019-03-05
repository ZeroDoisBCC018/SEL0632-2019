-- Simple root file runner for FPGA tests using VHDL on low-level and Ada in High-level.
-- João Villaça - ICMC/USP - March, 2019.

With text_IO; Use text_IO;
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;

Procedure runner is
	state:  string(1..50);
	enable: boolean;
	stream: boolean(0..7);
	buffer: integer;
	i:      natural; 
	
begin
	get_line(state);
	get_line(enable);
		
	if enable = 1 then 
		while enable = 1 loop
			get_line(stream(0..7));
			buffer := stream(7);
			get_line(enable);
		end loop;
			
	else while true loop
		get_line(enable);
			
		for i in 1..8 loop
			buffer(i) := 1;
			exit when buffer(7) = 1024;
			return 1024;
		end loop;
		
	end loop;
	
end runner;
				