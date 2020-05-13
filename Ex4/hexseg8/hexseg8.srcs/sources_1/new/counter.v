`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/20 00:38:43
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input s3,
    output reg [3:0] high,
    output reg [3:0] low 
    );
    reg [9:0] divcount;
    initial
        begin
            divcount <= 10'd0;
            high <= 4'd0;
            low <= 4'd0;
        end
    always@(posedge clk)
        begin
            if(s3 == 1)
                begin
                    high <= 4'd0;
                    low <= 4'd0;
                end
            if(divcount == 10'd999)
                begin
                    divcount <= 10'd0;
                    if(high == 4'd9 && low == 4'd9)
                        begin
                            low <= 4'd0;
                            high <= 4'd0;
                        end
                    else if(low == 4'd9)
                        begin
                            low <= 4'd0;
                            high <= high + 1;
                        end
                    else
                        begin
                            low <= low + 1;
                        end
                end
            else
                begin
                    divcount <= divcount + 1;
                end
        end
endmodule
