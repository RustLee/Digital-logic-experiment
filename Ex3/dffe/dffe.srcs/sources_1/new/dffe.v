`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 09:02:26
// Design Name: 
// Module Name: dffe
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


module dffe(clk,clrn,wen,d,q);
    input clk,clrn,wen,d;
    output q;
    reg q;
    
    always@(posedge clk or negedge clrn)
        begin
            if(!clrn)
                begin 
                    q<=0;
                end
            else if(!wen)
                begin
                    q<=d;
                end
            else
                begin
                    q<=q;
                end
            end            
endmodule
