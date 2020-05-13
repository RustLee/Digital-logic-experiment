`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/25 10:22:44
// Design Name: 
// Module Name: divider_sim
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


module divider_sim(

    );
    reg clk = 1'd0;
    wire clk1 ;
    wire [16:0]divcount1;
    divider U(.clk(clk),.clk1(clk1),.divcount1(divcount1));
    always
    begin
        #10 begin clk <= ~clk;end
    end
endmodule
