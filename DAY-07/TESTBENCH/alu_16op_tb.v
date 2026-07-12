module alu_16op_tb;

reg [3:0] A;
reg [3:0] B;
reg [15:0] button;

wire [7:0] out;

// Instantiate DUT
alu_16op uut (
    .A(A),
    .B(B),
    .button(button),
    .out(out)
);

initial begin
    // Initialize inputs
    A = 4'd9;
    B = 4'd3;
    button = 16'd0;

    // 1. ADD
    button = 16'd1;
    #10;

    // 2. SUB
    button = 16'd2;
    #10;

    // 3. AND
    button = 16'd4;
    #10;

    // 4. OR
    button = 16'd8;
    #10;

    // 5. Left Shift
    button = 16'd16;
    #10;

    // 6. Right Shift
    button = 16'd32;
    #10;

    // 7. XOR
    button = 16'd64;
    #10;

    // 8. NOT A
    button = 16'd128;
    #10;

    // 9. Multiply
    button = 16'd256;
    #10;

    // 10. Divide
    button = 16'd512;
    #10;

    // 11. NAND
    button = 16'd1024;
    #10;

    // 12. Shift Left by 2
    button = 16'd2048;
    #10;

    // 13. Shift Right by 2
    button = 16'd4096;
    #10;

    // 14. NOR
    button = 16'd8192;
    #10;

    // 15. Increment A
    button = 16'd16384;
    #10;

    // 16. Increment B
    button = 16'd32768;
    #10;

    // Test divide-by-zero
    A = 4'd9;
    B = 4'd0;
    button = 16'd512;
    #10;

    $finish;
end

// Display results
initial begin
    $display("---------------------------------------------------------------");
    $display("Time\tButton\t\tA\tB\tOutput");
    $display("---------------------------------------------------------------");
    $monitor("%0t\t%b\t%d\t%d\t%d", $time, button, A, B, out);
end

endmodule
