`timescale 1ns / 1ps


module tb_mux_4x1;

    reg d0, d1, d2, d3;
    reg [1:0] sel;
    wire y;
    
    mux_4x1 u1(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.sel(sel),.y(y));
    
    // (힌트) 테스트 시나리오 부분
    initial begin
        // 데이터는 미리 다 셋팅해두고
        d0=0; d1=1; d2=0; d3=1;
        
        // 스위치만 탁탁탁 돌려봅니다.
        sel = 2'b00; #10; // y는 0이어야 함 (d0)
        sel = 2'b01; #10; // y는 1이어야 함 (d1)
        sel = 2'b10; #10; // y는 0이어야 함 (d2)
        sel = 2'b11; #10; // y는 1이어야 함 (d3)
        $stop;
    end


endmodule
