`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/11 19:27:23
// Design Name: 
// Module Name: dffe_sim
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


module dffe_sim(

    );
    reg clk = 1'b0;
    reg clrn = 1'b1;
    reg wen = 1'b1;
    reg d = 1'b1;
    wire q;
    
//请补全

    
    always begin
        #10 clk=~clk;
    end
    initial begin
        #25 begin clrn = 1'b0; wen = 1'b0; end
        #10 begin clrn = 1'b1; wen = 1'b1; end
        #30 wen = 1'b0;
		
//请补全
        #30 $finish;
    end
endmodule
