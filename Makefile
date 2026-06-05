all: test_snake

test_snake:
	rm -rf sim/; mkdir sim/
	iverilog -o sim/tb_snake_top.vvp -s tb_snake_top tb/tb_snake_top.v rtl/snake_top.v rtl/game_core.v rtl/spi_driver.v rtl/seven_seg.v
	./sim/tb_snake_top.vvp

wave:
	gtkwave sim/snake_top.vcd

test_cocotb:
	export PYTHONPATH=$(PWD)/tb && \
	$(MAKE) -f $(shell cocotb-config --makefiles)/Makefile.sim \
		TOPLEVEL=snake_top \
		MODULE=tb_snake_top \
		VERILOG_SOURCES="rtl/snake_top.v rtl/game_core.v rtl/spi_driver.v rtl/seven_seg.v" \
		SIM=icarus \
		PYTHONPATH=$(PWD)/tb

# --- Síntesis FPGA con Quartus ---
project:
	quartus_sh -t snake_top.tcl

syn: project
	quartus_map snake_top

fit: syn
	quartus_fit snake_top

asm: fit
	quartus_asm snake_top

sta: asm
	quartus_sta snake_top

fpga: sta

program:
	quartus_pgm -m jtag -o "p;output_files/snake_top.sof"

clean:
	rm -rf sim/ sim_build/ results.xml output_files/ db/ incremental_db/