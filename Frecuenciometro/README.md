Práctica de Frecuenciometro con salida a display de 7 segmentos.

📌 Descripción

Este proyecto implementa y prueba un Frecuenciometro con una frecuencia minima de 1Hz y una maxima de 100,000Hz, garantizando un error menor al %5. El proyecto muestra la frecuencia calculada en seis displays de 7 segmentos.
⚙️ Requisitos

Quartus Prime (Intel FPGA)

FPGA compatible (DE10-LITE)

Cable de programación JTAG

📂 Estructura del Proyecto

/decodificador_bcd

│── Frecuenciometro.v               # Módulo principal con del Frecuenciometro

│── Frecuenciometro_tb.sv           # Testbench para simulación

│── Frecuenciometro_bcd.qpf         # Archivo del proyecto en Quartus

│── Frecuenciometro.qsf             # Archivo de configuración del FPGA

── debouncer_one_shot               # Modulo principal del dobuncer

│── README.md                       # Este archivo