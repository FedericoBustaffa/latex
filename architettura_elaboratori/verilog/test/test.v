module test();
	reg a, b;
	wire c;

	rete r(c, a, b);

	initial begin
		$dumpfile("test.vcd");
		$dumpvars;

		a = 0;
		b = 0;
		
		#3 // attendi 3 unità di tempo
		b = 1;
		
		#3
		a = 1;
		b = 0;
		
		#3
		b = 1;
		
		#5		
		$finish;
	end
endmodule