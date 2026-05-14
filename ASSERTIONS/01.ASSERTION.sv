//// Write a property checking handshake: req -> ##[1:3] ack (ACK within 1-3 cycles).

module assertion;
  logic clk,rst;
   bit req,ack;
  
  property p;
    @(posedge clk)
    disable iff (rst)
    req |-> ##[1:3]ack;
  endproperty
  
  assert property (p)
    $display("$time= %0t,assertion pass getting req ack will active within 1to 3 clock cycle",$time);
    else
      $display("$time = %0t |assertion FAILED getting req ack will active within 1to 3 clock cycle",$time);
    
      
      initial clk = 0;
      always #5 clk = ~clk;
      
      initial begin

  rst = 1;
  req = 0;
  ack = 0;

  #4;
  rst = 0;

  @(posedge clk);
  req = 1;

  @(posedge clk);
  req = 0;
  ack = 1;

  @(posedge clk);
  ack = 0;

  @(posedge clk);
  req = 1;

  @(posedge clk);
  req = 0;

  repeat(4)
    @(posedge clk);

  ack = 1;

  #20;
  $finish;

end
    endmodule

    # Loading sv_std.std
# Loading work.assertion(fast)
# 
# run -all
# $time= 25,assertion pass getting req ack will active within 1to 3 clock cycle
# $time = 75 |assertion FAILED getting req ack will active within 1to 3 clock cycle
# ** Note: $finish    : design.sv(341)
#    Time: 105 ns  Iteration: 0  Instance: /assertion
# End time: 03:37:42 on May 14,2026, Elapsed time: 0:00:02
# Errors: 0, Warnings: 0
End time: 03:37:42 on May 14,2026, Elapsed time: 0:00:02
*** Summary *********************************************
        
        
        
      

      
