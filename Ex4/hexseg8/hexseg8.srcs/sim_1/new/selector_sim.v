`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 23:36:57
// Design Name: 
// Module Name: selector_sim
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


module selector_sim(

    );
    reg clk = 1'd0;
    wire clock;
    wire [16:0] divcount;
    wire [7:0] en = 8'b10111111;
    wire [7:0] an;
    frequency_1khz u2(.clk(clk),.clock(clock));
    selector u3(.en(en),.clk(clock),.an(an));
    always
        begin
            #5 clk <= ~clk;
        end
endmodule
