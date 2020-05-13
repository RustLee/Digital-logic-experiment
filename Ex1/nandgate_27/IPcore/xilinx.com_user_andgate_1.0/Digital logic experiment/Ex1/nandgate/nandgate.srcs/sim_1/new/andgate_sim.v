`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/06 21:05:50
// Design Name: 
// Module Name: andgate_sim
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


`timescale 1ns / 1ps module 
andgate_sim( );
    // input 
    reg a=0; 
    reg b=0; 
    reg c=1; 
    reg d=1; 
    reg e=1; 
    reg f=1; 
    reg g=1; 
    reg h=1;
    //output 
    wire q;
    // 实例化与门的时候，设定宽度为 1
    andgate #(8,1) u(.a(a),.b(b),.c(c),.d(d),
    .e(e),.f(f),.g(g),.h(h),.q(q)); 
    initial begin
    #100 a=1;
    #100 begin a=0;b=1;end
    #100 a=1;
    end 
endmodule
