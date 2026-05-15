 //Write a property using delay operators: "After write command, read cannot occur for exactly 5 cycles."
module m;
  logic clk,rst,write,read;
  
  initial clk = 0;
  always #5 clk = ~ clk;
  
  property p;
    @(posedge clk)
    disable iff (rst)
    write |-> !read[*5];
  endproperty
  
  assert property (p)
    $display("assertion pass");
    else
      $display("assertion fail");
    
    initial begin
      rst=1;
      write=0;
      read=0;
      #5;
      rst=0;
      write=1;
      repeat(6)
        @(posedge clk);
        write<=1;
      read<=0;
      
      @(posedge clk);
      write<=1;
      @(posedge clk);
      read<=1;
      @(posedge clk);
      read<=0;
      #20;
      $finish;
    end
    endmodule
    # Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# assertion pass
# assertion pass
# assertion pass
# assertion pass
# assertion fail
# assertion fail
# assertion fail
# assertion fail
# assertion fail
# ** Note: $finish    : design.sv(1152)
#    Time: 115 ns  Iteration: 0  Instance: /m
# End time: 11:00:02 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 11:00:02 on May 15,2026, Elapsed time: 0:00:02
*** Summary *********************************************
      
      
        
    
