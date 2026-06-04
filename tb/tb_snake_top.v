`timescale 1ns/1ps

module tb_snake_top;

    // Señales
    reg        CLOCK_50;
    reg [3:0]  KEY;
    reg [0:0]  SW;

    wire       MAX_DIN;
    wire       MAX_CLK;
    wire       MAX_CS;
    wire [6:0] HEX0;
    wire [6:0] HEX1;

    // Instancia del diseño
    snake_top dut (
        .CLOCK_50 (CLOCK_50),
        .KEY      (KEY),
        .SW       (SW),
        .MAX_DIN  (MAX_DIN),
        .MAX_CLK  (MAX_CLK),
        .MAX_CS   (MAX_CS),
        .HEX0     (HEX0),
        .HEX1     (HEX1)
    );

    // Reloj 50 MHz → periodo = 20 ns
    initial CLOCK_50 = 0;
    always #10 CLOCK_50 = ~CLOCK_50;

    // Volcado de ondas para GTKWave
    initial begin
        $dumpfile("sim/snake_top.vcd");
        $dumpvars(0, tb_snake_top);
    end

    // Estímulos
    initial begin
        SW  = 1'b0;  // reset activo
        KEY = 4'hF;  // botones sueltos
        #100;

        SW = 1'b1;   // liberamos reset
        #200;

        $display("Simulacion completada");
        $finish;
    end

endmodule
