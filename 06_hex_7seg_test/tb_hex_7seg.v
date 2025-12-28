`timescale 1ns / 1ps

module tb_hex_7seg;

    reg [3:0] hex;
    wire [6:0] seg;
    integer i;

    // 모듈 연결
    hex_7seg u1 (
        .hex(hex), 
        .seg(seg)
    );

    initial begin
        $display("=== 7-Segment Decoder Simulation Start ===");
        $monitor("Time=%0t | Input Hex=%h | Seg Output(g~a)=%b", $time, hex, seg);

        // 0부터 15(F)까지 반복 테스트
        for(i = 0; i < 16; i = i + 1) begin
            hex = i;
            #10;
        end

        $display("=== Simulation Finish ===");
        $stop;
    end

endmodule