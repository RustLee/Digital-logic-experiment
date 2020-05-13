`timescale 1ns / 1ps
module dignt(input[3:0] en, input[1:0] sel, input[3:0] hexad, output[3:0] ce, output reg[7:0] seg);
    assign ce[0] = en[0] & ~sel[0] & ~sel[1];
    assign ce[1] = en[1] & sel[0] & ~sel[1];
    assign ce[2] = en[2] & ~sel[0] & sel[1];
    assign ce[3] = en[3] & sel[0] & sel[1];
    always @ (*) begin
        seg[7] = 0; 
        case (hexad)
        0: begin
            seg[0]=1; seg[1]=1; seg[2]=1; seg[3]=1; seg[4]=1; seg[5]=1; seg[6]=0;
        end
        1: begin
            seg[0]=0; seg[1]=1; seg[2]=1; seg[3]=0; seg[4]=0; seg[5]=0; seg[6]=0;
        end
        2: begin
            seg[0]=1; seg[1]=1; seg[2]=0; seg[3]=1; seg[4]=1; seg[5]=0; seg[6]=1;
        end
        3: begin
            seg[0]=1; seg[1]=1; seg[2]=1; seg[3]=1; seg[4]=0; seg[5]=0; seg[6]=1;
        end
        4: begin
            seg[0]=0; seg[1]=1; seg[2]=1; seg[3]=0; seg[4]=0; seg[5]=1; seg[6]=1;
        end
        5: begin
            seg[0]=1; seg[1]=0; seg[2]=1; seg[3]=1; seg[4]=0; seg[5]=1; seg[6]=1;
        end
        6: begin
            seg[0]=1; seg[1]=0; seg[2]=1; seg[3]=1; seg[4]=1; seg[5]=1; seg[6]=1;
        end
        7: begin
            seg[0]=1; seg[1]=1; seg[2]=1; seg[3]=0; seg[4]=0; seg[5]=0; seg[6]=0;
        end
        8: begin
            seg[0]=1; seg[1]=1; seg[2]=1; seg[3]=1; seg[4]=1; seg[5]=1; seg[6]=1;
        end
        9: begin
            seg[0]=1; seg[1]=1; seg[2]=1; seg[3]=1; seg[4]=0; seg[5]=1; seg[6]=1;
        end
        10: begin
            seg[0]=1; seg[1]=1; seg[2]=1; seg[3]=0; seg[4]=1; seg[5]=1; seg[6]=1;
        end
        11: begin
            seg[0]=0; seg[1]=0; seg[2]=1; seg[3]=1; seg[4]=1; seg[5]=1; seg[6]=1;
        end
        12: begin
            seg[0]=0; seg[1]=0; seg[2]=0; seg[3]=1; seg[4]=1; seg[5]=0; seg[6]=1;
        end
        13: begin
            seg[0]=0; seg[1]=1; seg[2]=1; seg[3]=1; seg[4]=1; seg[5]=0; seg[6]=1;
        end
        14: begin
            seg[0]=1; seg[1]=0; seg[2]=0; seg[3]=1; seg[4]=1; seg[5]=1; seg[6]=1;
        end
        15: begin
            seg[0]=1; seg[1]=0; seg[2]=0; seg[3]=0; seg[4]=1; seg[5]=1; seg[6]=1;
        end
        endcase
    end
endmodule