
primitive multiplexer(output out, input c, input a, input b);
	table
		0 0 ? : 0;
		0 1 ? : 1;
		1 ? 0 : 0;
		1 ? 1 : 1;
	endtable
endprimitive
