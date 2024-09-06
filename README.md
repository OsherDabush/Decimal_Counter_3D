System Description: Decimal_Counter_3D
The Decimal_Counter_3D system is designed to display a three-digit decimal number on the seven-segment displays of the BASYS3 FPGA board. The system counts upwards from "000" to a predefined value, which is specified by the binary input through the switches sw0-sw3. Once the counter reaches the selected value, an LED will light up to indicate that the value has been reached, and the counter will reset to "000" and begin a new count from the start, using the value currently set on the switches.

