module bitdown_asynch_tb;

reg clk;
reg rst;
wire [2:0] q;

// Instantiate the DUT
bitdown_asynch uut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial begin
    // Initialize
    clk = 0;
    rst = 1;

    // Apply reset
    #10;
    rst = 0;

    // Let the counter run
    #100;

    // Apply reset again
    rst = 1;
    #10;
    rst = 0;

    // Run again
    #50;

    $finish;
end

// Monitor outputs
initial begin
    $display("Time\tReset\tCounter");
    $monitor("%0t\t%b\t%b", $time, rst, q);
end

endmodule
