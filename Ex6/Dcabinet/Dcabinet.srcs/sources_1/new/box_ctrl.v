`timescale 1ns / 1ps
module box_ctrl(input clk, input[2:0] state, input[15:0] box, input[3:0] B_clear, output[3:0] B_num, output reg[15:0] B_in = 0, output alloc_ready);
    parameter 
    s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b100,
    s3 = 3'b101,
    s4 = 3'b111,
    s5 = 3'b110;
    allocate_box alloc(.clk(clk), .state(state), .box(box), .B_num(B_num), .D_delay(alloc_ready)); //·ÖÅäÏäºÅÄ£¿é
    always @(posedge clk) begin
        case (state)
            s1: begin
                if (alloc_ready) begin
                    B_in[B_num] <= 1;
                end
            end
            s2: ;
            s3: ;
            s4: begin
                B_in[B_clear] <= 0;
            end
            s5: ;
            default: ;
        endcase
    end
endmodule