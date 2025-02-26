module elevador_5_pisos(
	input button, clk, rst_a_p,
	output reg [4:0] izqLed,
	output reg [4:0] derLed
);

parameter IDLE=0, OPEN=1, CLOSE=2;

reg[2:0] current_state;
reg[2:0] next_state;

wire rst_a_p_not = !rst_a_p;	//	Negacion de reset
wire button_not = !button;	// Negacion de boton
wire deb_button;	// Boton debounced
wire deb_rst;	// Reset debounced
wire FSMclk; // Reloj 2 Hz para FSM

debouncer_oneshot DB_RESET(rst_a_p_not, clk, deb_rst);
debouncer_oneshot DB_BUTTON(button_not, clk, deb_button);
clkdiv#(.FREQ(2)) CLK2HZ(clk, deb_rst, FSMclk);

always @(posedge FSMclk or posedge deb_rst)
	begin
		if(deb_rst)
			current_state <= IDLE;
		else
			current_state <= next_state;			
	end
	
always @(current_state, deb_button, izqLed, derLed)
	begin
		case(current_state)
		IDLE:
			begin
				if(deb_button)
					next_state = OPEN;
				else
					next_state = IDLE;
			end
		OPEN:
			begin
				if(izqLed == 0 && derLed == 0)
					next_state = CLOSE;
				else
					next_state = OPEN;
			end
		CLOSE:
			begin
				if(izqLed == 5'b11111 && derLed == 5'b11111)
					next_state = IDLE;
				else
					next_state = CLOSE;
			end
		endcase
	end
	
always @(posedge FSMclk)
begin
	case(current_state)
		IDLE:
			begin
			izqLed = 5'b11111;
			derLed = 5'b11111;
			end
		OPEN:
			begin
			izqLed = izqLed << 1;
			derLed = derLed >> 1;
			end
		CLOSE:
			begin
			izqLed = (izqLed >> 1) | 5'b10000;
			derLed = (derLed << 1) | 1;
			end
	endcase
end
endmodule