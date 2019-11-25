if {[file exists work]} {
vdel -lib work -all
}

vlib work
vcom -explicit  -93 "registrador_16_bits.vhd"
vcom -explicit  -93 "flip_flop_d.vhd"
vcom -explicit  -93 "tb_registrador_16_bits.vhd"
vsim -t 1ns   -lib work tb_registrador_16_bits
add wave sim:/tb_registrador_16_bits/*
#do {wave.do}

view wave
view structure
view signals
run 200ns
#quit -force