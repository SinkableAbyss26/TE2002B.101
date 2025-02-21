Práctica Contador con One-Shot y Clock Divider

📌 Descripción

Este proyecto implementa y prueba un contador de 4bits con salida a un display de 7 segmentos capaz de contar tanto hacia adelante como hacia atras. El contador cuenta cada segundo, haciendo uso de un clock divider. Para el reset, se usa el push-button 0, el cual lleva integrado un one-shot para hacer el reset. Ademas, el contador tiene la funcionalidad de poder cargar un numero en binario de 4 bits con los primeros 4 switches, y cargarlo al contador con el penultimo. El ultimo switch es el encargado de la direccion del conteo. El switch en bajo cuenta hacia arriba, y el switch en alto cuenta hacia abajo.

⚙️ Requisitos

Quartus Prime (Intel FPGA)

FPGA compatible (DE10-LITE)

Cable de programación JTAG

📂 Estructura del Proyecto

/counter_clk

│── counter_clk.v                   # Módulo principal con el decodificador

│── counter_clk_tb.sv               # Testbench para simulación

│── counter_clk.qpf                 # Archivo del proyecto en Quartus

│── counter_clk.qsf                 # Archivo de configuración del FPGA

│── README.md                       # Este archivo