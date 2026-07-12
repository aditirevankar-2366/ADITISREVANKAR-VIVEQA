`timescale 1ns/1ps

module fifo_tb;

parameter DATA_WIDTH = 8;
parameter DEPTH = 16;
parameter ADDR_WIDTH = 4;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [DATA_WIDTH-1:0] write_data;

wire [DATA_WIDTH-1:0] read_data;
wire full;
wire empty;

// DUT
fifo #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH),
    .ADDR_WIDTH(ADDR_WIDTH)
) uut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .write_data(write_data),
    .read_data(read_data),
    .full(full),
    .empty(empty)
);

// Clock
always #5 clk = ~clk;

integer i;

initial begin

    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    write_data = 0;

    #20;
    rst = 0;

    //-----------------------
    // Write Data
    //-----------------------
    $display("Writing Data...");

    wr_en = 1;

    for(i=1;i<=8;i=i+1)
    begin
        write_data = i*10;
        #10;
    end

    wr_en = 0;

    //-----------------------
    // Read Data
    //-----------------------
    #20;

    $display("Reading Data...");

    rd_en = 1;

    for(i=1;i<=8;i=i+1)
        #10;

    rd_en = 0;

    //-----------------------
    // Fill FIFO
    //-----------------------
    #20;

    wr_en = 1;

    for(i=0;i<DEPTH;i=i+1)
    begin
        write_data = i;
        #10;
    end

    wr_en = 0;

    #20;

    //-----------------------
    // Empty FIFO
    //-----------------------
    rd_en = 1;

    for(i=0;i<DEPTH;i=i+1)
        #10;

    rd_en = 0;

    #20;

    $finish;

end

initial begin
    $monitor("Time=%0t wr=%b rd=%b write=%d read=%d full=%b empty=%b",
              $time,wr_en,rd_en,write_data,read_data,full,empty);
end

endmodule
