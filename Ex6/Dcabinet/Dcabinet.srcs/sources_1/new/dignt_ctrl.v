`timescale 1ns / 1ps
module dignt_ctrl(input clk, input[2:0] state, input[4:0] E_boxes, 
                  input[3:0] B_num, input[15:0] code, input[15:0] sw, 
                  output[7:0] len, output[7:0] segs0, output[7:0] segs1);
    parameter 
    s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b100,
    s3 = 3'b101,
    s4 = 3'b111,
    s5 = 3'b110;
    reg[7:0] en;
    reg[1:0] sel0 = 0;
    reg[1:0] sel1 = 0;
    reg[3:0] hexad0;
    reg[3:0] hexad1;
    wire E_tens; 
    wire[3:0] E_ones; 
    reg[4:0] B_num_2; 
    wire B_num_tens; 
    wire[3:0] B_num_ones; 
    reg[15:0] inputcode; 
    dignt dig1(.en(en[3:0]), .sel(sel0), .hexad(hexad0), .ce(len[3:0]), .seg(segs0)); 
    dignt dig2(.en(en[7:4]), .sel(sel1), .hexad(hexad1), .ce(len[7:4]), .seg(segs1)); 
    hextodec htd1(.hex(E_boxes), .tens(E_tens), .ones(E_ones)); 
    hextodec htd2(.hex(B_num_2), .tens(B_num_tens), .ones(B_num_ones)); 
    always @(B_num) begin
        B_num_2 = B_num + 1; 
    end
    always @(*) begin
        case (state)
            s0: begin
                en = 8'b11000000; 
            end
            s1: begin
                en = 8'b11110011; 
            end
            s3: begin
                en = 8'b11110000; 
            end
            s5: begin
                en = 8'b11111111; 
            end
            default: begin
                en = 0;
            end
        endcase
    end
    always @(posedge clk) begin
        sel0 <= sel0 + 1;
        case (state)
            s1: begin
                case (sel0)
                    0: hexad0 <= B_num_ones;
                    3: hexad0 <= B_num_tens;
                    default: ;
                endcase
            end
            s2: ;
            s3: ;
            s4: ;
            s5: begin
                hexad0 <= 8; 
            end
            default: ;
        endcase
    end
    always @(posedge clk) begin
    sel1 <= sel1 + 1;
        case (state)
            s0: begin
                case (sel1)
                    1: hexad1 <= E_tens;
                    2: hexad1 <= E_ones;
                    default: ;
                endcase
            end
            s1: begin
                case (sel1)
                    0: hexad1 <= code[11:8];
                    1: hexad1 <= code[7:4];
                    2: hexad1 <= code[3:0];
                    3: hexad1 <= code[15:12];
                endcase
            end
            s2: ;
            s3: begin
                case (sel1)
                    0: hexad1 <= inputcode[11:8];
                    1: hexad1 <= inputcode[7:4];
                    2: hexad1 <= inputcode[3:0];
                    3: hexad1 <= inputcode[15:12];
                endcase
            end
            s4: ;
            s5: begin
                hexad1 <= 8; 
            end
            default: ;
        endcase
    end
    always @(posedge clk) begin
        if (state == s2) begin
            inputcode <= sw; 
        end
    end
endmodule