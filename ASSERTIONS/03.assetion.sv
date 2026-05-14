//// Write a property ensuring mutual exclusion: read_en and write_en cannot both be high simultaneously.
module m;
  logic clk,rst,w_en ,rd_en;
  
  initial clk =0 ;
  always #5 clk = ~clk;
  
  property p;
    @(posedge clk )
    disable iff(rst)
    !(w_en ==1 && rd_en ==1);
  endproperty
  
  assert property (p)
    $display("$time = %0t write and read never happen in same clock cycle",$time);
    else
      $display(" $time = %0t write and read happen in same clock cycle leads to race condition getting wrong  output",$time);
    
    initial begin
      rst = 1;
      w_en=0;
      rd_en=0;
      #5;
      rst =0;
      w_en =1;
      rd_en=0;
      
      #5;
      rst = 0;
      w_en=1;
      rd_en=1;
      
      #5;
      rst = 0;
      w_en = 0;
      rd_en = 1;
      
      #5;
      w_en = 0;
      rd_en = 0;
      $finish;
    end
    endmodule
    # Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# $time = 5 write and read never happen in same clock cycle
#  $time = 15 write and read happen in same clock cycle leads to race condition getting wrong  output
# ** Note: $finish    : design.sv(431)
#    Time: 20 ns  Iteration: 0  Instance: /m
# End time: 04:08:15 on May 14,2026, Elapsed time: 0:00:02
# Errors: 0, Warnings: 0
End time: 04:08:15 on May 14,2026, Elapsed time: 0:00:02
*** Summary *********************************************
