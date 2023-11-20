module test_mux();
	reg c, a, b;
	wire out;
	multiplexer mux(out, c, a, b); // istanziazione della rete 
	
	initial begin // main
		$dumpfile("mux.vcd"); // file con i risultati delle simulazione
		$dumpvars;

		a = 0;
		b = 1;
		c = 0;
		#3 // attendi 3 unità di tempo
		
		c = 1;
		#3
		
		a = 1;
		b = 0;
		c = 0;
		#3

		c = 1;
		#5
		
		$finish; // fine simulazione
	end
endmodule
