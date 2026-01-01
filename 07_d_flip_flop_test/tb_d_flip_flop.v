`timescale 1ns / 1ps


module tb_d_flip_flop;
    // 1. 입력은 reg, 출력은 wire
    reg clk;
    reg rst;
    reg d;
    wire q;

    // 2. 모듈 연결 (Unit Under Test)
    d_flip_flop u1 (
        .clk(clk), 
        .rst(rst), 
        .d(d), 
        .q(q)
    );

    // 3. 클럭 생성기 (Clock Generator)
    // 5ns마다 0<->1 뒤집기 = 주기 10ns (100MHz)
    always #5 clk = ~clk;

    // 4. 입력 신호 시나리오
    initial begin
        $display("=== D-FlipFlop Simulation Start ===");
        $monitor("Time=%0t | RST=%b CLK=%b | D=%b -> Q=%b", $time, rst, clk, d, q);

        // [0ns] 초기화
        clk = 0;
        rst = 1; // 리셋을 켠 상태로 시작 (Q를 0으로 확실히 죽여놓기)
        d = 0;
        #12;

        // [10ns] 리셋 해제
        rst = 0; 
        #10;

        // [20ns] 데이터 변경: D=1
        // (클럭이 뛸 때 Q가 1로 변하는지 확인)
        d = 1; 
        #20; // 클럭 2번 뛸 동안 대기

        // [40ns] 데이터 변경: D=0
        // (클럭이 뛸 때 Q가 0으로 변하는지 확인)
        d = 0; 
        #20;

        // [60ns] 중간에 리셋 테스트
        // (클럭과 상관없이 즉시 0이 되는지 확인)
        d = 1;
        #5;
        rst = 1; // 리셋 꽝!
        #10;
        rst = 0;
        #10;

        $display("=== Simulation Finish ===");
        $stop;
    end

endmodule