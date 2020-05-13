vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../bd/fulladd1io/ipshared/c063/sources_1/new/fulladd1.v" \
"../../../bd/fulladd1io/ip/fulladd1io_fulladd1_0_0/sim/fulladd1io_fulladd1_0_0.v" \
"../../../bd/fulladd1io/sim/fulladd1io.v" \


vlog -work xil_defaultlib \
"glbl.v"

