module decodificador_bcd_tb #(parameter N = 10, ITERACIONES = 10)();

	reg [N-1 : 0] BCD_in_sw;

	wire[0:6] Display_U;
	wire[0:6] Display_D;
	wire[0:6] Display_C;
	wire[0:6] Display_M;


	decodificador_bcd DUT(
		.input_bin(BCD_in_sw), 
		.U_disp(Display_U),
		.D_disp(Display_D),
		.C_disp(Display_C),
		.M_disp(Display_M)
	);

	task set_input();
		BCD_in_sw = $urandom_range(2**N-1);
		$display("Valor a probar = %d", BCD_in_sw); 
		#10;
	endtask
	
	integer i;
	
	initial
		begin
			for(i = 0; i < ITERACIONES; i = i+1)
			begin
				set_input();
			end
		end

endmodule