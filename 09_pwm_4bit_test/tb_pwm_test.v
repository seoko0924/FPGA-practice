`timescale 1ns / 1ps

module tb_pwm_4bit;

    reg clk;
    reg rst;
    reg [3:0] duty;
    wire pwm_out;

    // 모듈 연결
    pwm_4bit uut (
        .clk(clk), 
        .rst(rst), 
        .duty(duty), 
        .pwm_out(pwm_out)
    );

    // 클럭 생성 (주기 10ns)
    always #5 clk = ~clk;

    initial begin
        $display("=== PWM Simulation Start ===");
        
        // 1. 초기화
        clk = 0; rst = 1; duty = 0;
        #10;
        rst = 0;

        // 2. Duty = 4 (25% 밝기/속도)
        // 16번 셀 동안 4번만 켜져 있어야 함
        duty = 4;
        #200; // 충분히 기다림 (카운터 한 바퀴가 160ns니까 넉넉하게)

        // 3. Duty = 8 (50% 밝기/속도)
        // 반반 켜져 있어야 함
        duty = 8;
        #200;

        // 4. Duty = 12 (75% 밝기/속도)
        // 대부분 켜져 있어야 함
        duty = 12;
        #200;

        // 5. Duty = 15 (거의 100% 풀파워)
        duty = 15;
        #200;

        $stop;
    end

endmodule