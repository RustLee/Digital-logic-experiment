`timescale 1ns / 1ps
module counter(input clk, output reg[15:0] count);
    reg[19:0] count1 = 0;
    always @(posedge clk) begin        
        count1 <= count1 + 1;
        count <= count1[19:4];
    end

endmodule