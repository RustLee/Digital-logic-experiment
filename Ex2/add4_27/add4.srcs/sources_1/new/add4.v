`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/06 11:46:34
// Design Name: 
// Module Name: add4
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


module add4( 
    input [3:0] a, //被加数  
    input [3:0] b, //加数  
    input cin, //低位进位 

    output cout, //进位  
    output [3:0] sum         //和 
    ); 
    wire [2:0] scout;   //用作保存中间进位 
    fulladd1 f0(a[0],b[0],cin,sum[0],scout[0]);
    //调用方法1，注意变量顺序必须严格对应子模块代码中声明模块输入输出的顺序 
    fulladd1 f1(a[1],b[1],scout[0],sum[1],scout[1]);
    fulladd1 f2(a[2],b[2],scout[1],sum[2],scout[2]);
    fulladd1 f3(a[3],b[3],scout[2],sum[3],cout);
endmodule
