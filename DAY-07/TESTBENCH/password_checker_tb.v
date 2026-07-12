module passwordchecker_tb;

reg clk;
reg confirm;
reg [7:0] password;

wire [7:0] led;
wire buzzer;

// Instantiate the DUT
passwordchecker uut (
    .clk(clk),
    .confirm(confirm),
    .password(password),
    .led(led),
    .buzzer(buzzer)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial begin
    // Initialize inputs
    clk = 0;
    confirm = 0;
    password = 8'b00000000;

    // Test Case 1: Confirm = 0
    #10;
    confirm = 0;
    password = 8'b10101010;
    #10;

    // Test Case 2: Correct Password
    confirm = 1;
    password = 8'b10101010;
    #10;

    // Test Case 3: Wrong Password
    confirm = 1;
    password = 8'b11110000;
    #10;

    // Test Case 4: Another Wrong Password
    password = 8'b00001111;
    #10;

    // Test Case 5: Correct Password Again
    password = 8'b10101010;
    #10;

    // Test Case 6: Disable Confirm
    confirm = 0;
    #10;

    $finish;
end

// Monitor the signals
initial begin
    $display("Time\tConfirm\tPassword\tLED\t\tBuzzer");
    $monitor("%0t\t%b\t%b\t%b\t%b",
             $time, confirm, password, led, buzzer);
end

endmodule
