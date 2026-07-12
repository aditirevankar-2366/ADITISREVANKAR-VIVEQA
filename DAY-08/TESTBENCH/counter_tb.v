module counter_tb;

reg clk;
reg rst;
wire [3:0] count;

// Instantiate the DUT
counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;

    // Keep reset active for a few clock cycles
    #15;
    rst = 0;

    // Let the counter run
    #160;

    // Apply reset again
    rst = 1;
    #10;
    rst = 0;

    // Count again
    #50;

    $finish;
end

// Display the counter value
initial begin
    $display("Time\tReset\tCount");
    $monitor("%0t\t%b\t%0d (%b)", $time, rst, count, count);
end

endmodule
