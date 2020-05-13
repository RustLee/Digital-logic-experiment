`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/25 10:21:16
// Design Name: 
// Module Name: divider
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


module divider(
    input clk,
    output reg clk1,
    output reg [16:0]divcount1
    );
    initial
    begin
    clk1 <= 1'b0;
    divcount1 <= 17'd0;
    end
    always@(posedge clk)
    begin
        if(divcount1==17'd49999)
        begin
            divcount1<=17'd0;
            clk1 <= ~clk1;
        end
        else divcount1 <= divcount1 + 1;
    end
    
endmodule
