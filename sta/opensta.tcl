# OpenSTA - Static Timing Analysis para Snake Game
set PDK_ROOT $env(PDK_ROOT)
set PDK $env(PDK)

set lib_dir ${PDK_ROOT}/${PDK}/libs.ref/sky130_fd_sc_hd

# Cargar libreria de celdas
read_liberty ${lib_dir}/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Cargar netlist gate-level
read_verilog "../yosys/synth/snake_top_gl.v"
link_design snake_top

# Definir restriccion de reloj (50 MHz = 20 ns)
create_clock -name clk_sys -period 20 [get_ports CLOCK_50]

# Generar reporte de timing
report_checks -path_group clk_sys -path_delay max > "./sta.rpt"

puts "STA completado - reporte generado en sta.rpt"
