`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/16 10:09:38
// Design Name: 
// Module Name: main
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


module main(
    input clk, input[15:0] sw, input key1,
    input key2, input key3, input key4, 
    output[15:0] led, output[7:0] len, 
    output[7:0] segs0, output[7:0] segs1
    );
    wire clk1;
    wire key1_de,key2_de,key3_de,key4_de;
    wire [15:0] B_in;
    wire [15:0] B_out;
    wire [4:0] E_boxes;
    wire full;
    wire [3:0] B_num;
    wire [3:0] B_clear;
    wire [2:0] state;
    wire [15:0] code;
    wire correct;
    wire B_ready;
   
    clock_1khz c1(clk,clk1);
    reg16 boxreg(.clk(clk), .d(B_in), .q(B_out), .E_count(E_boxes)); 
    assign full = (B_out == 16'hFFFF);
    debounce d1(clk1, key1, key1_de);
    debounce d2(clk1, key2, key2_de);
    debounce d3(clk1, key3, key3_de);
    debounce d4(clk1, key4, key4_de);
    
    Moore m(.clk(clk), .full(full), .key1(key1_de), .key2(key2_de), .key3(key3_de), .key4(key4_de), .correct(correct), .state(state)); // 有限状态机模块
    box_ctrl bxc(.clk(clk), .state(state), .box(B_out), .B_clear(B_clear), .B_num(B_num), .B_in(B_in), .alloc_ready(B_ready)); // 快递箱寄存器控制模块
    led_ctrl ldc(.clk(clk), .state(state), .B_out(B_out), .B_num(B_num), .B_clear(B_clear), .led(led)); // LED灯控制模块
    code_ctrl co(.clk(clk), .state(state), .box(B_out), .sw(sw), .B_ready(B_ready), .randbox(B_num), .B_clear(B_clear), .randcode(code), .correct(correct)); // 密码控制模块
    dignt_ctrl digc(.clk(clk1), .state(state), .E_boxes(E_boxes), .B_num(B_num), .code(code), .sw(sw), .len(len), .segs0(segs0), .segs1(segs1)); // 数码管控制模块
endmodule
