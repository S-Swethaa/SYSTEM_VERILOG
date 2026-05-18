module m;
  logic clk,rst,req,ack;
  
  initial clk =0;
  always #5 clk = ~ clk;
  
  property p;
    @(posedge clk)
    disable iff (rst)
    $rose (req)|-> ##2 ack;
  endproperty
  
  assert property (p)
    $display("assertion pass : req high after within 2 clock cycle ack will be high");
    else
      $display("assertion fail : req high after within 2 clock cycle ack will not be high");
    
    initial begin
      $monitor("$time = %0t | req= %0d | ack =%0d | rst=%0d ",$time,req,ack,rst);
      rst=1;
      req=0;
      ack=0;
      #5;
      rst=0;
      @(posedge clk);req<=1;ack<=1;
      @(posedge clk);ack<=1;
      @(posedge clk);ack<=1;
      @(posedge clk);req=1;
      @(posedge clk);ack=0;
      @(posedge clk);ack=1;
      @(posedge clk);req=1;
      @(posedge clk);ack=1;
      @(posedge clk);ack=1;
      @(posedge clk);ack=1;
      
      
      #20;
      $finish;
    end
    endmodule
    # Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# $time = 0 | req= 0 | ack =0 | rst=1 
# $time = 5 | req= 0 | ack =0 | rst=0 
# $time = 15 | req= 1 | ack =1 | rst=0 
# assertion pass : req high after within 2 clock cycle ack will be high
# $time = 55 | req= 1 | ack =0 | rst=0 
# $time = 65 | req= 1 | ack =1 | rst=0 
# ** Note: $finish    : design.sv(1545)
#    Time: 125 ns  Iteration: 0  Instance: /m
# End time: 06:45:04 on May 18,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 06:45:04 on May 18,2026, Elapsed time: 0:00:02

      
  
    
       
          
      
