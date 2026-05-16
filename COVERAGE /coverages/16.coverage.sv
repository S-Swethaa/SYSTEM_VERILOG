//Q1. Write a covergroup to check AXI4 burst types (FIXED, INCR, WRAP).  
// Q1. Covergroup for AXI4 burst types
module m;
  logic clk, rst;
    typedef enum logic [1:0] {FIXED=2'b00, INCR=2'b01, WRAP=2'b10} burst_t;
  burst_t s;
  covergroup cg @(posedge clk);
    burst_cp : coverpoint s {
      bins fixed = {FIXED};
      bins incr  = {INCR};
      bins wrap  = {WRAP};
    }
  endgroup

  cg c = new();

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    rst = 1;
    #10 rst = 0;
    s = FIXED;  repeat (2) @(posedge clk);
    s = INCR;   repeat (2) @(posedge clk);
    s = WRAP;   repeat (2) @(posedge clk);

    #20;
    $display("Coverage = %0.2f %%", c.get_coverage());
    $finish;
  end
endmodule
# //
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# Coverage = 100.00 %
# ** Note: $finish    : design.sv(1505)
#    Time: 85 ns  Iteration: 0  Instance: /m
# End time: 13:14:01 on May 16,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 13:14:01 on May 16,2026, Elapsed time: 0:00:01
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
    vlog: Errors:   0, Warnings:   0
    vopt: Errors:   0, Warnings:   1
    vsim: Errors:   0, Warnings:   0
  Totals: Errors:   0, Warnings:   1

    
    
    
