`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/02 21:16:25
// Design Name: 
// Module Name: Mealy01101
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


module Mealy01101(
input reset,
input clk,
input[7:0]inputdata,
input next,
output reg outputSignal
    );
    reg [3:0] nextstate;//下一状态
    reg [3:0] currentstate;//当前状态
    reg [2:0] count = 0;
    reg z=1'b0;
    
    parameter s0 = 4'b0000,
              s1 = 4'b0001,
              s2 = 4'b0010,
              s3 = 4'b0100,
              s4 = 4'b1000;
    
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
     else if((z==1)&&(nextstate==s2))
     outputSignal<=1;
     end
     
     always @(currentstate or count)
     begin
     case(currentstate)
     s0: nextstate=(inputdata[count]==0)?s1:s0;
     s1: nextstate=(inputdata[count]==1)?s2:s1;
     s2: nextstate=(inputdata[count]==1)?s3:s1;
     s3: nextstate=(inputdata[count]==0)?s4:s0;
     s4: nextstate=(inputdata[count]==1)?s2:s1;
     endcase
     end
     
     always @( currentstate )
     begin
     case(currentstate)
        s4:z <=(inputdata[count]==1)?1:0;
     default z <= 0;
     endcase
     end


endmodule
