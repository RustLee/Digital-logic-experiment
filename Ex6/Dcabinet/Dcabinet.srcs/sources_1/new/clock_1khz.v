`timescale 1ns / 1ps
module clock_1khz(input clk, output reg clk1 = 0);
    reg[15:0] divcount = 0;
    always @ (posedge clk) begin
        if (divcount == 16'd49999)
        begin
            divcount <= 0;
            clk1 <= ~clk1;
        end
        else
            divcount <= divcount + 1;
    end
endmodule