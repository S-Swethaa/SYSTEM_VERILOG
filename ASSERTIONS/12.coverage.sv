/// Write assertions for FIFO: when full, push not allowed; when empty, pop not allowed; data count never exceeds 16.
module fifo;
  logic clk,rst,full,empty,push,pop;
  logic [3:0]count;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  property p;
    @(posedge clk )
    disable iff (rst)
    (full) |-> !push;
  endproperty
  assert property (p)
    $display("assertion pass fifo is full deassert the push");
    else
      $display("assertion fail fifo is full but push also happen");
    
    
   property po;
    @(posedge clk )
    disable iff (rst)
      (empty) |-> !pop;
  endproperty
    assert property (po)
    $display("assertion pass empty is pop deassert the push");
    else
      $display("assertion fail empty is but pop also happen");
      
        property poo;
    @(posedge clk )
    disable iff (rst)
          count<15;
  endproperty
  assert property (p)
    $display("assertion pass");
    else
      $display("assertion fail ");
    
    initial begin
      rst=1;
      full=0;pop=0;push=0;empty=0;
      #5;
      rst=0;
      @(posedge clk);
      full<=1;
      push<=0;
      @(posedge clk);
      empty<=1;
      pop<=0;
      @(posedge clk);
      full<=1;
      push<=1;
      @(posedge clk);
      empty<=1;
      pop<=1;
      @(posedge clk);
      for(int i=0;i<25;i++)begin
        count=i;
      end
      #60;
      $finish;
    end
    endmodule
    # Loading sv_std.std
# Loading work.fifo(fast)
# 
# run -all
# assertion pass fifo is full deassert the push
# assertion pass
# assertion pass empty is pop deassert the push
# assertion pass fifo is full deassert the push
# assertion pass
# assertion pass empty is pop deassert the push
# assertion fail fifo is full but push also happen
# assertion fail 
# assertion fail empty is but pop also happen
# assertion fail fifo is full but push also happen
# assertion fail 
# assertion fail empty is but pop also happen
# assertion fail fifo is full but push also happen
# assertion fail 
# assertion fail empty is but pop also happen
# assertion fail fifo is full but push also happen
# assertion fail 
# assertion fail empty is but pop also happen
# assertion fail fifo is full but push also happen
# assertion fail 
# assertion fail empty is but pop also happen
# assertion fail fifo is full but push also happen
# assertion fail 
# assertion fail empty is but pop also happen
# assertion fail fifo is full but push also happen
# assertion fail 
# ** Note: $finish    : design.sv(1210)
#    Time: 115 ns  Iteration: 0  Instance: /fifo
# End time: 11:02:57 on May 16,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 11:02:57 on May 16,2026, Elapsed time: 0:00:02
*** Summary *********************************************
    
    
       
          
      
