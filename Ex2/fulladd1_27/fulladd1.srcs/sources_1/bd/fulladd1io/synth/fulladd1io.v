//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Wed Nov  6 11:22:28 2019
//Host        : stu13 running 64-bit major release  (build 9200)
//Command     : generate_target fulladd1io.bd
//Design      : fulladd1io
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "fulladd1io,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fulladd1io,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "fulladd1io.hwdef" *) 
module fulladd1io
   (a,
    b,
    cin,
    cout,
    sum);
  input a;
  input b;
  input cin;
  output cout;
  output sum;

  wire a_1;
  wire b_1;
  wire cin_1;
  wire fulladd1_0_cout;
  wire fulladd1_0_sum;

  assign a_1 = a;
  assign b_1 = b;
  assign cin_1 = cin;
  assign cout = fulladd1_0_cout;
  assign sum = fulladd1_0_sum;
  fulladd1io_fulladd1_0_0 fulladd1_0
       (.a(a_1),
        .b(b_1),
        .cin(cin_1),
        .cout(fulladd1_0_cout),
        .sum(fulladd1_0_sum));
endmodule
