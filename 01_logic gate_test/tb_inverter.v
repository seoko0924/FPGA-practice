`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/26 18:47:45
// Design Name: 
// Module Name: tb_inverter
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


module tb_inverter;
reg a;
wire y;

inverter u1(a,y);

// 3. 시간 흐름에 따라 입력값 바꾸기 (시나리오)
    initial begin
        // 시뮬레이션 시작
        a = 0;          // 처음에 0을 넣음
        #10;            // 10ns 기다림 (결과: y는 1이어야 함)
        
        a = 1;          // 1을 넣음
        #10;            // 10ns 기다림 (결과: y는 0이어야 함)
        
        a = 0;          // 다시 0을 넣음
        #10;
        
        $finish;        // 시뮬레이션 종료
    end
endmodule
