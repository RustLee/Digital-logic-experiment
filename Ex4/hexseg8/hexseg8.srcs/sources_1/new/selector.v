`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 23:40:51
// Design Name: 
// Module Name: selector
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


module selector(
    input [7:0] en,
    input clk,
    output reg [7:0] an
    );
    reg [3:0] cur;
    initial begin
        cur <= 4'd0;
        an <= 8'd0;
        end
        always@(posedge clk or negedge en)
            begin
                cur = cur + 1;
                if(en[0] != 0 && cur == 1)
                begin
                    an <= 8'b00000001;
                end
                else if(en[1] != 0 && cur == 2)
                begin
                    an <= 8'b00000010;
                end
                else if(en[2] != 0 && cur == 3)
                begin
                    an <= 8'b00000100;
                end
                else if(en[3] != 0 && cur == 4)
                begin
                    an <= 8'b00001000;
                end
                else if(en[4] != 0 && cur == 5)
                begin
                    an <= 8'b00010000;
                end
                else if(en[5] != 0 && cur == 6)
                begin
                    an <= 8'b00100000;
                end
                else if(en[6] != 0 && cur == 7)
                begin
                    an <= 8'b01000000;
                end                                                                                                
                else if(en[7] != 0 && cur == 8)
                begin
                    an <= 8'b10000000;
                end            
                else if(en == 8'd0)
                    begin
                        an <= 8'b00000000;
                    end
                end
endmodule
