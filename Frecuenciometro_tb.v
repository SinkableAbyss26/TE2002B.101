module Frecuenciometro_tb();
    reg clk;
    reg rst;
    reg pin_in;
    wire [0:6] disp0, disp1, disp2, disp3, disp4, disp5;
    
    Frecuenciometro DUT(
        .clk(clk),
        .rst(rst),
        .pin_in(pin_in),
        .disp0(disp0),
        .disp1(disp1),
        .disp2(disp2),
        .disp3(disp3),
        .disp4(disp4),
        .disp5(disp5)
    );
    
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        rst = 0;
        pin_in = 0;
        
        #100 rst = 1;
        #100 rst = 0;
        
        repeat (500000) 
		  begin
            pin_in = 1;
            #50000;
            pin_in = 0;
            #50000; 
        end
        #100000
        $finish;
    end
endmodule