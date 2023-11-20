module test_mux();
	reg c = 0, a = 0, b = 0;
	wire out;
	multiplexer mux(out, c, a, b); // istanziazione della rete
	integer i = 0;
	
	initial begin // main
		$dumpfile("mux.vcd"); // file con i risultati delle simulazione
		$dumpvars;

		for(i = 0; i < 8; i = i + 1) begin
            {c, a, b} = i; #3;
        end		
		$finish; // fine simulazione
	end
endmodule
