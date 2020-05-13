`timescale 1ns / 1ps
module allocate_box(input clk, input[2:0] state, input[15:0] box, 
output reg[3:0] B_num, output reg D_delay = 0);
    parameter s1 = 3'b001; 
    reg find = 0; 
    reg[3:0] allocated;
    integer i;
    wire[3:0] rand;
    box_counter bc(clk, rand); 
    always @(*) begin
        allocated = rand;
        find = 0;
        for (i=0; i<16; i=i+1) begin
            if (box[(rand+i) % 16] == 0 && ~find) begin
                allocated = rand + i;
                find = 1;
            end
        end
    end
    always @(posedge clk) begin
        if (state == s1 && ~D_delay) begin
            B_num <= allocated;
            D_delay <= 1;
        end
        if (state != s1) begin
            D_delay <= 0;
        end
    end
endmodule