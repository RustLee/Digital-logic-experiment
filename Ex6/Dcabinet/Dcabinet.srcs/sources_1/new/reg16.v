`timescale 1ns / 1ps
module reg16(input clk, input[15:0] d, output reg[15:0] q = 0, output[4:0] E_count);
    assign E_count = ~d[0] + ~d[1] + ~d[2] + ~d[3] + ~d[4] + ~d[5] + ~d[6] + ~d[7] + ~d[8] + ~d[9] + ~d[10] + ~d[11] + ~d[12] + ~d[13] + ~d[14] + ~d[15];
    always @(posedge clk) begin
        q <= d;
    end
endmodule