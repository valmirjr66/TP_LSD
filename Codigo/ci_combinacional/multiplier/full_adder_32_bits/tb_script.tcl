 if {[file exists work]} {
vdel -lib work -all
}
vlib work
vcom -explicit  -93 "full_adder_32_bits.vhd"
vcom -explicit  -93 "full_adder/full_adder.vhd"
vcom -explicit  -93 "tb_full_adder_32_bits.vhd"
vsim -t 1ns   -lib work tb_full_adder_32_bits
add wave sim:/tb_full_adder_32_bits/*
#do {wave.do}
view wave
view structure
view signals
run 200ns
#quit -force

