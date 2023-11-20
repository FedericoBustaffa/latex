module test();
	reg a = 0, b = 0;
	wire out;
	rete r(out, a, b); // istanziazione della rete
	integer i = 0;
	
	initial begin // main
		$dumpfile("test.vcd"); // file con i risultati delle simulazione
		$dumpvars;

		for(i = 0; i < 4; i = i + 1) begin
            {a, b} = i; #3;
        end
    	$finish;
	end
endmodule