//Write a property using `throughout` operator: "While valid is high, data must remain stable throughout.
module m;
  logic clk,rst,valid,data;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  property p;
    @(posedge clk)
    disable iff (rst)
    valid |-> $stable(data) throughout valid [*1:$];
  endproperty
  
  assert property(p)
    $display("assertion pass");
    else
      $display("assertion fail");
    
    initial begin
      rst=1;
      valid=0;
      data=0;
      #5;
      rst=0;
      valid=1;
      data=1;
      @(posedge clk);
      valid<=1;
      data<=1;
      @(posedge clk);
      data<=1;
      @(posedge clk);
      valid=0;
      @(posedge clk);
      valid<=1;
      data<=0;
      #50;
      $finish;
    end
    endmodule
      # run -all
# assertion fail
# assertion pass
# assertion pass
# assertion fail
# assertion pass
# assertion pass
# assertion pass
# ** Note: $finish    : design.sv(1111)
#    Time: 95 ns  Iteration: 0  Instance: /m
# End time: 10:48:33 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 10:48:33 on May 15,2026, Elapsed time: 0:00:02
