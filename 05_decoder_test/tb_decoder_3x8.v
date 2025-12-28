`timescale 1ns / 1ps


module tb_decoder_3x8;
reg [2:0] in;
wire [7:0] out;

decoder_3x8 u1(.in(in), .out(out));
// 3. 입력 신호 주기
    initial begin
        $display("=== Decoder 3x8 Simulation Start ===");
        // 결과 감시 (입력이 몇 번인지, 출력이 어떻게 켜지는지 확인)
        $monitor("Time=%0t | Input=%d (%b) | Output=%b", $time, in, in, out);

        // [방법 1] 노가다 방식 (직관적)
        in = 0; #10;
        in = 1; #10;
        in = 2; #10;
        in = 3; #10;
        in = 4; #10;
        in = 5; #10;      
        in = 6; #10;          
        in = 7; #10;




        $display("=== Simulation Finish ===");
        $stop;
    end


endmodule
