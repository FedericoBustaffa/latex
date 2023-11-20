module test_add();
	reg [1:0]a = 0;
	reg [1:0]b = 0;
	reg r_in = 0;

	wire [1:0]s;
	wire r_out;

  adder2 add2(s, r_out, r_in, a, b);

	integer i = 0;

	initial begin
		$dumpfile("add.vcd");
		$dumpvars;

		for (i = 0; i < 32; i = i + 1) begin
			{a, b, r_in} = i; #3;
	        $display("%b %b %b => somma: %b, riporto: %b", a, b, r_in, s, r_out);
		end
		$finish;
	end
endmodule