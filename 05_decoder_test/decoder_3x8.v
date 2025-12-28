`timescale 1ns / 1ps


module decoder_3x8(
    input [2:0] in,
    output [7:0] out
    );
    // in = 0 이면 1을 0칸 민다. 0000_0001
    // in = 1  이면 1을 1칸 민다. 0000_0010.....
    assign out = 1'b1 << in;
    
/*    output reg [7:0] out
    );
    always @(*) begin
        case (in)
            3'b000 : out = 8'b0000_0001;
            3'b001 : out = 8'b0000_0010;
            3'b010 : out = 8'b0000_0100;
            3'b011 : out = 8'b0000_1000;
            3'b100 : out = 8'b0001_0000;
            3'b101 : out = 8'b0010_0000;
            3'b110 : out = 8'b0100_0000;
            3'b111 : out = 8'b1000_0000;
        endcase 
    end 
*/  
endmodule
