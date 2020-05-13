onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+fulladd1io -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fulladd1io xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {fulladd1io.udo}

run -all

endsim

quit -force
