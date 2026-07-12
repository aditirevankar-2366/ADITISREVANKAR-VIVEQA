
module fsm_tb;

reg clk;
reg rst;
reg I;
wire OP;

// Instantiate the FSM
fsm uut (
    .clk(clk),
    .rst(rst),
    .I(I),
    .OP(OP)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    I = 0;

    // Reset
    #10 rst = 0;

    // Input sequence: 11010110110
    I = 1; #10;
    I = 1; #10;
    I = 0; #10;   // Detects 110

    I = 1; #10;
    I = 0; #10;
    I = 1; #10;

    I = 1; #10;
    I = 0; #10;   // Detects 110

    I = 1; #10;
    I = 1; #10;
    I = 0; #10;   // Detects 110

    #20;
    $finish;
end

// Monitor signals
initial begin
    $monitor("Time=%0t | rst=%b | I=%b | OP=%b",
              $time, rst, I, OP);
end

endmodule
