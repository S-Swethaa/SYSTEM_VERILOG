 //3. Write a covergroup with wildcard_bins to cover all address patterns with LSB=0 and MSB=1.
module m;
  logic clk,rst;
  logic [7:0]addr;
  
  initial clk =0;
  always #5 clk = ~clk;
  
  covergroup cg @(posedge clk);
    coverpoint addr {wildcard bins b = {8'b1??????0};}
  endgroup
  
  cg c = new();
  
  initial begin
    rst=1;
    addr=0;
    
    #5;
    repeat(15)begin
      @(posedge clk);
    addr = $urandom_range(128,255);
    end
    
    $display("coverage =%0.2f %%",c.get_coverage());
    $finish;
  end
endmodule
   # // and may not be used in any way not expressly authorized by SISW.
# //
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# coverage =100.00 %
# ** Note: $finish    : design.sv(954)
#    Time: 155 ns  Iteration: 1  Instance: /m
# End time: 14:04:18 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 14:04:18 on May 15,2026, Elapsed time: 0:00:02
*** Summary ********************************************* 
  
