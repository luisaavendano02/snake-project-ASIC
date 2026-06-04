# Pin assignments para Snake Game en DE1 (Cyclone II EP2C20F484C7)

# Reloj
set_location_assignment PIN_L1 -to CLOCK_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50

# Botones (KEY)
set_location_assignment PIN_B13 -to KEY[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[3]
set_location_assignment PIN_B14 -to KEY[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[2]
set_location_assignment PIN_B15 -to KEY[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[1]
set_location_assignment PIN_B16 -to KEY[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[0]

# Switch reset
set_location_assignment PIN_L22 -to SW[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[0]

# Display HEX0
set_location_assignment PIN_J2 -to HEX0[0]
set_location_assignment PIN_J1 -to HEX0[1]
set_location_assignment PIN_H2 -to HEX0[2]
set_location_assignment PIN_H1 -to HEX0[3]
set_location_assignment PIN_F2 -to HEX0[4]
set_location_assignment PIN_F1 -to HEX0[5]
set_location_assignment PIN_E2 -to HEX0[6]

# Display HEX1
set_location_assignment PIN_E1 -to HEX1[0]
set_location_assignment PIN_H6 -to HEX1[1]
set_location_assignment PIN_H5 -to HEX1[2]
set_location_assignment PIN_H4 -to HEX1[3]
set_location_assignment PIN_G3 -to HEX1[4]
set_location_assignment PIN_D2 -to HEX1[5]
set_location_assignment PIN_D1 -to HEX1[6]

# SPI (MAX7219)
set_location_assignment PIN_H13 -to MAX_DIN
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to MAX_DIN
set_location_assignment PIN_E15 -to MAX_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to MAX_CLK
set_location_assignment PIN_G15 -to MAX_CS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to MAX_CS
