`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/26 20:11:08
// Design Name: 
// Module Name: logic_gate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module logic_gate(
    input [3:0] a,
    input [3:0] b,
    output [3:0] y_and,
    output [3:0] y_or,
    output [3:0] y_not_a,
    output [3:0] y_nand,
    output [3:0] y_nor,
    output [3:0] y_xor,
    output [3:0] y_xnor

    );
    
    assign y_and = a & b;
    assign y_or = a | b;
    assign y_not_a = ~a;
    assign y_nand = ~(a & b);
    assign y_nor = ~(a | b);
    assign y_xor = a ^ b;
    assign y_xnor = ~(a ^ b);
    
endmodule
