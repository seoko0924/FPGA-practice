`timescale 1ns / 1ps


module full_adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );
    wire [3:1] c;
    
    full_adder u0(a[0], b[0], cin, sum[0], c[1]);
    full_adder u1(a[1], b[1], c[1], sum[1], c[2]);
    full_adder u2(a[2], b[2], c[2], sum[2], c[3]);
    full_adder u3(a[3], b[3], c[3], sum[3], cout);
endmodule
