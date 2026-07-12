
module tb_segmentdisplay;

    // Inputs
    reg [3:0] B;

    // Outputs
    wire a, b, c, d, e, f, g, h;

    // Instantiate the Unit Under Test (UUT)
    segmentdisplay uut (
        .B(B),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h)
    );

    // Apply test vectors
    initial begin

        B = 4'b0000; #10;   // 0
        B = 4'b0001; #10;   // 1
        B = 4'b0010; #10;   // 2
        B = 4'b0011; #10;   // 3
        B = 4'b0100; #10;   // 4
        B = 4'b0101; #10;   // 5
        B = 4'b0110; #10;   // 6
        B = 4'b0111; #10;   // 7
        B = 4'b1000; #10;   // 8
        B = 4'b1001; #10;   // 9
        B = 4'b1010; #10;   // A
        B = 4'b1011; #10;   // B
        B = 4'b1100; #10;   // C
        B = 4'b1101; #10;   // D
        B = 4'b1110; #10;   // E
        B = 4'b1111; #10;   // F

        $finish;
    end

    // Monitor the signals
    initial begin
        $monitor("Time=%0t B=%b -> a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b",
                 $time, B, a, b, c, d, e, f, g, h);
    end

endmodule
