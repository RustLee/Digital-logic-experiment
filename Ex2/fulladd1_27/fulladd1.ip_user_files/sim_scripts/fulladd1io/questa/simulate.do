onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fulladd1io_opt

do {wave.do}

view wave
view structure
view signals

do {fulladd1io.udo}

run -all

quit -force
