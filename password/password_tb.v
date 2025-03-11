module password_tb();
	reg clk, rst;
	reg [9:0] sw_input;
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;

	password DUT(clk, rst, sw_input, HEX0, HEX1, HEX2, HEX3, HEX4);
	
	initial begin
		clk = 0;
		forever #1 clk = ~clk;  // Generamos el reloj cada 10 unidades de tiempo
	end
	
	initial begin
		// Inicializar señales
		rst = 1; sw_input = 10'b000_000_000_0;
		#10 	rst = 0;
		#10 	rst = 1;
		#10 	sw_input = 10'b010_000_000_0;
		#10	sw_input = 10'b000_000_000_0;
		#10 	sw_input = 10'b000_000_000_0;
		#10	sw_input = 10'b000_010_000_0; 
		#10 	sw_input = 10'b000_000_000_0;
		#10	sw_input = 10'b001_000_000_0; 
		#10 	sw_input = 10'b000_000_000_0;
		#10	$stop; $finish;
	end

endmodule
