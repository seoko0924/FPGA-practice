`timescale 1ns / 1ps


module hw7_alu(
    input [3:0] a,
    input [3:0] b,
    input [1:0] f,      // 기능 선택 (Function Select)
    output reg [3:0] s, // 결과 (Sum)
    output reg co       // 캐리 아웃 (Carry Out)
    );

    // 1. Adder에 들어가기 전, "조작된 입력"을 담을 임시 변수들
    reg [3:0] logic_a;   // Adder의 A자리에 넣을 값
    reg [3:0] logic_b;   // Adder의 B자리에 넣을 값
    reg logic_cin;       // Adder의 Cin자리에 넣을 값

    // 2. 입력 조작 단계 (PPT의 Mux 역할)
    always @(*) begin
        case (f)
            2'b00 : begin // 기능: b 그대로 통과 (0 + b + 0)
                logic_a   = 4'b0000;
                logic_b   = b;
                logic_cin = 1'b0;
            end
            
            2'b01 : begin // 기능: b 반전 (~b) 통과 (0 + ~b + 0)
                logic_a   = 4'b0000;
                logic_b   = ~b;
                logic_cin = 1'b0;
            end
            
            2'b10 : begin // 기능: 덧셈 (a + b + 0)
                logic_a   = a;
                logic_b   = b;
                logic_cin = 1'b0;
            end
            
            2'b11 : begin // 기능: 뺄셈 (a + ~b + 1) -> 2의 보수 이용
                logic_a   = a;
                logic_b   = ~b;
                logic_cin = 1'b1;
            end

            default : begin // 혹시 모를 에러 방지
                logic_a = 0; logic_b = 0; logic_cin = 0;
            end
        endcase

        // 3. 최종 계산 단계 (Adder 역할) -> 딱 1번만 계산함!
        {co, s} = logic_a + logic_b + logic_cin;
    end

endmodule