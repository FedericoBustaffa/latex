module adder(output s, output r_out, input a, input b, input r_in);
	assign out = ~c & a | c & b;
endmodule