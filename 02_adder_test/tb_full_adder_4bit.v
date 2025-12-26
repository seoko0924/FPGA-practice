`timescale 1ns / 1ps

module tb_full_adder_4bit;

    // 1. 입력 (값을 주입해야 하므로 reg)
    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    // 2. 출력 (결과를 관찰해야 하므로 wire)
    wire [3:0] sum;
    wire cout;

    // 3. 모듈 연결 (호승님 스타일: 순서대로 연결)
    // 순서: a, b, cin, sum, cout (설계 파일 순서와 완벽히 일치해야 함!)
    full_adder_4bit u0(a, b, cin, sum, cout);

    initial begin
        $display("=== 4-bit Adder Simulation Start ===");
        // %d: 10진수로 보기 (계산이 맞는지 직관적으로 확인)
        // %b: 2진수로 보기 (비트 흐름 확인)
        $monitor("Time=%0t | %d + %d + (Cin:%b) = %d (Cout:%b) | Binary: %b", 
                 $time, a, b, cin, sum, cout, sum);

        // Case 1: 단순 덧셈 (3 + 5 = 8)
        a = 3; b = 5; cin = 0;
        #10;

        // Case 2: 캐리가 발생하는 덧셈 (7 + 9 = 16 -> Sum:0, Cout:1)
        a = 7; b = 9; cin = 0;
        #10;

        // Case 3: Cin이 있는 경우 (2 + 2 + 1 = 5)
        a = 2; b = 2; cin = 1;
        #10;

        // Case 4: ★최대값 테스트 (오버플로우)★
        // 15(1111) + 1(0001) = 0(0000) 이 되고 Cout이 1이 나와야 함
        a = 15; b = 1; cin = 0;
        #10;

        // Case 5: 전부 1인 경우 (15 + 15 + 1 = 31 -> Sum:15, Cout:1)
        a = 15; b = 15; cin = 1;
        #10;

        $display("=== Simulation Finish ===");
        $stop;
    end

endmodule