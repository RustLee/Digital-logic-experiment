`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/06 12:07:39
// Design Name: 
// Module Name: add4_sim
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
module add4_sim( ); //input 
    reg [3:0] a = 4'd7; 
    reg [3:0] b = 4'd6;  
    reg cin= 0; //����Ϊ 0 
    //output 
    wire [3:0]sum; 
    wire cout; 
    add4 U(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout)); //���÷��� 2��ÿһ�����ĵ��ø�ʽΪ.[��ģ�������]([��ǰģ�������]) 
    initial begin 
    #20 begin a = 4'd15;b = 4'd1;end  //�ӷ���� 
    #20 begin a = 4'd13;b = 4'd2;
    end  
end endmodule
