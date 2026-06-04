# Script principal para crear el proyecto Snake Game en Quartus II
project_new snake_top -overwrite

# Configuracion del dispositivo
set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name TOP_LEVEL_ENTITY snake_top

# Archivos fuente Verilog
set_global_assignment -name VERILOG_FILE rtl/snake_top.v
set_global_assignment -name VERILOG_FILE rtl/game_core.v
set_global_assignment -name VERILOG_FILE rtl/spi_driver.v
set_global_assignment -name VERILOG_FILE rtl/seven_seg.v

# Cargar scripts de configuracion
source scripts/de1-pinmap.tcl
source scripts/options.tcl
set_global_assignment -name SDC_FILE scripts/de1.sdc

project_close
