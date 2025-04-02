`timescale 1ns/1ps

module seven_segment_tb;
    reg in0, in1, in2, in3;
    wire a, b, c, d, e, f, g;

    wokwi uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );

    integer i;
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, seven_segment_tb);
        $display("Starting seven_segment Testbench");

        {in3, in2, in1, in0} = 4'h2;
        #10;
        $display("Input = %h => a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b", 4'h2, a, b, c, d, e, f, g);

        {in3, in2, in1, in0} = 4'h5;
        #10;
        $display("Input = %h => a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b", 4'h5, a, b, c, d, e, f, g);

        {in3, in2, in1, in0} = 4'h8;
        #10;
        $display("Input = %h => a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b", 4'h8, a, b, c, d, e, f, g);

        {in3, in2, in1, in0} = 4'hE;
        #10;
        $display("Input = %h => a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b", 4'hE, a, b, c, d, e, f, g);

        $display("Ending seven_segment Testbench");
        $finish;
    end
endmodule