`timescale 1ns / 1ps

module tb_counter_4bit;

    reg clk;
    reg rst;
    wire [3:0] count;

    // 모듈 연결
    counter_4bit u2(
        .clk(clk), 
        .rst(rst), 
        .count(count)
    );

    // 클럭 생성 (주기 10ns)
    always #5 clk = ~clk;

    initial begin
        $display("=== Counter Simulation Start ===");
        $monitor("Time=%0t | RST=%b | Count=%d (%b)", $time, rst, count, count);

        // 1. 초기화
        clk = 0;
        rst = 1;
        #10;

        // 2. 카운트 시작
        rst = 0;
        
        // 3. 0부터 15까지 세고 다시 0으로 돌아올 때까지 충분히 기다림
        // 16번 카운트 * 10ns = 160ns 이상 필요
        #200;

        // 4. 중간에 리셋 테스트
        rst = 1;
        #20;
        
        $display("=== Simulation Finish ===");
        $stop;
    end

endmodule
