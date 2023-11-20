
module rete(output z, input x, input y);
	assign z = (~x & ~y) | (~x & y) | (x & ~y);
endmodule
