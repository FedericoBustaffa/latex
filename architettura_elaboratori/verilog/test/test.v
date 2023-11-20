module test();
	reg a, b;
	wire c;

	rete r(c, a, b);

	initial begin
		$dumpfile("test.vcd");
		$dumpvars;

		for (a = 0; a <= 1; a=a+1) begin
			for (b = 0; b <= 1; b=b+1) begin
				#4;
			end
		end
		#5;
		
		$finish;
	end
endmodule