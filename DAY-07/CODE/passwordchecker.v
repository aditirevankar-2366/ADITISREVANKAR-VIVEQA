module passwordchecker(
input clk,
input confirm,
input[7:0]password,

output reg[7:0] led,
output reg buzzer

    );
    
    parameter pass=8'b10101010;
    
    always@(posedge clk)
    begin
    
    if (confirm)
    begin
    
    if (password==pass)
    begin
    led<=8'b11111111;
    buzzer<=1'b0;
    end
    else
    begin
     led<=8'b00000000;
     buzzer<=1'b1;
     end
     
     end
     
     else
     begin
     led<=8'b00000000;
     buzzer<=1'b0;
     end
     end
     endmodule
    
