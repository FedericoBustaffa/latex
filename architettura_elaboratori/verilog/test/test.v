module test();
	reg a, b;
	wire out;
	rete r(out, a, b); // istanziazione della rete 
	
	initial begin // main
		$dumpfile("test.vcd"); // file con i risultati delle simulazione
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
		
		$finish; // fine simulazione
	end
endmodule
