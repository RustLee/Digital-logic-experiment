`timescale 1ns / 1ps
module led_ctrl(input clk, input[2:0] state, input[15:0] B_out, input[3:0] B_num, input[3:0] B_clear, output reg[15:0] led);
    parameter 
    s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b100,
    s3 = 3'b101,
    s4 = 3'b111,
    s5 = 3'b110;
    reg[15:0] led_next = 0;
    reg[25:0] count = 0;
    reg current = 1; 
    always @(*) begin
        case (state)
            s0: begin
                led_next = ~B_out;
            end
            s1: begin
                led_next[0] = (B_num == 0);
                led_next[1] = (B_num == 1);
                led_next[2] = (B_num == 2);
                led_next[3] = (B_num == 3);
                led_next[4] = (B_num == 4);
                led_next[5] = (B_num == 5);
                led_next[6] = (B_num == 6);
                led_next[7] = (B_num == 7);
                led_next[8] = (B_num == 8);
                led_next[9] = (B_num == 9);
                led_next[10] = (B_num == 10);
                led_next[11] = (B_num == 11);
                led_next[12] = (B_num == 12);
                led_next[13] = (B_num == 13);
                led_next[14] = (B_num == 14);
                led_next[15] = (B_num == 15);
            end
            s4: begin
                led_next[0] = (B_clear == 0) & current;
                led_next[1] = (B_clear == 1) & current;
                led_next[2] = (B_clear == 2) & current;
                led_next[3] = (B_clear == 3) & current;
                led_next[4] = (B_clear == 4) & current;
                led_next[5] = (B_clear == 5) & current;
                led_next[6] = (B_clear == 6) & current;
                led_next[7] = (B_clear == 7) & current;
                led_next[8] = (B_clear == 8) & current;
                led_next[9] = (B_clear == 9) & current;
                led_next[10] = (B_clear == 10) & current;
                led_next[11] = (B_clear == 11) & current;
                led_next[12] = (B_clear == 12) & current;
                led_next[13] = (B_clear == 13) & current;
                led_next[14] = (B_clear == 14) & current;
                led_next[15] = (B_clear == 15) & current;
            end
            default: begin
                led_next = 0; // LEDµ∆≤ª¡¡
            end
        endcase
    end
    always @(posedge clk) begin
        if (state == s4 && count == 26'd49999999) begin
            count <= 0;
            current <= ~current;
            led <= led_next;
        end
        else if (state == s4) begin
            count <= count + 1;
        end
        else begin
            count <= 0;
            led <= led_next;
        end
    end
endmodule