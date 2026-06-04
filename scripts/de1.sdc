# Restricciones de timing para Snake Game
# Reloj principal de 50 MHz (periodo = 20 ns)
create_clock -name "CLOCK_50" -period 20.000ns [get_ports {CLOCK_50}]

# Calcular automaticamente la incertidumbre del reloj
derive_clock_uncertainty

