transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/PC/Quartus\ Projects/Sistemas_en_chip/counter {C:/Users/PC/Quartus Projects/Sistemas_en_chip/counter/one_shot.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Quartus\ Projects/Sistemas_en_chip/dec_disp {C:/Users/PC/Quartus Projects/Sistemas_en_chip/dec_disp/dec_disp.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Quartus\ Projects/Sistemas_en_chip/clock_divider {C:/Users/PC/Quartus Projects/Sistemas_en_chip/clock_divider/clkdiv.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Quartus\ Projects/Sistemas_en_chip/Practicas/counter_clk {C:/Users/PC/Quartus Projects/Sistemas_en_chip/Practicas/counter_clk/counter_clk.v}
vlog -vlog01compat -work work +incdir+C:/Users/PC/Quartus\ Projects/Sistemas_en_chip/Practicas/counter_clk {C:/Users/PC/Quartus Projects/Sistemas_en_chip/Practicas/counter_clk/counter.v}

vlog -vlog01compat -work work +incdir+C:/Users/PC/Quartus\ Projects/Sistemas_en_chip/Practicas/counter_clk {C:/Users/PC/Quartus Projects/Sistemas_en_chip/Practicas/counter_clk/counter_clk_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  counter_clk_tb

add wave *
view structure
view signals
run -all
