//1. Write a covergroup with bins for address ranges: [0:255], [256:511], [512:767], [768:1023].
module m;
  logic clk,rst;
  logic [9:0]addr;
  
  covergroup cg @(posedge clk);
    coverpoint addr {bins b1 = {[0:255]};
                     bins b2 = {[256:511]};
                     bins b3 = {[512:767]};
                     bins b4 = {[768:1023]};}
  endgroup
  cg c = new();
  
  initial clk = 0;
  always #5 clk = ~clk;
  initial begin
    rst=1;
    addr=0;
    #5;
    for(int i =0; i<=1023;i++)begin
      @(posedge clk)
      addr=i;
    end
    #40;
    $display("coverage = %0.2f %%",c.get_coverage());
    $finish;
  end
endmodule
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# coverage = 100.00 %
# ** Note: $finish    : design.sv(853)
#    Time: 10285 ns  Iteration: 0  Instance: /m
# End time: 11:36:26 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 11:36:26 on May 15,2026, Elapsed time: 0:00:01
*** Summary *********************************************
        
        
    
