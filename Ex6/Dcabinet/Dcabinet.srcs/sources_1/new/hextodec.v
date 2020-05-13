`timescale 1ns / 1ps
module hextodec(input[4:0] hex, output tens, output[3:0] ones);
    assign ones = hex % 10;
    assign tens = hex[4] | (hex[3] & (hex[2] | hex[1]));
endmodule