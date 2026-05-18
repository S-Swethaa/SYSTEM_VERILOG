module m;
  logic clk,rst,rd,wr;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  covergroup cg @(posedge clk);
    coverpoint rd {bins active ={1};
                   bins low = {0};}
    coverpoint wr {bins activewr = {1};
                   bins lowwr = {0};}
    cross rd,wr;
  endgroup
  
  cg c = new();
  
  initial begin
    rst=1;
    rd=0;wr=0;
    rst=0;
    repeat(10)begin
      @(posedge clk);
      wr<=1;rd<=1;
      @(posedge clk);
      wr<=0;
      rd<=1;
      @(posedge clk);
      wr<=1;
      rd<=0;
      @(posedge clk);
      wr<=0;
      rd<=0;
    end
    #30;
    $display("coverage = %0.2f %%",c.get_coverage());
    $finish;
  end
endmodule
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# coverage = 100.00 %
# ** Note: $finish    : design.sv(1653)
#    Time: 425 ns  Iteration: 0  Instance: /m
# End time: 11:43:05 on May 18,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
End time: 11:43:05 on May 18,2026, Elapsed time: 0:00:01
*** Summary *********************************************
