
module adder(output out, output r_out, input a, input b, input r_in);
    assign r_out = b & r_in | a & r_in | a & b;
    assign out = ~a & ~b & r_in | ~a & b & ~r_in | a & ~b & ~r_in | a & b & r_in;
endmodule

module adder2(output [1:0]s, output r_out, input r_in, input [1:0]a, input [1:0]b);
    wire rip;
    adder a1(s[0], rip, r_in, a[0], b[0]);
    adder a2(s[1], r_out, rip, a[1], b[1]);
endmodule

