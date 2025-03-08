module pwm (
   input rst_a_p, clk, btn_inc, btn_dec,
   output reg pwm_out
);
   wire up_btn, down_btn;  
   reg [31:0] counter = 0;
   reg [31:0] duty_cycle = 50_000;
   localparam inc = 5_000;
	localparam board_freq = 50_000_000;
	localparam target_freq = 50;
	localparam max_count = (board_freq / target_freq) - 1;
	
   debouncer_oneshot INC_BUTTON(
      .pb_1(btn_inc),
		.clk(clk),
      .pb_out(up_btn)
   );
    
   debouncer_oneshot DEC_BUTTON(
      .pb_1(btn_dec),
		.clk(clk),
      .pb_out(down_btn)
	);
    
   // Actualización del duty cycle
   always @(posedge clk or posedge rst_a_p) 
	begin
      if (rst_a_p)
         duty_cycle <= 25_000;
      else if (up_btn && duty_cycle < (max_count - inc))
         duty_cycle <= duty_cycle + inc;
      else if (down_btn && duty_cycle > inc)
         duty_cycle <= duty_cycle - inc;
		else
			duty_cycle <= duty_cycle;
   end
    
   // actualización del contador para el período de 20ms
   always @(posedge clk or posedge rst_a_p) 
	begin
      if (rst_a_p)
         counter <= 0;
      else if (counter < max_count)
         counter <= counter + 1;
      else 
         counter <= 0;
   end
    
   // generación de señal PWM
   always @(posedge clk or posedge rst_a_p) 
	begin
      if (rst_a_p)
         pwm_out <= 0;
      else if (counter < duty_cycle)
         pwm_out <= 1;
      else
         pwm_out <= 0;
   end
endmodule