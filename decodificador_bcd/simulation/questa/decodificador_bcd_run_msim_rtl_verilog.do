transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/PC/Quartus\ Projects/Sistemas_en_chip/dec_disp {C:/Users/PC/Quartus Projects/Sistemas_en_chip/dec_disp/dec_disp.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Quartus\ Projects/Sistemas_en_chip/decodificador_bcd {C:/Users/PC/Quartus Projects/Sistemas_en_chip/decodificador_bcd/decodificador_bcd.v}

vlog -sv -work work +incdir+C:/Users/PC/Quartus\ Projects/Sistemas_en_chip/decodificador_bcd {C:/Users/PC/Quartus Projects/Sistemas_en_chip/decodificador_bcd/decodificador_bcd_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  decodificador_bcd_tb

add wave *
view structure
view signals
run -all
