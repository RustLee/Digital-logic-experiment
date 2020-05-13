`timescale 1ns / 1ps
module allocate_code(input clk, input[2:0] state, output reg[15:0] code);
    parameter s0 = 3'b000; 
    parameter s1 = 3'b001;
    reg[1:0] enable = 1; // ÔØÈëÊ¹ÄÜ
    wire[15:0] rand16;
    counter pc(clk, rand16);
    always @(posedge clk) begin
            case (state)
            s0: begin
                enable <= 1; 
            end
            s1: begin
                if (enable == 1) begin
                    code <= rand16;
                    enable <= 0; 
                end
            end
            default: ;
        endcase
    end
endmodule