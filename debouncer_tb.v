module debouncer_tb();
	reg pb_1;
	reg clk;
	wire pb_out;
	
	debouncer_oneshot DUT(pb_1, clk, pb_out);
	
	initial begin
		clk = 0;
		forever #1 clk = ~clk;  // Generamos el reloj cada 10 unidades de tiempo
	end
	
	initial begin
		// Inicializar señales
		pb_1 = 0;
		#100_000 pb_1 = 1;
		#10_000 pb_1 = 0;
		#1_000_000 $stop; $finish;
	end
	
endmodule