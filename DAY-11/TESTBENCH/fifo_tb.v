`timescale 1ns/1ps

module fifo_tb;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] write_data;

wire [7:0] read_data;
wire full;
wire empty;

// Instantiate FIFO
fifo uut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .write_data(write_data),
    .read_data(read_data),
    .full(full),
    .empty(empty)
);


// Clock Generation
always #5 clk = ~clk;


// Test Procedure
initial begin

    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    write_data = 8'd0;

    // Apply Reset
    #10;
    rst = 0;

    //---------------------------------------
    // Write 5 values
    //---------------------------------------
    $display("Writing Data...");

    wr_en = 1;

    write_data = 8'd10; #10;
    write_data = 8'd20; #10;
    write_data = 8'd30; #10;
    write_data = 8'd40; #10;
    write_data = 8'd50; #10;

    wr_en = 0;

    //---------------------------------------
    // Read 5 values
    //---------------------------------------
    #20;

    $display("Reading Data...");

    rd_en = 1;

    #10;
    $display("Read Data = %d", read_data);

    #10;
    $display("Read Data = %d", read_data);

    #10;
    $display("Read Data = %d", read_data);

    #10;
    $display("Read Data = %d", read_data);

    #10;
    $display("Read Data = %d", read_data);

    rd_en = 0;

    //---------------------------------------
    // Fill FIFO completely
    //---------------------------------------

    #20;

    $display("Checking Full Condition");

    wr_en = 1;

    repeat(16)
    begin
        write_data = write_data + 1;
        #10;
    end

    wr_en = 0;

    //---------------------------------------
    // Empty FIFO completely
    //---------------------------------------

    #20;

    $display("Checking Empty Condition");

    rd_en = 1;

    repeat(16)
        #10;

    rd_en = 0;

    #20;

    $finish;

end


// Monitor
initial begin
    $monitor("Time=%0t rst=%b wr_en=%b rd_en=%b write_data=%d read_data=%d full=%b empty=%b",
              $time,rst,wr_en,rd_en,write_data,read_data,full,empty);
end

endmodule
