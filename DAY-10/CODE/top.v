
module TOP(clk );
input clk;
wire wr_en;
wire [31:0]addr,write_data,read_data;

single_port_ram ram(clk,addr,wr_en,write_data,read_data);

ila_0 ila(
	.clk(clk), // input wire clk


	.probe0(probe0), // input wire [0:0]  probe0  
	.probe1(probe1), // input wire [31:0]  probe1 
	.probe2(probe2), // input wire [31:0]  probe2 
	.probe3(probe3) // input wire [31:0]  probe3
);
vio_0 vi0 (
  .clk(clk),                // input wire clk
  .probe_in0(probe_in0),    // input wire [31 : 0] probe_in0
  .probe_out0(probe_out0),  // output wire [0 : 0] probe_out0
  .probe_out1(probe_out1),  // output wire [31 : 0] probe_out1
  .probe_out2(probe_out2)  // output wire [31 : 0] probe_out2
);
endmodule
