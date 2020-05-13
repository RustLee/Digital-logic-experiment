vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/fulladd1io/ipshared/c063/sources_1/new/fulladd1.v" \
"../../../bd/fulladd1io/ip/fulladd1io_fulladd1_0_0/sim/fulladd1io_fulladd1_0_0.v" \
"../../../bd/fulladd1io/sim/fulladd1io.v" \


vlog -work xil_defaultlib \
"glbl.v"

