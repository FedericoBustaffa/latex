module adder(output r_out, output out, input a, input b, input r_in);
    assign r_out = b && r_in || a && r_in || a && b;
    assign out = !a && !b && r_in  ||   !a && b && !r_in   || a && !b && !r_in  ||   a && b && r_in;
endmodule