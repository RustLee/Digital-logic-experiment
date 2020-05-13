`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 09:36:55
// Design Name: 
// Module Name: frequency_1khz_sim
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


module frequency_1khz_sim(

    );
    reg clk = 1'd0;
    wire clock;
    frequency_1khz u1(.clk(clk),.clock(clock));
    always
    begin
        #5 clk = ~clk;
    end
endmodule
