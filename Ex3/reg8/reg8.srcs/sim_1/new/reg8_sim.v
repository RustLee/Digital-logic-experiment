`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/18 23:51:31
// Design Name: 
// Module Name: reg8_sim
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


module reg8_sim();
    reg clk=0;
    reg clrn=1;
    reg wen=1;
    reg [7:0] d=8'haa;
    wire [7:0] q;
    reg8 u1(clk,clrn,d,wen,q);
    always begin
        #10 clk=~clk;
    end
    initial begin
        #25 begin clrn=0;wen=0;end
        #10 begin clrn=1;wen=1;end
        #30 begin wen=0;end
        #15 begin d=8'hc9;end
        #30 $finish;
        end
endmodule
