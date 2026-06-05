# Script de sintesis Yosys para Snake Game
# RTL -> Gate Level Netlist usando Sky130A PDK

# Cargar libreria de celdas estandar
set PDK_ROOT $env(PDK_ROOT)
set PDK $env(PDK)
set std_cells_lib $PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys read_liberty -lib ${std_cells_lib}

# Leer archivos fuente Verilog
yosys read_verilog ../rtl/snake_top.v
yosys read_verilog ../rtl/game_core.v
yosys read_verilog ../rtl/spi_driver.v
yosys read_verilog ../rtl/seven_seg.v

# Elaboracion
yosys hierarchy -check -top snake_top
yosys flatten

# Sintesis coarse-grain
yosys proc
yosys fsm
yosys wreduce
yosys peepopt
yosys share
yosys opt -noff
yosys memory
yosys opt_dff
yosys techmap

# Mapeo tecnologico
set period_ps 20000
yosys dfflibmap -liberty ${std_cells_lib}
yosys abc -liberty ${std_cells_lib} -D ${period_ps}

# Preparacion para Place and Route
yosys splitnets
yosys setundef -zero
yosys hilomap -hicell sky130_fd_sc_hd__conb_1 HI -locell sky130_fd_sc_hd__conb_1 LO
yosys write_verilog -noattr -simple-lhs synth/snake_top_gl.v

puts "Sintesis completada exitosamente"
