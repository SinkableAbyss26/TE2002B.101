module password(
	 input clk, rst,
	 input [9:0] sw_input,
	 output reg [6:0] HEX0, HEX1, HEX2, HEX3, HEX4
);
    localparam count_max = /*268_000_000*/5;
    wire [9:0] input_db;
    reg [27:0] counter;
    reg count_done;
    
    // Estados
    localparam IDLE = 3'b000;
    localparam CHECK1 = 3'b001;
    localparam CHECK2 = 3'b010;
    localparam CHECK3 = 3'b011;
    localparam ERROR = 3'b100;
    localparam DONE = 3'b101;
    
    reg [2:0] active_state, next_state;
    
    genvar i;
    generate
        for(i=0; i<10; i=i+1) begin: one_shot_input
            debouncer_oneshot U1(        
                .pb_1(sw_input[i]),
                .clk(clk),    
                .pb_out(input_db[i])  
            );  
        end  
    endgenerate
    
    // Bloque de estado y reset
    always @(posedge clk or negedge rst)
    begin
        if(~rst)
        begin
            active_state <= IDLE;
            count_done <= 0;
            counter <= 0;
        end
        else
        begin
            active_state <= next_state;
            
            // Lógica de contador para estados ERROR y DONE
            if(active_state == ERROR || active_state == DONE)
            begin
                if(counter < count_max)
                begin
                    counter <= counter + 1;
                    count_done <= 0;
                end
                else
                begin
                    counter <= 0;
                    count_done <= 1;
                end
            end
        end
    end
    
    // Lógica de transición de estados
    always @(*)
    begin
        case(active_state)
            IDLE:
                if(input_db == 10'b0100000000)
                    next_state = CHECK1;
                else if(input_db == 0)
                    next_state = IDLE;
                else
                    next_state = ERROR;
            
            CHECK1:
                if(input_db == 10'b0000100000)
                    next_state = CHECK2;
                else if(input_db == 0)
                    next_state = CHECK1;
                else
                    next_state = ERROR;
            
            CHECK2:
                if(input_db == 10'b0000000100)
                    next_state = CHECK3;
                else if(input_db == 0)
                    next_state = CHECK2;
                else
                    next_state = ERROR;
            
            CHECK3:
                if(input_db == 10'b0000000010)
                    next_state = DONE;
                else if(input_db == 0)
                    next_state = CHECK3;
                else
                    next_state = ERROR;
            
            ERROR:
                if(count_done == 1)
                    next_state = IDLE;
                else
                    next_state = ERROR;
            
            DONE:
                if(count_done == 1)
                    next_state = IDLE;
                else
                    next_state = DONE;
            
            default:
                next_state = IDLE;
        endcase
    end
    
    // Lógica de salida para los displays
    always @(*)
    begin
        case (active_state)
            ERROR:
            begin
                HEX4 = 7'b0000_110;
                HEX3 = 7'b0101_111;
                HEX2 = 7'b0101_111;
                HEX1 = 7'b0100_011;
                HEX0 = 7'b0101_111;
            end
            
            DONE:
            begin
                HEX4 = 7'b1111_111;
                HEX3 = 7'b0100_001;
                HEX2 = 7'b1000_000;
                HEX1 = 7'b1001_000;
                HEX0 = 7'b0000_110;
            end
            
            default:
            begin
                HEX4 = 7'b1000_000;
                HEX3 = 7'b1000_000;
                HEX2 = 7'b1000_000;
                HEX1 = 7'b1000_000;
                HEX0 = 7'b1000_000;
            end
        endcase
    end
endmodule