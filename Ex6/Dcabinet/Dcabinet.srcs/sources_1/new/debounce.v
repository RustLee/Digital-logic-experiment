`timescale 1ns / 1ps
module debounce(input clk, input key, output reg result = 0);
 reg [3:0] count = 0;
 always @(posedge clk)
    begin
        if(count >= 4'd10 && result == 0)
            begin
                result <= 1;
            end
        if(key == 0)
            begin 
                count <= 0;
                result <= 0;
            end
        else if(count < 4'd10)
            begin
                count <= count + 1;
            end
    end
endmodule