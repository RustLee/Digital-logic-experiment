`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/16 10:52:20
// Design Name: 
// Module Name: Moore
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


module Moore(
    input clk,
    input full,
    input key1,key2,key3,key4,
    input correct,
    output [2:0] state
    );
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b100;
    parameter s3 = 3'b101;
    parameter s4 = 3'b111;
    parameter s5 = 3'b110;
    reg [2:0] now_state = s0;
    reg [2:0] next_state;
    reg en;
    wire D_delay;
    delay_1s delay(.clk(clk), .en(en), .D_delay(D_delay));
    
    always @ (*)
        begin
        next_state = s0;
            case(now_state)
                s0:
                    begin
                        en = 0; 
                        if (key4 && ~full) begin
                            next_state = s1;end
                        else if (key2) begin
                            next_state = s2;end
                        else begin
                            next_state = s0;end
                    end
                s1: 
                    begin
                        en = 0; 
                        if (key1) begin
                            next_state = s0;end
                        else begin
                            next_state = s1;end
                    end
                s2: 
                    begin
                        en = 0; 
                        if (key3) begin
                            next_state = s3;end
                        else begin
                            next_state = s2;end
                    end
                s3: 
                    begin
                        en = 1; //ÑÓÊ±Ê¹ÄÜ
                        if (D_delay && correct) begin
                            next_state = s4;end
                        else if (D_delay && ~correct) begin
                            next_state = s5;end
                        else begin
                            next_state = s3;end
                    end
                s4: 
                    begin
                        en = 0; 
                        if (key1) begin
                            next_state = s0;end
                        else begin
                            next_state = s4;end
                    end
                s5: 
                    begin
                        en = 0; 
                        if (key1) begin
                            next_state = s0;end
                        else begin
                            next_state = s5;end
                    end
                default:begin
                    en = 0;
                    next_state = next_state;end
            endcase
        end
    always @(posedge clk) 
        begin
            now_state <= next_state;
        end
        assign state = now_state;
endmodule


