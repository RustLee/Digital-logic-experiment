`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 09:28:23
// Design Name: 
// Module Name: frequency_1khz
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


module frequency_1khz(
    input clk,
    output reg clock
    );
    reg [16:0] divcount;
    initial
        begin
            clock <= 1'b0;
            divcount <= 17'd0;
        end
        always@(posedge clk)
        begin
            if(divcount == 17'd49999)
            begin
                divcount <= 17'd0;
                clock <= ~clock;
            end
            else divcount <= divcount + 1;
        end
endmodule
