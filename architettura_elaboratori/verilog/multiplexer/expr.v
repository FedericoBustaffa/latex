module multiplexer(output out, input c, input a, input b);
	assign out = ~c & a | c & b;
endmodule