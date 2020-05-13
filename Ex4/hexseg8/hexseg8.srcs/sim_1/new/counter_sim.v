`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/20 00:53:47
// Design Name: 
// Module Name: counter_sim
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


module counter_sim(
    
    );
    reg clk = 1'd0;
    wire clock;
    wire divcount;
    wire [3:0] high;
    wire [3:0] low;
    fenpin_1khz u4(.clk(clk),.clock(clock));
    counter u5(.clk(clock),.high(high),.low(low));
    always
        begin
            #5 begin clk <= ~clk; end 
        end
    
endmodule
