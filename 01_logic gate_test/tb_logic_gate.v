`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/26 20:11:24
// Design Name: 
// Module Name: tb_logic_gate
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


module tb_logic_gate;

    // 1. 테스트를 위한 신호 선언
    reg [3:0] a;
    reg [3:0] b;
    // 출력 결과는 지켜보기만 할 것이므로 wire로 선언
    wire [3:0] y_and, y_or, y_not_a, y_nand, y_nor, y_xor, y_xnor;

    // 2. 설계한 모듈(DUT: Device Under Test) 가져오기
    // .설계포트이름(테스트벤치신호이름) 방식으로 연결
    logic_gate u1 (
        .a(a),
        .b(b),
        .y_and(y_and),
        .y_or(y_or),
        .y_not_a(y_not_a),
        .y_nand(y_nand),
        .y_nor(y_nor),
        .y_xor(y_xor),
        .y_xnor(y_xnor)
    );

    // 3. 입력 시나리오 작성
    initial begin
        // (팁) $monitor: 신호 값이 바뀔 때마다 콘솔창에 자동으로 출력해주는 기능
        $display("=== Logic Gate Simulation Start ===");
        $monitor("Time=%0tns | Input A=%b B=%b | AND=%b | OR=%b | XOR=%b", 
                 $time, a, b, y_and, y_or, y_xor);

// Case 1: 0000과 1111 연산
        a = 4'b0000; b = 4'b1111;
        #20;

        // Case 2: 섞어서 연산 (1010과 0101) -> AND하면 0000, OR하면 1111 나와야 함
        a = 4'b1010; b = 4'b0101;
        #20;

        // Case 3: 임의의 값 (1100과 1010)
        a = 4'b1100; b = 4'b1010;
        #20;
        $display("=== Simulation Finish ===");
        $stop; // 시뮬레이션 종료
    end

endmodule

