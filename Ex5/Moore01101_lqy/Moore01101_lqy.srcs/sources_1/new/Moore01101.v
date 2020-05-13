`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/02 20:29:16
// Design Name: 
// Module Name: Moore01101
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


module Moore01101(
input reset,
input clk,
input [7:0] inputdata,
input next,
output reg outputSignal
    );
    reg [4:0] nextstate;//下一状态
    reg [4:0] currentstate;//当前状态
    reg [2:0] count = 0;
    reg z=1'b0;
    
    parameter s0 = 5'b00000,
                s1 = 5'b00001,
                s2 = 5'b00010,
                s3 = 5'b00100,
                s4 = 5'b01000,
                s5 = 5'b10000;
    
    initial begin
    currentstate <= s0;
    outputSignal <= 0;
    end
   
    always @ (posedge clk or posedge next or posedge reset)
    begin
         if(reset==1)
         currentstate <= s0;
         else
         begin
            currentstate <= nextstate;
            if(next==1)
            begin
                count <=0;
                currentstate <= s0;
            end
            else
            begin
                if(count<7)
                count <= count+1;
                else count <= 7;
            end
         end
     end
     
     
     always @(posedge z or posedge next or posedge reset)
     begin
     if(reset==1||next==1)
     outputSignal<=0;
     else if(z==1)
     outputSignal<=1;
     end
     
     always @(currentstate or count)
     begin
     case(currentstate)
     s0: nextstate=(inputdata[count]==0)?s1:s0;
     s1: nextstate=(inputdata[count]==1)?s2:s1;
     s2: nextstate=(inputdata[count]==1)?s3:s1;
     s3: nextstate=(inputdata[count]==0)?s4:s0;
     s4: nextstate=(inputdata[count]==1)?s5:s1;
     s5: nextstate=(inputdata[count]==1)?s3:s1;
     endcase
     end
     
     always @( currentstate )
     begin
     case(currentstate)
        s5:z <= 1;
     default z <= 0;
     endcase
     end
endmodule

