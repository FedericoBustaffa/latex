module test_rete1();
	reg a, b;
	wire c;

	rete1 r1(c, a, b);

	initial begin
		$dumpfile("test.vcd");
		$dumpvars;

		a = 0;
		b = 0;

		#3
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