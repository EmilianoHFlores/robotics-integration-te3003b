module wokwi (
    input in3,
    input in2,
    input in1,
    input in0,          // input bits
    output g,
    output f, 
    output e,
    output d,
    output c,
    output b,
    output a     // segment outputs
);

    // g = middle
    // f = top left
    // e = bottom left
    // d = bottom
    // c = bottom right
    // b = top right
    // a = top

    wire [3:0] in = {in3, in2, in1, in0};

    reg [6:0] segments;
    // assign the vector to the outputs
    assign {a,b,c,d,e,f,g} = segments;

    always @(*) begin
        case(in)
            4'h0: segments = 7'b1111110;  // 0
            4'h1: segments = 7'b0110000;  // 1
            4'h2: segments = 7'b1101101;  // 2
            4'h3: segments = 7'b1111001;  // 3
            4'h4: segments = 7'b0110011;  // 4
            4'h5: segments = 7'b1011011;  // 5
            4'h6: segments = 7'b1011111;  // 6
            4'h7: segments = 7'b1110000;  // 7
            4'h8: segments = 7'b1111111;  // 8
            4'h9: segments = 7'b1111011;  // 9
            4'ha: segments = 7'b1110111;  // A
            4'hb: segments = 7'b0011111;  // b
            4'hc: segments = 7'b1001110;  // C
            4'hd: segments = 7'b0111101;  // d
            4'he: segments = 7'b1001111;  // E
            4'hf: segments = 7'b1000111;  // F
            default: segments = 7'b0000000;
        endcase
    end

endmodule