// Write a property that after reset (rst_n==0), all control signals return to default within 2 cycles.
module m;
  logic clk,rst,req,wr;
  
  initial clk = 0;
  always #5 clk = ~ clk;
  
  property p;
    @(posedge clk)
    (rst) |-> ##[0:2](req==0 && wr==0 );
  endproperty
  
  assert property (p)
    $display("ASSERTION PASS : reset is high reset all the controlled signals");
    else
      $display("ASSERTION FAILED : reset is high but not all controlled signals low");
    
    initial begin
         rst=1;
      req=0;
      wr=0;
      #5;

    rst = 1;
    req = 1;
    wr  = 1;

    #10;

    rst = 0;

    #10;

    rst = 1; 

    req = 1;
    wr  = 1;

    #50;

    $finish;
  end

endmodule

    # Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# ASSERTION PASS : reset is high reset all the controlled signals
    //apply negative testcases 
# ASSERTION FAILED : reset is high but not all controlled signals low
# ASSERTION FAILED : reset is high but not all controlled signals low
# ASSERTION FAILED : reset is high but not all controlled signals low
# ** Note: $finish    : design.sv(386)
#    Time: 75 ns  Iteration: 0  Instance: /m
# End time: 03:56:34 on May 14,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 03:56:34 on May 14,2026, Elapsed time: 0:00:02
*** Summary *********************************************
