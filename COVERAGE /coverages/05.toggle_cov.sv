// Write a covergroup measuring toggle coverage for a 4-bit bus (data_bus[3:0])
module m;
  logic  clk;
  logic [3:0]bus;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  always @(posedge clk)
    bus <= $urandom;
  
  covergroup cd @(posedge clk);
    coverpoint bus[0] {bins b0_0to1 = (0 => 1);
                       bins b0_1to0 = (1 => 0);}
    coverpoint bus[1] {bins b1_0to1 = (0 => 1);
                       bins b1_1to0 = (1 => 0);}
    coverpoint bus[2] {bins b2_0to1 = (0 => 1);
                       bins b2_1to0 = (1 => 0); }
    coverpoint bus[3] {bins b3_0to1 = (0 => 1);
                       bins b3_1to0 = (1 => 0);}
  endgroup
  
  cd c = new();
  
  initial begin
    #100;
    $display("coverage = %0.2f %%",c.get_coverage());
    $finish;
  end
endmodule
  
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# coverage = 100.00 %
# ** Note: $finish    : design.sv(252)
#    Time: 100 ns  Iteration: 0  Instance: /m
# End time: 02:06:22 on May 14,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 02:06:22 on May 14,2026, Elapsed time: 0:00:01
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
    vlog: Errors:   0, Warnings:   0
    vopt: Errors:   0, Warnings:   1
    vsim: Errors:   0, Warnings:   0
  Totals: Errors:   0, Warnings:   1
