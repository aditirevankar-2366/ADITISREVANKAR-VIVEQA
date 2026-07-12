module fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 16,
    parameter ADDR_WIDTH = 4      // log2(DEPTH)
)(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [DATA_WIDTH-1:0] write_data,

    output reg [DATA_WIDTH-1:0] read_data,
    output full,
    output empty
);

    // Memory
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Read and Write Pointers
    reg [ADDR_WIDTH:0] wr_ptr;
    reg [ADDR_WIDTH:0] rd_ptr;

    //-------------------------
    // Status Flags
    //-------------------------
    assign empty = (wr_ptr == rd_ptr);

    assign full = (wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) &&
                  (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);

    //-------------------------
    // Write Logic
    //-------------------------
    always @(posedge clk) begin
        if (rst)
            wr_ptr <= 0;
        else if (wr_en && !full) begin
            mem[wr_ptr[ADDR_WIDTH-1:0]] <= write_data;
            wr_ptr <= wr_ptr + 1;
        end
    end

    //-------------------------
    // Read Logic
    //-------------------------
    always @(posedge clk) begin
        if (rst) begin
            rd_ptr <= 0;
            read_data <= 0;
        end
        else if (rd_en && !empty) begin
            read_data <= mem[rd_ptr[ADDR_WIDTH-1:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end

endmodule
