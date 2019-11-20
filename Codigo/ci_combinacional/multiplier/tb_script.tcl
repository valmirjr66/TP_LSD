 if {[file exists work]} {
vdel -lib work -all
}
vlib work
vcom -explicit  -93 "multiplier.vhd"
vcom -explicit  -93 "tb_multiplier.vhd"
vsim -t 1ns   -lib work tb_multiplier
add wave sim:/tb_multiplier/*
#do {wave.do}
view wave
view structure
view signals
run 200ns
#quit -force

