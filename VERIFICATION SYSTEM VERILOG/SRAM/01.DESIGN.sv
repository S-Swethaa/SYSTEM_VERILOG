module sram(
  input logic clk,
  input logic rst,
  input logic rw,             // rw=1 for write, 0 for read
  input logic [7:0]addr,
  input logic [7:0]din,
  output logic [7:0]dataout
);
  logic [7:0] mem[0:255];
  integer i;

  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      for(i=0; i<256; i=i+1)
        mem[i] <= 8'h00;
    end
    else if(rw) begin
      mem[addr[7:0]] <= din;
    end
    else begin
      dataout <= mem[addr[7:0]];
    end
  end
endmodule
