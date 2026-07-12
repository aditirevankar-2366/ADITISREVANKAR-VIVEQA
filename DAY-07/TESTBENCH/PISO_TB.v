module PISO_tb;

reg clk;
reg rst;
reg [3:0] data_in;
reg load;
reg shift;

wire data_out;

// Instantiate DUT
PISO uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .load(load),
    .shift(shift),
    .data_out(data_out)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    data_in = 4'b0000;
    load = 0;
    shift = 0;

    // Apply reset
    #10;
    rst = 0;

    // Load data 1011
    data_in = 4'b1011;
    load = 1;
    #10;
    load = 0;

    // Generate four shift pulses
    repeat (4) begin
        #10 shift = 1;
        #10 shift = 0;
    end

    // Load another data 0110
    data_in = 4'b0110;
    load = 1;
    #10;
    load = 0;

    // Generate four shift pulses
    repeat (4) begin
        #10 shift = 1;
        #10 shift = 0;
    end

    #20;
    $finish;
end

// Monitor outputs
initial begin
    $monitor("Time=%0t rst=%b load=%b shift=%b data_in=%b data_out=%b",
             $time, rst, load, shift, data_in, data_out);
end

endmodule
