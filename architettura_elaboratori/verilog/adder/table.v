
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
