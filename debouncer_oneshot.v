module debouncer_oneshot(
	input pb_1,
	input clk,
	output pb_out
);

	wire Q0, Q1, Q2, Q2_bar;
	//wire slow_clk;
	
	//	Reducir el reloj
	//clk_10hz U1(clk, slow_clk);
	
	// Flip-flops
	d_ff d0(clk, pb_1, Q0);
	d_ff d1(clk, Q0, Q1);
	d_ff d2(clk, Q1, Q2);
	
	assign Q2_bar = ~Q2;
	assign pb_out = Q1 & Q2_bar;

endmodule


module d_ff(
	input slow_clk,
	input D,
	output reg Q
);

	always @(posedge slow_clk)
		begin
			Q <= D;
		end	
endmodule


/*module clk_10hz(
	input clk, 
	output reg slow_clk
);

localparam CLK_FREQ = 50_000_000;
localparam COUNT_MAX = (CLK_FREQ/(10*2));

reg [31:0] count = 0;

initial begin
	slow_clk = 1'b0;
end
	
always @(posedge clk)
begin
	if(count == COUNT_MAX - 1)
		count <= 32'b0;
	else
		count <= count + 1;
end

always @(posedge clk)
begin
	if(count == COUNT_MAX - 1)
		slow_clk <= ~slow_clk;
	else
		slow_clk <= slow_clk;
end
	
endmodule*/