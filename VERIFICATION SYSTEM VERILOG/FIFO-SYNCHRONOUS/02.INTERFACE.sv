interface intf;
  localparam WIDTH=8;
  logic clk, rst;
  logic w_en, r_en;
  logic [WIDTH-1:0] din;
  logic [WIDTH-1:0] dataout;
  logic full, empty;

  modport dut(input clk, rst, w_en, r_en, din,
              output dataout, full, empty);
  modport tb(input full, empty, dataout,
             output w_en, r_en, din);

  clocking cb @(posedge clk);
    default input #1ns output #2ns;
    output w_en, r_en, din;
    input dataout, full, empty;
  endclocking
endinterface
