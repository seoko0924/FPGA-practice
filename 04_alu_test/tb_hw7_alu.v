`timescale 1ns / 1ps

module tb_hw7_alu;
    reg [3:0] a, b;
    reg [1:0] f;
    wire [3:0] s;
    wire co;

    hw7_alu uut (.a(a), .b(b), .f(f), .s(s), .co(co));

    initial begin
        $display("=== HW#7 ALU Simulation Start ===");
        $monitor("Time=%0t | f=%b | a=%d b=%d | logic_Input -> Adder -> Result: %d (Co:%b)", 
                 $time, f, a, b, s, co);

        // 초기값 설정 (PPT 예제: a=4, b=2)
        a = 4; b = 2;

        // 1. f=0 (b 통과) -> 결과: 2
        f = 0; #10;
        
        // 2. f=1 (~b 통과) -> 결과: ~2 (1101 -> 13)
        f = 1; #10;
        
        // 3. f=2 (a+b) -> 4+2=6 -> 결과: 6
        f = 2; #10;
        
        // 4. f=3 (a-b) -> 4-2=2 -> 결과: 2
        f = 3; #10;

        $stop;
    end
endmodule


