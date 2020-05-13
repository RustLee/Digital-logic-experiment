`timescale 1ns / 1ps
module delay_1s(input clk, input en, output reg D_delay = 0);
    reg[26:0] count = 0;
    always @(posedge clk) begin
        if (en == 0) begin
            count <= 0;
            D_delay <= 0;
        end
        else if (count == 28'd99999999) begin
            D_delay <= 1;
        end
        else begin
            count <= count + 1;
        end
    end
endmodule