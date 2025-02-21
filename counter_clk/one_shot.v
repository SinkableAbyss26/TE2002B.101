module one_shot(
	input clk, button,
	output reg one_shot_out 
);

	// Señales Auxiliares
	reg delay_b;	
	
	always @(posedge clk)
	begin
		delay_b <= button;
		if((delay_b != button) && button)
			one_shot_out <= 1;
		else
			one_shot_out <= 0;
	end

endmodule