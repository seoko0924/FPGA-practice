`timescale 1ns / 1ps


module hex_7seg(
    input [3:0] hex,
    output reg [6:0] seg
    );
    always @(*) begin
        case(hex)
            // 0~9 
            4'h0 : seg = 7'b011_1111; // 숫자 0
            4'h1 : seg = 7'b000_0110; // 숫자 1
            4'h2 : seg = 7'b101_1011; // 숫자 2
            4'h3 : seg = 7'b100_1111; // 숫자 3
            4'h4 : seg = 7'b110_0110; // 숫자 4
            4'h5 : seg = 7'b110_1101; // 숫자 5
            4'h6 : seg = 7'b111_1101; // 숫자 6
            4'h7 : seg = 7'b010_0111; // 숫자 7
            4'h8 : seg = 7'b111_1111; // 숫자 8
            4'h9 : seg = 7'b110_1111; // 숫자 9
            
            // 16진수 A~F 표시 (취향 차이가 있음)
            4'hA : seg = 7'b111_0111; // A 
            4'hB : seg = 7'b111_1100; // b 
            4'hC : seg = 7'b011_1001; // C 
            4'hD : seg = 7'b101_1110; // d 
            4'hE : seg = 7'b111_1001; // E
            4'hF : seg = 7'b111_0001; // F
            default : seg = 7'b000_0000;
        endcase
     end
endmodule
