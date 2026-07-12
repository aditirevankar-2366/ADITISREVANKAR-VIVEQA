module fsm (
    input clk,
    input rst,
    input I,
    output OP
);

reg Q0, Q1;
wire D0, D1;

// Next-state logic
assign D0 = I;
assign D1 = Q0 & I;

// State register
always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q0 <= 1'b0;
        Q1 <= 1'b0;
    end
    else begin
        Q0 <= D0;
        Q1 <= D1;
    end
end

// Output logic
assign OP = Q1 & I;

endmodule
