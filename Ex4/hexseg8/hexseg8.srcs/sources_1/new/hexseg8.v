`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/17 09:11:57
// Design Name: 
// Module Name: hexseg8
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


module hexseg8(
    input wire [3:0] hex0,
    input wire [3:0] hex1,
    input [7:0] en,
    input s3,
    input clk,
    output reg [7:0] segs0,
    output reg [7:0] segs1,
    output reg [7:0] len
    );
    wire [7:0] hexled_l;
    wire [7:0] hexled_r;
    wire [7:0] an;
    wire [3:0] counter_h;
    wire [3:0] counter_l;
    wire [7:0] counterled_h;
    wire [7:0] counterled_l;
    wire clock;
    
    frequency_1khz u1(.clk(clk),.clock(clock));
    selector u2(.en(en),.clk(clock),.an(an));
    transcoding u3(.clk(clk),.number(hex0),.led(hexled_l));
    transcoding u4(.clk(clk),.number(hex1),.led(hexled_r));
    counter u5(.clk(clock),.s3(s3),.high(counter_h),.low(counter_l));
    transcoding u6(.clk(clk),.number(counter_h),.led(counterled_h));
    transcoding u7(.clk(clk),.number(counter_l),.led(counterled_l));
    always@(posedge clk)
    begin
        case(an)
            8'b00000000:
                begin
                    segs0 <= 8'd0;
                    segs1 <= 8'd0;
                    len <= 8'd0;
                    end
            8'b00000001:
                begin
                    if(en[0]==1)
                        begin
                        segs0 <= 8'b11111100;
                        len <= 8'b00000001;
                        end
                    else
                        begin
                            segs0 <= 8'd0;
                            len[0] <= 1'd0;
                            end
                            segs1 <= 8'd0;
                            end
            8'b00000010:
                begin
                    if(en[1]==1)
                        begin
                        segs0 <= 8'b10110110;
                        len <= 8'b00000010;
                        end
                    else
                        begin
                            segs0 <= 8'd0;
                            len[1] <= 1'd0;
                            end
                            segs1 <= 8'd0;
                            end
            8'b00000100:
                begin
                    if(en[2]==1)
                        begin
                        segs0 <= 8'b11011010;
                        len <= 8'b00000100;
                        end
                    else
                        begin
                            segs0 <= 8'd0;
                            len[2] <= 1'd0;
                            end
                            segs1 <= 8'd0;
                            end 
            8'b00001000:
                begin
                    if(en[3]==1)
                        begin
                        segs0 <= 8'b11100000;
                        len <= 8'b00001000;
                        end
                    else
                        begin
                            segs0 <= 8'd0;
                            len[3] <= 1'd0;
                            end
                            segs1 <= 8'd0;
                            end
            8'b00010000:
                begin
                    if(en[4]==1)
                        begin
                        segs1 <= counterled_h;
                        len <= 8'b00010000;
                        end
                    else
                        begin
                            segs1 <= 8'd0;
                            len[4] <= 1'd0;
                            end
                            segs0 <= 8'd0;
                            end
            8'b00100000:
                begin
                    if(en[5]==1)
                        begin
                        segs1 <= counterled_l;
                        len <= 8'b00100000;
                        end
                    else
                        begin
                            segs1 <= 8'd0;
                            len[5] <= 1'd0;
                            end
                            segs0 <= 8'd0;
                            end
            8'b01000000:
                begin
                    if(en[6]==1)
                        begin
                        segs1 <= hexled_l;
                        len <= 8'b01000000;
                        end
                    else
                        begin
                            segs1 <= 8'd0;
                            len[6] <= 1'd0;
                            end
                            segs0 <= 8'd0;
                            end
            8'b10000000:
                begin
                    if(en[7]==1)
                        begin
                        segs1 <= hexled_r;
                        len <= 8'b10000000;
                        end
                    else
                        begin
                            segs1 <= 8'd0;
                            len[7] <= 1'd0;
                            end
                            segs0 <= 8'd0;
                            end
            default:
                begin
                    segs1 <= 8'd0;
                    segs0 <= 8'd0;
                    len <=8'd0;
                    end
        endcase
    end
endmodule

