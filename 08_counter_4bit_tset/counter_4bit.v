`timescale 1ns / 1ps


module counter_4bit(
    input clk,
    input rst,
    output reg [3:0] count // 4비트 카운터

    );
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;
        end
        else begin
        count <= count + 1;
        end
    end
endmodule
