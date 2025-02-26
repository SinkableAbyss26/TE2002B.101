module doors_tb();
  // Señales de prueba
  reg button;           // Simulación del botón
  reg clk;              // Simulación del reloj
  reg rst_a_p;          // Señal de reset
  wire [4:0] izqLed;   // LEDs de la izquierda
  wire [4:0] derLed;   // LEDs de la derecha

  // Instanciar el módulo elevador_5_pisos
  elevador_5_pisos DUT (
    .button(button),
    .clk(clk),
    .rst_a_p(rst_a_p),
    .izqLed(izqLed),
    .derLed(derLed)
  );

  // Generador de reloj (simulamos un reloj de 50 MHz)
  initial begin
    clk = 0;
    forever #1 clk = ~clk;  // Generamos el reloj cada 10 unidades de tiempo
  end

  // Generar el estímulo de señales
  initial begin
    // Inicializar señales
    button = 1;
    rst_a_p = 1;
	 #20 rst_a_p = 0;// Activar reset
    #20 rst_a_p = 1;  // Desactivar reset después de 20 unidades de tiempo

    // Probar apertura y cierre
    #40 button = 0;  // Pulsamos el botón
    #40 button = 1;  // Soltamos el botón

    // Fin de la simulación
    #500 $stop; $finish;
  end

endmodule