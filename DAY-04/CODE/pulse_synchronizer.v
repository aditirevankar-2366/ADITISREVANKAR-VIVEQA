module pulse_sync_toggle (
    input  wire clock_a,      // Sending clock domain
    input  wire clock_b,      // Receiving clock domain
    input  wire async_rst_n,  // Active-low asynchronous reset
    input  wire pls_a,        // Input pulse in clock_a domain
    output wire pls_b         // Synchronized pulse in clock_b domain
);

//--------------------------------------------------
// Internal Registers
//--------------------------------------------------
reg pls_toggle;
reg pls_toggle_synca;
reg pls_toggle_syncb;
reg pls_toggle_syncc;

//--------------------------------------------------
// Toggle Flip-Flop (Source Clock Domain)
//--------------------------------------------------
always @(posedge clock_a or negedge async_rst_n) begin
    if (!async_rst_n)
        pls_toggle <= 1'b0;
    else if (pls_a)
        pls_toggle <= ~pls_toggle;
end

//--------------------------------------------------
// Double Flip-Flop Synchronizer (Destination Domain)
//--------------------------------------------------
always @(posedge clock_b or negedge async_rst_n) begin
    if (!async_rst_n) begin
        pls_toggle_synca <= 1'b0;
        pls_toggle_syncb <= 1'b0;
    end
    else begin
        pls_toggle_synca <= pls_toggle;
        pls_toggle_syncb <= pls_toggle_synca;
    end
end

//--------------------------------------------------
// Delay Register for Edge Detection
//--------------------------------------------------
always @(posedge clock_b or negedge async_rst_n) begin
    if (!async_rst_n)
        pls_toggle_syncc <= 1'b0;
    else
        pls_toggle_syncc <= pls_toggle_syncb;
end

//--------------------------------------------------
// Output Pulse Generation
// Generates a one-clock-cycle pulse in clock_b domain
//--------------------------------------------------
assign pls_b = pls_toggle_syncb ^ pls_toggle_syncc;

endmodule
