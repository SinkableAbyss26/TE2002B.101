module counter_clk#(parameter CONSTANT_N = 2)(
	input clk, reset, up_down, load,
	input [3:0] data_in,
	output [0:6] disp_out
);
	wire clk_1S;
	wire reset_debounced;
	wire [3:0] count;
	wire reset_not = !reset;
	
	//	Debouncer en el push button de reset
	one_shot ONE_SHOT_RESET(
		.clk(clk),
		.button(reset_not),
		.one_shot_out(reset_debounced)
	);
	
	//	Instanciacion clock divider a 1S
	clkdiv #(.CONSTANT_N(CONSTANT_N)) CLOCK_DIV_1S(
	.clk(clk),
	.rst(reset_debounced),
	.clk_div(clk_1S)
	);
	
	//	Instanciacion del contador debounced
	counter CONTADOR_4BITS(
	.clk(clk_1S),
	.rst(reset_debounced),
	.up_down(up_down),
	.load(load),
	.data_in(data_in),
	.count(count)
	);
	
	//	Instanciacion Display 7 Seg
	dec_disp DISPLAY_7SEG(
	.decoder_in(count), 
	.decoder_out(disp_out));

endmodule