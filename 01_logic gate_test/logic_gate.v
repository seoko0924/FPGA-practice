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
    input a,
    input b,
    output y_and,
    output y_or,
    output y_not_a,
    output y_nand,
    output y_nor,
    output y_xor,
    output y_xnor

    );
    
    assign y_and = a & b;
    assign y_or = a | b;
    assign y_not_a = ~a;
    assign y_nand = ~(a & b);
    assign y_nor = ~(a | b);
    assign y_xor = a ^ b;
    assign y_xnor = ~(a ^ b);
    
endmodule
