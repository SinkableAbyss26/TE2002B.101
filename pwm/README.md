Práctica de PWM con contador como controlador para un servomotor de arduino

📌 Descripción

Este proyecto implementa y prueba un controlador PWM para un servomotor, el cual a través de los pushbuttons integrados en la tarjeta, podemos incrementar y decrementar el ciclo de trabajo de la señal de reloj generada a la salida, con la finalidad de alternar el estado en alto entre 1ms y 2ms para una señál de reloj de 10ms(50Hz).

⚙️ Requisitos

Quartus Prime (Intel FPGA)

FPGA compatible (DE10-LITE)

Cable de programación JTAG

📂 Estructura del Proyecto

/pwm

│── pwm.v                   # Módulo principal con de la maquina de estados

│── pwm.sv                  # Testbench para simulación

│── pwm.qpf                 # Archivo del proyecto en Quartus

│── pwm.qsf                 # Archivo de configuración del FPGA

── debouncer_one_shot.v     # Modulo principal del dobuncer

│── README.md               # Este archivo