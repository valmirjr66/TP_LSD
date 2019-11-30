if {[file exists work]} {
    vdel -lib work -all
}

vlib work
vcom -explicit  -93 "sistema.vhd"

vcom -explicit  -93 "bloco_operacional/bloco_operacional.vhd"
vcom -explicit  -93 "bloco_operacional/mux_16_bits_1X2.vhd"
vcom -explicit  -93 "bloco_operacional/mux_16_bits_2X4.vhd"
vcom -explicit  -93 "bloco_operacional/shared/registrador_16_bits/registrador_16_bits.vhd"
vcom -explicit  -93 "bloco_operacional/shared/registrador_16_bits/flip_flop_d.vhd"
vcom -explicit  -93 "bloco_operacional/ci_sequencial/ci_sequencial.vhd"
vcom -explicit  -93 "bloco_operacional/ci_sequencial/shifter/shifter.vhd"
vcom -explicit  -93 "bloco_operacional/ci_combinacional/ci_combinacional.vhd"
vcom -explicit  -93 "bloco_operacional/ci_combinacional/ppa/ppa.vhd"
vcom -explicit  -93 "bloco_operacional/ci_combinacional/ppa/full_adder/full_adder.vhd"
vcom -explicit  -93 "bloco_operacional/ci_combinacional/multiplier/multiplier.vhd"

vcom -explicit  -93 "bloco_controle/bloco_controle.vhd"

vcom -explicit  -93 "tb_sistema.vhd"
vsim -t 1ns   -lib work tb_sistema
add wave sim:/tb_sistema/*
#do {wave.do}

view wave
view structure
view signals
run 200ns
#quit -force