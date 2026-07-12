module subtractor_4bit (
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] Diff,
    output Borrow
);

assign {Borrow, Diff} = A - B;

endmodule
