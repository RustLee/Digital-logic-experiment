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
    input a, //������ ai 
    input b, //���� bi 
    input cin, //��λ��λλ ci 
    output sum, //�� sumi 
    output cout //��λ��λλ ci+1     
    );
assign sum = (a^b)^cin;
assign cout = (a & b) | (cin & ( a | b )) ;
endmodule
