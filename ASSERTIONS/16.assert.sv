module m;
  logic clk,rst,write,write_done;
  
  initial clk = 0;
  always #5 clk = ~ clk;
  
  property p;
    @(posedge clk )
    disable iff (rst)
    $rose(write)|-> ##3 write_done;
  endproperty
  
  assert property (p)
    $display("assertion  pass");
    else
      $display("assertion fail");
    
    initial begin
      $monitor("$time=%0t | rst =%0d | write=%0d |write_done=%0d ",$time,rst,write,write_done);
       rst=1;
      write=0;
      write_done=0;
      #5;
      rst=0;
      @(posedge clk);write<=1;write_done<=1;
      @(posedge clk);write<=1;write_done<=1;
      @(posedge clk);write<=1;write_done<=1;
      @(posedge clk);write<=0;write_done<=1;
      #50;
      $finish;
    end
    endmodule


      # Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# $time=0 | rst =1 | write=0 |write_done=0 
# $time=5 | rst =0 | write=0 |write_done=0 
# $time=15 | rst =0 | write=1 |write_done=1 
# $time=45 | rst =0 | write=0 |write_done=1 
# assertion  pass
# ** Note: $finish    : design.sv(1614)
#    Time: 95 ns  Iteration: 0  Instance: /m
# End time: 11:23:43 on May 18,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 11:23:43 on May 18,2026, Elapsed time: 0:00:01
*** Summary *********************************************
