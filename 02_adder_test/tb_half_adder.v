`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/26 21:00:20
// Design Name: 
// Module Name: tb_half_adder
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


module tb_half_adder;
    reg a, b;
    wire sum, carry;
    
    half_adder u1(a, b, sum, carry);
    
initial begin
        $display("=== Half Adder Simulation Start ===");
        $monitor("Time=%0t | A=%b B=%b | Sum=%b Carry=%b", $time, a, b, sum, carry);

        // 1. 0 + 0 = 0 (Sum=0, Carry=0)
        a = 0; b = 0;
        #10;

        // 2. 0 + 1 = 1 (Sum=1, Carry=0)
        a = 0; b = 1;
        #10;

        // 3. 1 + 0 = 1 (Sum=1, Carry=0)
        a = 1; b = 0;
        #10;

        // 4. 1 + 1 = 2 (Sum=0, Carry=1) -> 하이라이트!
        a = 1; b = 1;
        #10;

        $display("=== Simulation Finish ===");
        $stop;
    end

endmodule
