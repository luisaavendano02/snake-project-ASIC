# Variables
NAME    = snake_top
RTL     = rtl/snake_top.v rtl/game_core.v rtl/spi_driver.v rtl/seven_seg.v
TB      = tb/tb_$(NAME).v
VVP     = sim/$(NAME).vvp
VCD     = sim/$(NAME).vcd

# Compilar y simular
sim: $(VVP)
	vvp $(VVP)

$(VVP): $(RTL) $(TB)
	iverilog -g2005 -Wall -o $(VVP) $(TB) $(RTL)

# Ver ondas
wave:
	gtkwave $(VCD) &

# Limpiar
clean:
	rm -f $(VVP) $(VCD)
