module counter_clk_tb();
	reg clk_reg, reset_reg, up_down_reg, load_reg;
	reg [3:0] data_in_reg;
	wire [0:6] disp_out_wire;
	
	counter_clk DUT(
	.clk(clk_reg), 
	.reset(reset_reg), 
	.up_down(up_down_reg),
	.load(load_reg),
	.data_in(data_in_reg),
	.disp_out(disp_out_wire)
	);
	
	initial begin
		clk_reg = 0; reset_reg = 1; up_down_reg = 0; load_reg = 0;
		data_in_reg = 4'b0000;
		#5		reset_reg = 0;
		#5		reset_reg = 1;
		#75	up_down_reg = 1;
		#50	data_in_reg = 4'b0101;
		#10	load_reg = 1;
		#15	load_reg = 0;
		#50	$stop;
	end
	
	always
		begin
			#1	clk_reg = ~clk_reg;
		end

endmodule