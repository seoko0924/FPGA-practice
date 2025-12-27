`timescale 1ns / 1ps


module mux_2x1(
    input d0,
    input d1,
    input sel,
    output reg y
    );
    //assign y = (sel) ? d1 : d0;
    always @(*) begin
        if(sel == 1'b0) y = d0;
        else            y = d1;
    end    
endmodule
