transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/ALUNOS/Desktop/TP_LSD-master/Codigo/ci_combinacional/multiplier/full_adder_32_bits/full_adder/full_adder.vhd}
vcom -93 -work work {C:/Users/ALUNOS/Desktop/TP_LSD-master/Codigo/ci_combinacional/multiplier/full_adder_32_bits/full_adder_32_bits.vhd}

vcom -93 -work work {C:/Users/ALUNOS/Desktop/TP_LSD-master/Codigo/ci_combinacional/multiplier/full_adder_32_bits/tb_full_adder_32_bits.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  tb_full_adder_32_bits

add wave *
view structure
view signals
run 100 sec
