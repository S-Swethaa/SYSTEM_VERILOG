// Write a property: "If interrupt request arrives, interrupt acknowledge must follow within 4 cycles."

module assertion;
  logic clk,rst;
   bit interrupt_req,interrupt_ack;
  
  property p;
    @(posedge clk)
    disable iff (rst)
    interrupt_req |-> ##[0:4]interrupt_ack;
  endproperty
  
  assert property (p)
    $display("$time= %0t,assertion pass getting req ack will active within 0 to 4 clock cycle",$time);
    else
      $display("$time = %0t |assertion FAILED getting req ack will active within 0 to 4 clock cycle",$time);
    
      
      initial clk = 0;
      always #5 clk = ~clk;
      
      initial begin

  rst = 1;
  interrupt_req = 0;
  interrupt_ack = 0;

  #4;
  rst = 0;

  @(posedge clk);
  interrupt_req = 1;

  @(posedge clk);
  interrupt_req = 0;
  interrupt_ack = 1;

  @(posedge clk);
  interrupt_ack = 0;

  @(posedge clk);
  interrupt_req = 1;

  @(posedge clk);
  interrupt_req = 1;

        repeat(5)
    @(posedge clk);

  interrupt_ack = 1;

  #20;
  $finish;

end
        endmodule

    # run -all
# $time= 25,assertion pass getting req ack will active within 0 to 4 clock cycle
# $time = 85 |assertion FAILED getting req ack will active within 0 to 4 clock cycle
# $time = 95 |assertion FAILED getting req ack will active within 0 to 4 clock cycle
# $time= 105,assertion pass getting req ack will active within 0 to 4 clock cycle
# $time= 105,assertion pass getting req ack will active within 0 to 4 clock cycle
# $time= 105,assertion pass getting req ack will active within 0 to 4 clock cycle
# $time= 105,assertion pass getting req ack will active within 0 to 4 clock cycle
# $time= 105,assertion pass getting req ack will active within 0 to 4 clock cycle
# ** Note: $finish    : design.sv(341)
#    Time: 115 ns  Iteration: 0  Instance: /assertion
# End time: 04:13:24 on May 14,2026, Elapsed time: 0:00:02
# Errors: 0, Warnings: 0
End time: 04:13:24 on May 14,2026, Elapsed time: 0:00:02
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
    vlog: Errors:   0, Warnings:   0
    vopt: Errors:   0, Warnings:   1
    vsim: Errors:   0, Warnings:   0
  Totals: Errors:   0, Warnings:   1
