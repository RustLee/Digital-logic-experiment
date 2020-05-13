`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/17 21:57:13
// Design Name: 
// Module Name: main_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_sim(
    );
    reg clk = 0;
    always #5 clk = ~clk;
    reg[15:0] sw = 0;
    reg key1 = 0, key2 = 0, key3 = 0, key4 = 0;
    wire[15:0] led;
    wire[7:0] len, segs0, segs1;
    main mm(.clk(clk), .sw(sw), .key1(key1), .key2(key2), .key3(key3), .key4(key4), .led(led), .len(len), .segs0(segs0), .segs1(segs1));
    initial begin
        #25 key4 = 1;
        #25000000 key4 = 0;
        #15000000 key1 = 1;
        #15000000 key1 = 0;
        repeat(16) begin
            #15000000 key4 = 1;
            #25000000 key4 = 0;
            #15000000 key1 = 1;
            #15000000 key1 = 0;
        end
        #15000025 $finish;
    end
endmodule

