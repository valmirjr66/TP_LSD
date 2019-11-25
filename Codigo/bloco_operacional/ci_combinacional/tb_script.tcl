if {[file exists work]} {
vdel -lib work -all
}

vlib work
vcom -explicit  -93 "ci_combinacional.vhd"
vcom -explicit  -93 "multiplier/multiplier.vhd"
vcom -explicit  -93 "ppa/ppa.vhd"
vcom -explicit  -93 "ppa/full_adder/full_adder.vhd"
vcom -explicit  -93 "tb_ci_combinacional.vhd"
vsim -t 1ns   -lib work tb_ci_combinacional
add wave sim:/tb_ci_combinacional/*
#do {wave.do}

view wave
view structure
view signals
run 200ns
#quit -force