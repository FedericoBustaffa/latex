
module rete(output out, input a, input b);
	assign out = ~a & ~b | ~a & b | a & ~b;
endmodule
