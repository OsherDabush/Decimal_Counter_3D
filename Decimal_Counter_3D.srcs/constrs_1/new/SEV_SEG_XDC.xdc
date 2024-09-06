## Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK100MHZ]							
	set_property IOSTANDARD LVCMOS33 [get_ports CLK100MHZ]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK100MHZ]
 
## Switches
set_property PACKAGE_PIN V17 [get_ports {TOP_COUNT[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {TOP_COUNT[0]}]
set_property PACKAGE_PIN V16 [get_ports {TOP_COUNT[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {TOP_COUNT[1]}]
set_property PACKAGE_PIN W16 [get_ports {TOP_COUNT[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {TOP_COUNT[2]}]
set_property PACKAGE_PIN W17 [get_ports {TOP_COUNT[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {TOP_COUNT[3]}]

## LEDs
set_property PACKAGE_PIN L1 [get_ports {LED}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED}]
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {SEVEN_SEG[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEVEN_SEG[6]}]
set_property PACKAGE_PIN W6 [get_ports {SEVEN_SEG[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEVEN_SEG[5]}]
set_property PACKAGE_PIN U8 [get_ports {SEVEN_SEG[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEVEN_SEG[4]}]
set_property PACKAGE_PIN V8 [get_ports {SEVEN_SEG[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEVEN_SEG[3]}]
set_property PACKAGE_PIN U5 [get_ports {SEVEN_SEG[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEVEN_SEG[2]}]
set_property PACKAGE_PIN V5 [get_ports {SEVEN_SEG[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEVEN_SEG[1]}]
set_property PACKAGE_PIN U7 [get_ports {SEVEN_SEG[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEVEN_SEG[0]}]


set_property PACKAGE_PIN U2 [get_ports {ANODES[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ANODES[0]}]
set_property PACKAGE_PIN U4 [get_ports {ANODES[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ANODES[1]}]
set_property PACKAGE_PIN V4 [get_ports {ANODES[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ANODES[2]}]
set_property PACKAGE_PIN W4 [get_ports {AN_3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {AN_3}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports RESET]						
	set_property IOSTANDARD LVCMOS33 [get_ports RESET]

