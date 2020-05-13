`timescale 1ns / 1ps
module box_counter(input clk, output[3:0] randbox);
    reg[7:0] count = 8'h1B;
    assign randbox[3:0] = count[3:0];
    always @(posedge clk) 
        begin
            count <= (count == 8'hFF ? 8'h1B : count + 1);
        end
endmodule