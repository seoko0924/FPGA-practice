`timescale 1ns / 1ps

module tb_full_adder;

    // 1. 입력은 reg (값을 바꿔가며 넣어줘야 하니까)
    reg a;
    reg b;
    reg cin;

    // 2. 출력은 wire (결과를 지켜보기만 하면 되니까)
    wire sum;
    wire cout;

    // 3. 모듈 연결 (안전한 '이름 연결' 방식)
    full_adder u1 (a, b, cin, sum, cout);


    // 4. 테스트 시나리오 (총 8가지 경우의 수)
    initial begin
        $display("=== Full Adder Simulation Start ===");
        // 값이 바뀔 때마다 자동으로 출력해주는 모니터링
        $monitor("Time=%0t | A=%b B=%b Cin=%b | Sum=%b Cout=%b", 
                 $time, a, b, cin, sum, cout);

        // 000 ~ 111 까지 순서대로 입력
        {a, b, cin} = 3'b000; #10; // 0+0+0 = 00
        {a, b, cin} = 3'b001; #10; // 0+0+1 = 01
        {a, b, cin} = 3'b010; #10; // 0+1+0 = 01
        {a, b, cin} = 3'b011; #10; // 0+1+1 = 10 (Carry 발생!)
        
        {a, b, cin} = 3'b100; #10; // 1+0+0 = 01
        {a, b, cin} = 3'b101; #10; // 1+0+1 = 10 (Carry 발생!)
        {a, b, cin} = 3'b110; #10; // 1+1+0 = 10 (Carry 발생!)
        {a, b, cin} = 3'b111; #10; // 1+1+1 = 11 (Sum=1, Carry=1) -> ★중요★

        $display("=== Simulation Finish ===");
        $stop;
    end

endmodule