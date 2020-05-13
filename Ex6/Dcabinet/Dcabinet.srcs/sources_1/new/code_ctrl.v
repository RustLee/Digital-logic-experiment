`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/17 21:03:56
// Design Name: 
// Module Name: code_ctrl
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


module code_ctrl(input clk, input[2:0] state, input[15:0] box, input[15:0] sw, input[3:0] randbox, input B_ready, output[15:0] randcode, output reg[3:0] B_clear, output reg correct = 0);
    parameter 
    s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b100,
    s3 = 3'b101,
    s4 = 3'b111,
    s5 = 3'b110;
    reg en, dir;
    wire find;
    reg[15:0] code;
    reg[15:0] inputcode; 
    reg[3:0] box_to_write;
    wire[3:0] box_matched;
    allocate_code alloc(.clk(clk), .state(state), .code(randcode));
    cam codereg(.clk(clk), .en(en), .dir(dir), .box(box), .in_num(box_to_write), .in_code(code), .out_num(box_matched), .find(find));
    always @(*) begin
        dir = 1;
        box_to_write = 0;
        code = 0;
        case (state)
            s1: begin
                en = B_ready; 
                dir = 0;
                code = randcode;
                box_to_write = randbox;
            end
            s2: begin
                en = 0;
                dir = dir;
                code = code;
                box_to_write = box_to_write;
            end
            s3: begin
                en = 1;
                dir = 1;
                code = inputcode;
                box_to_write = box_to_write;
            end
            s4: begin
                en = 1;
                dir = 0;
                code = 0;
                box_to_write = B_clear;
            end
            default: begin
                en = 0;
                dir = dir;
                code = code;
                box_to_write = box_to_write;
            end
        endcase
    end
    always @(posedge clk) begin
        if (state == s2) begin
            inputcode <= sw;
        end
        if (state == s3) begin
            correct <= find;
            B_clear <= box_matched;
        end
    end
endmodule
