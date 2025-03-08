module Frecuenciometro(
	input clk, rst, pin_in,
   output [0:6] disp0, disp1, disp2, disp3, disp4, disp5
);

wire rst_not = ~rst;
wire rst_db;
reg pin_in_prev;
reg [31:0] clk_counter;
reg [26:0] counter;
reg [26:0] frequency;

reg [3:0] digit0;
reg [3:0] digit1;
reg [3:0] digit2;
reg [3:0] digit3;
reg [3:0] digit4;
reg [3:0] digit5;

parameter WINDOW_SIZE = 50_000_000;
parameter CALIBRATION_FACTOR = 1012;

debouncer_oneshot U1(rst_not, clk, rst_db);
dec_disp disp_0(digit0, disp0);
dec_disp disp_1(digit1, disp1);
dec_disp disp_2(digit2, disp2);
dec_disp disp_3(digit3, disp3);
dec_disp disp_4(digit4, disp4);
dec_disp disp_5(digit5, disp5);

always @(posedge clk or posedge rst_db)
begin
   if(rst_db)
      pin_in_prev <= 0;
   else
      pin_in_prev <= pin_in;
end

always @(posedge clk or posedge rst_db)
begin
   if(rst_db) 
	begin
      counter <= 0;
      clk_counter <= 0;
      frequency <= 0;
	end 
	else 
	begin
      if(pin_in == 1 && pin_in_prev == 0) 
		begin
         counter <= counter + 1;
      end
      
      if(clk_counter < WINDOW_SIZE) 
		begin
			clk_counter <= clk_counter + 1;
		end 
		else 
		begin
			frequency <= (counter * CALIBRATION_FACTOR) / 1000;
			counter <= 0;
         clk_counter <= 0;
		end
	end
end

always @(posedge clk)
begin
   digit0 <= frequency % 10;
   digit1 <= (frequency / 10) % 10;
   digit2 <= (frequency / 100) % 10;
   digit3 <= (frequency / 1000) % 10;
   digit4 <= (frequency / 10000) % 10;
   digit5 <= (frequency / 100000) % 10;
end

endmodule