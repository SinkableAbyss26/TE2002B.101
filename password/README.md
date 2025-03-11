Práctica de Contraseña con Maquina de estados y mensaje de salida.

📌 Descripción

Este proyecto implementa y prueba un sistema de contraseña haciendo uso de 10 switches que representan los numeros del 0 al 9, en donde a traves de una maquina de estados, el sistema muestra un mensaje de done en los displays de 7 segmentos cuando la contraseña de 4 digitos es introducida correctamente y secuencialmente, de lo contrario imprime un mensaje de error y se reinicia el sistema.

⚙️ Requisitos

Quartus Prime (Intel FPGA)

FPGA compatible (DE10-LITE)

Cable de programación JTAG

📂 Estructura del Proyecto

/pwm

│── password.v              # Módulo principal con de la maquina de estados

│── password_tb.sv          # Testbench para simulación

│── password.qpf            # Archivo del proyecto en Quartus

│── password.qsf            # Archivo de configuración del FPGA

── debouncer_one_shot.v     # Modulo principal del dobuncer

│── README.md               # Este archivo