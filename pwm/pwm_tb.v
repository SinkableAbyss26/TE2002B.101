module pwm_tb();
	reg rst_a_p, clk, btn_inc, btn_dec;
	wire pwm_out;

	pwm DUT(rst_a_p, clk, btn_inc, btn_dec, pwm_out);


	initial begin
		clk = 0;
		forever #1 clk = ~clk;  // Generamos el reloj cada 10 unidades de tiempo
	end


	initial begin
		// Inicializar señales
		rst_a_p = 0; btn_inc = 0; btn_dec = 0;
		#100 rst_a_p = 1;
		#100 rst_a_p = 0;
		#100 	btn_inc = 1;
		#100	btn_inc = 0;
		#100 	btn_inc = 1;
		#100	btn_inc = 0; 
		#100 	btn_inc = 1;
		#100	btn_inc = 0; 
		#100 	btn_inc = 1;
		#100	btn_inc = 0;
		#100 	btn_dec = 1;
		#100	btn_dec = 0;
		#100 	btn_dec = 1;
		#100	btn_dec = 0; 
		#100 	btn_dec = 1;
		#100	btn_dec = 0; 
		#100 	btn_dec = 1;
		#100	btn_dec = 0;
		#100	$stop; $finish;
	end

endmodule