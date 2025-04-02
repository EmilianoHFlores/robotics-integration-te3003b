`timescale 1ns/1ps

module and_gate_tb;
    reg a;
    reg b;
    wire y;

    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, and_gate_tb);
        $display("Starting AND gate Testbench");

        a = 0; b = 0;
        #10;
        $display("Setting a=%b, b=%b, y=%b", a, b, y);

        a = 0; b = 1;
        #10;
        $display("Setting a=%b, b=%b, y=%b", a, b, y);

        a = 1; b = 0;
        #10;
        $display("Setting a=%b, b=%b, y=%b", a, b, y);

        a = 1; b = 1;
        #10;
        $display("Setting a=%b, b=%b, y=%b", a, b, y);

        $display("Ending AND gate Testbench");
        $finish;
    end
endmodule
