primitive rete_1 (z, x, y);
	output z;
	input x, y;

	table
		0 0 : 1;
		0 1 : 1;
		1 0 : 1;
		1 1 : 0;
	endtable
endprimitive // rete1