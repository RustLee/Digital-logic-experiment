`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/05 09:04:15
// Design Name: 
// Module Name: Ex_1_sim
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


module Ex_1_sim();
    //input
    reg[7:0] sw = 8'h00;
    //output
    wire[7:0] led;
    //instantiate the Unit under test 
    Ex_1 uut(
        .sw(sw),
        .led(led)
        );
always #10 sw = sw+1;
endmodule
