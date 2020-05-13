//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Wed Nov  6 11:22:28 2019
//Host        : stu13 running 64-bit major release  (build 9200)
//Command     : generate_target fulladd1io_wrapper.bd
//Design      : fulladd1io_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module fulladd1io_wrapper
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

  wire a;
  wire b;
  wire cin;
  wire cout;
  wire sum;

  fulladd1io fulladd1io_i
       (.a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .sum(sum));
endmodule
