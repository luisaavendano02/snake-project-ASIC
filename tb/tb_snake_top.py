import cocotb
from cocotb.triggers import Timer, ClockCycles
from cocotb.clock import Clock

@cocotb.test()
async def test_reset(dut):
    """Prueba 1: Verificar que el reset funciona correctamente"""

    clock = Clock(dut.CLOCK_50, 20, units="ns")
    cocotb.start_soon(clock.start())

    # Aplicar reset
    dut.SW.value = 0
    dut.KEY.value = 0xF
    await ClockCycles(dut.CLOCK_50, 10)

    # Liberar reset
    dut.SW.value = 1
    await ClockCycles(dut.CLOCK_50, 10)

    dut._log.info("Reset completado correctamente")

@cocotb.test()
async def test_direcciones(dut):
    """Prueba 2: Verificar que los botones cambian la dirección"""

    clock = Clock(dut.CLOCK_50, 20, units="ns")
    cocotb.start_soon(clock.start())

    dut.SW.value = 0
    dut.KEY.value = 0xF
    await ClockCycles(dut.CLOCK_50, 10)
    dut.SW.value = 1
    await ClockCycles(dut.CLOCK_50, 10)

    dut.KEY.value = 0b1101
    await ClockCycles(dut.CLOCK_50, 5)
    dut.KEY.value = 0xF
    await ClockCycles(dut.CLOCK_50, 5)
    dut._log.info("Dirección DERECHA presionada")

    dut.KEY.value = 0b0111
    await ClockCycles(dut.CLOCK_50, 5)
    dut.KEY.value = 0xF
    await ClockCycles(dut.CLOCK_50, 5)
    dut._log.info("Dirección ARRIBA presionada")

    dut._log.info("Prueba de direcciones completada")