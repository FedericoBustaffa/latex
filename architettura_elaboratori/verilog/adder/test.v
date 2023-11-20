module test;
    reg  a = 0;
    reg  b = 0;
    reg r_in = 0;
    wire r_out;
    wire c;

    integer i = 0;

    adder add(r_out, c, a, b, r_in);

    initial begin
		$dumpfile("test_main.vcd");
		$dumpvars;

		$display("a b r");
		for(i = 0; i < 8; i = i + 1) begin
				#3 {a, b, r_in} = i;
				#1 $display("%b %b %b => somma: %b, riporto: %b", a, b, r_in, c, r_out);
			end
		$finish;
     end
endmodule