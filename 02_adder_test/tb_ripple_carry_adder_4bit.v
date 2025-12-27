`timescale 1ns / 1ps

module tb_ripple_carry_adder_4bit;
    reg [3:0] a;
    reg [3:0] b;
    reg sub;        // 0이면 덧셈, 1이면 뺄셈
    wire [3:0] sum;
    wire cout;

    // 모듈 연결
    ripple_carry_adder_4bit u1(a, b, sub, sum, cout);

    initial begin
        $display("=== Adder/Subtractor Simulation ===");
        $monitor("Time=%0t | Sub=%b | %d(A) op %d(B) = %d(Sum) (Cout=%b) | Binary Sum=%b", 
                 $time, sub, a, b, sum, cout, sum);

        // 1. 덧셈 테스트: 5 + 3 = 8
        sub = 0; a = 5; b = 3;
        #10;

        // 2. 뺄셈 테스트 (양수 결과): 10 - 4 = 6
        sub = 1; a = 10; b = 4;
        #10;

        // 3. 뺄셈 테스트 (음수 결과): 3 - 5 = -2
        // 기대 결과: -2는 4비트 2의 보수로 '1110' (10진수로 읽으면 14처럼 보임)
        sub = 1; a = 3; b = 5;
        #10;
        
        // 4. 뺄셈 테스트 (같은 수): 7 - 7 = 0
        sub = 1; a = 7; b = 7;
        #10;

        $stop;
    end
endmodule