module test_rete1 (ports);
	// un registro per ogni ingresso
	reg a, b;
	// un filo per ognuna delle uscite
	wire c;
	// istanziazione del modulo (nome dopo "primitive")
	rete1 r1(c, a, b);
	// main
	// initial
	begin
		// log in test_r1.vcd
		$dumpfile("test_r1.vcd");
		// tutte le variabili
		$dumpvars;
		// inizializzazione a e b
		a = 0;
		b = 0;
		// dopo 3 unità di tempo b diventa 1
		#3
		b = 1;
		#3
		a = 1;
		b = 0;
		#3
		b = 1;
		// fine test
		#5
	end
endmodule