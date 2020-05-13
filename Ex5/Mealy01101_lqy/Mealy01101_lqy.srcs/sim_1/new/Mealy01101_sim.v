`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/02 21:20:06
// Design Name: 
// Module Name: Mealy01101_sim
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


module Mealy01101_sim(
    );
    reg clk,reset;
    reg [7:0] inputdata;
    reg next;
    wire outputSignal;
    Mealy01101 u(reset,clk,inputdata,next,outputSignal);
    initial begin
    next = 0;
    clk = 0;
    inputdata[7:0] = 8'b11101100;
    reset = 0;
//    #5 rst = 0;
//    #3 start = 0;
    #100 reset = 0;
    #50  reset = 1;
    #50  reset = 0;
    #50  reset = 1;
    #100 next = 1;
    #100 reset = 1;
    #100 reset = 0;
    #100 next = 1;
    #100 next = 0;
   
    end
    always #5 clk = ~clk;
endmodule
