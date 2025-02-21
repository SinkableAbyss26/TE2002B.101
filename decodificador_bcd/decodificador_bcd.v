module decodificador_bcd(
	input [9:0] input_bin,
	output [0:6] U_disp, D_disp, C_disp, M_disp
);

	//Auxiliares
	wire [3:0] U_wire;
	wire [3:0] D_wire;
	wire [3:0] C_wire;
	wire [3:0] M_wire;
	
	//Separación de unidades
	assign U_wire = input_bin % 10;
	assign D_wire = input_bin % 100 /10;
	assign C_wire = input_bin % 1000 /100;
	assign M_wire = input_bin / 1000;
	
	//Instanciación de display
	dec_disp U_DISPLAY(.decoder_in(U_wire), .decoder_out(U_disp));
	dec_disp D_DISPLAY(.decoder_in(D_wire), .decoder_out(D_disp));
	dec_disp C_DISPLAY(.decoder_in(C_wire), .decoder_out(C_disp));
	dec_disp M_DISPLAY(.decoder_in(M_wire), .decoder_out(M_disp));

endmodule