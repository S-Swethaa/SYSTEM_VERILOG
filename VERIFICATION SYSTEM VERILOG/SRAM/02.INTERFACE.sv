interface intf();
  logic clk;
  logic rst;
  logic rw;
  logic [7:0] addr;
  logic [7:0] din;
  logic [7:0] dataout;
  /*clocking cb @(posedge clk);
  default input #1ns output #2ns;
  output rst,rw,addr,din;
  input dataout;
endclocking
  
endinterface*/
endinterface
