 module m;
    logic clk,rst;
    logic [7:0]mux_i;
    
    initial clk  = 0;
    always #5 clk = ~clk;
    
    covergroup cg @(posedge clk);
      coverpoint mux_i{bins valid = {[0:255]};
                       illegal_bins invalid ={8'bxxxxxxxx};}
    endgroup
    
    cg c = new();
    
    initial begin
      rst=1;
      mux_i=0;
      #5;
      repeat(255)begin
        @(posedge clk);
        mux_i=$urandom_range(0,255);
      end
      
      #20;
      mux_i=8'bx0x0x0x0;
      #2;
      $display("coverage = %0.2f %%",c.get_coverage(),mux_i);
      $finish;
    end
  endmodule
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# coverage = 100.00 %  X
# ** Note: $finish    : design.sv(985)
#    Time: 2577 ns  Iteration: 0  Instance: /m
# End time: 14:14:55 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 14:14:55 on May 15,2026, Elapsed time: 0:00:02
*** Summary *********************************************
