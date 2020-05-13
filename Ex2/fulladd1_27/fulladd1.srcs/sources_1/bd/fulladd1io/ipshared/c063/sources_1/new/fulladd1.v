`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/06 10:48:38
// Design Name: 
// Module Name: fulladd1
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


module fulladd1(
    input a, //被加数 ai 
    input b, //加数 bi 
    input cin, //低位进位位 ci 
    output sum, //和 sumi 
    output cout //高位进位位 ci+1     
    );
assign sum = (a^b)^cin;
assign cout = (a & b) | (cin & ( a | b )) ;
endmodule
