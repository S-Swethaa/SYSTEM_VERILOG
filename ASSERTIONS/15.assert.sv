module m;
  logic clk,rst,read,write;
  
  initial clk = 0;
  always #5 clk = ~ clk;
  
  property p;
    @(posedge clk )
    disable iff (rst)
    !(write && read );
  endproperty
  
  assert property (p)
    $display("assertion  pass");
    else
      $display("assertion fail");
    
    initial begin
      $monitor("$time=%0t | rst =%0d | write=%0d |read=%0d ",$time,rst,write,read);
      rst=1;
      write=0;
      read=0;
      #5;
      rst=0;
      @(posedge clk);write<=1;read<=1;
      @(posedge clk);write<=1;read<=0;
      @(posedge clk);write<=0;read<=1;
      @(posedge clk);write<=0;read<=0;
      #50;
      $finish;
    end
    endmodule
    # Loading work.m(fast)
# 
# run -all
# $time=0 | rst =1 | write=0 |read=0 
# assertion  pass
# $time=5 | rst =0 | write=0 |read=0 
# assertion  pass
# $time=15 | rst =0 | write=1 |read=1 
# assertion fail
# $time=25 | rst =0 | write=1 |read=0 
# assertion  pass
# $time=35 | rst =0 | write=0 |read=1 
# assertion  pass
# $time=45 | rst =0 | write=0 |read=0 
# assertion  pass
# assertion  pass
# assertion  pass
# assertion  pass
# ** Note: $finish    : design.sv(1579)
#    Time: 95 ns  Iteration: 0  Instance: /m
# End time: 07:17:19 on May 18,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 07:17:19 on May 18,2026, Elapsed time: 0:00:01
*** Summary *********************************************
      
      
  
