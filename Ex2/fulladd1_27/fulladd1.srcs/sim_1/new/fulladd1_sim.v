`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/06 10:52:06
// Design Name: 
// Module Name: fulladd1_sim
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


`timescale 1ns / 1ps  
module fulladd1_sim( ); 
    //input 
    reg a = 0,b = 0;  
    reg cin= 0; //±ØÐëÎª 0 
    //output 
    wire sum,cout; 
    fulladd1 U1(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));  
    initial begin 
    #20 begin a = 0;b = 0; cin= 1;end 
    #20 begin a = 0;b = 1; cin= 0;end 
    #20 begin a = 0;b = 1; cin= 1;end 
    #20 begin a = 1;b = 0; cin= 0;end 
    #20 begin a = 1;b = 0; cin= 1;end 
    #20 begin a = 1;b = 1; cin= 0;end 
    #20 begin a = 1;b = 1; cin= 1;end 
    end 
endmodule
