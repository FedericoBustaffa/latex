
primitive adder_somma(output s, input a, input b, input r_in);
	table
		0 0 0 : 0;
		0 0 1 : 1;
		0 1 0 : 1;
		0 1 1 : 0;
		1 0 0 : 1;
		1 0 1 : 0;
		1 1 0 : 0;
		1 1 1 : 1;
	endtable
endprimitive

primitive adder_riporto(output r_out, input a, input b, input r_in);
	table
		0 0 0 : 0;
		0 0 1 : 0;
		0 1 0 : 0;
		0 1 1 : 1;
		1 0 0 : 0;
		1 0 1 : 1;
		1 1 0 : 1;
		1 1 1 : 1;
	endtable
endprimitive

module adder(output s, output r_out, input a, input b, input r_in);
	adder_somma somma(s, a, b, r_in);
	adder_riporto riporto(r_out, a, b, r_in);
endmodule

module adder2(output [1:0]s, output r_out, input r_in, input [1:0]a, input [1:0]b);
    wire rip;
    adder a1(s[0], rip, r_in, a[0], b[0]);
    adder a2(s[1], r_out, rip, a[1], b[1]);
endmodule
