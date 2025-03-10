module clkdiv #(parameter FREQ = 10_000)(
	input clk, 
	input rst,
	output reg clk_div
);

localparam CLK_FREQ = 50_000_000;
localparam COUNT_MAX = (CLK_FREQ/(2*FREQ));

reg [31:0] count;
	
always @(posedge clk or posedge rst)
begin
	if(rst)
		count <= 32'b0;
	else if(count == COUNT_MAX - 1)
		count <= 32'b0;
	else
		count <= count + 1;
end

always @(posedge clk or posedge rst)
begin
	if(rst)
		clk_div <= 1'b0;
	else if(count == COUNT_MAX - 1)
		clk_div <= ~clk_div;
	else
		clk_div <= clk_div;
end
	
endmodule
	