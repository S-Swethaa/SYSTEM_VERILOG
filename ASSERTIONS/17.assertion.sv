module m;
  logic clk,rst,full,write_en;
  
  initial clk = 0;
  always #5 clk = ~ clk;
  
  property p;
    @(posedge clk )
    disable iff (rst)
    $rose(full)|->  !write_en;
  endproperty
  
  assert property (p)
    $display("assertion  pass");
    else
      $display("assertion fail");
    
    initial begin
      $monitor("$time=%0t | rst =%0d | write_en=%0d |full=%0d ",$time,rst,write_en,full);
       rst=1;
      full=0;
      write_en=0;
      #5;
      rst=0;
      @(posedge clk);full<=1;write_en<=0;
      @(posedge clk);full<=1;write_en<=0;
      @(posedge clk);full<=0;write_en<=1;
      @(posedge clk);full<=0;write_en<=0;
      #50;
      $finish;
    end
    endmodule
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# $time=0 | rst =1 | write_en=0 |full=0 
# $time=5 | rst =0 | write_en=0 |full=0 
# $time=15 | rst =0 | write_en=0 |full=1 
# assertion  pass
# $time=35 | rst =0 | write_en=1 |full=0 
# $time=45 | rst =0 | write_en=0 |full=0 
# ** Note: $finish    : design.sv(1614)
#    Time: 95 ns  Iteration: 0  Instance: /m
# End time: 11:30:06 on May 18,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 11:30:06 on May 18,2026, Elapsed time: 0:00:02
*** Summary *********************************************


      
