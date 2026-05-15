//2. Write a property using `$fell()` to detect falling edge of `enable` and verify it stays low for ≥3 cycles.
module m;
  logic clk,rst,enable;
  
  initial clk =0 ;
  always #5 clk = ~clk;
  
  property p;
    @(posedge clk)
    disable iff(rst)
    $fell(enable) |-> !enable[*3] ;
  endproperty
  
  assert property (p)
    $display("assertion pass");
    else
      $display("assertion fail");
    
    initial begin
      rst=1;
      enable=0;
      rst=0;
      #5;
      rst=0;
      enable=0;
      repeat(3)
        @(posedge clk);
      enable<=0;
      
      #5;
      enable = 1;
      @(posedge clk );
      enable<=0;
      @(posedge clk);
      enable<=0;
      @(posedge clk);
      enable<=0;
      @(posedge clk);
      enable<=0;
      @(posedge clk);
      enable<=0;
      #50;
      $finish;
    end
    endmodule
      # Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# assertion pass
# assertion pass
# ** Note: $finish    : design.sv(1070)
#    Time: 135 ns  Iteration: 0  Instance: /m
# End time: 10:38:53 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 10:38:53 on May 15,2026, Elapsed time: 0:00:02
*** Summary *********************************************
