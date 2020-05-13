`timescale 1ns / 1ps
module cam(input clk, input en, input dir, input[15:0] box,
           input[3:0] in_num, input[15:0] in_code, 
           output reg[3:0] out_num, output reg find = 0);
    reg[15:0] code_reg[0:15];
    integer i;
    reg[3:0] B_num;
    reg detected;
    always @(*) begin 
        B_num = 0;
        detected = 0;
        for (i=0; i<16; i=i+1) begin
            if (~detected && code_reg[i] == in_code && box[i] == 1) begin 
                B_num = i; 
                detected = 1; 
            end
            else begin
                B_num = B_num;
                detected = detected;
            end
        end
    end
    always @(posedge clk) begin
        if (en) begin
            case (dir)
                0: begin
                    code_reg[in_num] <= in_code; 
                end
                1: begin
                    find <= detected; 
                    out_num <= B_num; 
                end
            endcase
        end
        else begin
            find <= 0;
            out_num <= 0;
        end
    end
endmodule