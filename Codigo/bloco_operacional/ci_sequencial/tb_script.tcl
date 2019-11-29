if {[file exists work]} {
vdel -lib work -all
}

vlib work
vcom -explicit  -93 "ci_sequencial.vhd"
vcom -explicit  -93 "shifter/shifter.vhd"
vcom -explicit  -93 "../shared/registrador_16_bits/registrador_16_bits.vhd"
vcom -explicit  -93 "../shared/registrador_16_bits/flip_flop_d.vhd"
vcom -explicit  -93 "tb_ci_sequencial.vhd"
vsim -t 1ns   -lib work tb_ci_sequencial
add wave sim:/tb_ci_sequencial/*
#do {wave.do}

view wave
view structure
view signals
run 200ns
#quit -force