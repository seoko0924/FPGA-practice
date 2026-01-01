`timescale 1ns / 1ps


module pwm_4bit(
    input clk,
    input rst,
    input [3:0] duty,
    output reg pwm_out
    );
    
    reg [3:0] cnt;
    always @(posedge clk or posedge rst) begin
        if (rst)
            cnt <= 0;
        else 
            cnt <= cnt + 1;
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            pwm_out <= 0;
        else begin
            if (cnt < duty)
                pwm_out <= 1;
            else
                pwm_out <= 0;
        end
    end
endmodule
