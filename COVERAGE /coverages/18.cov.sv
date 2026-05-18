module m;
    logic clk,rst;
    typedef enum  logic [1:0]{idle,w,r}state;
    state s;
    
    covergroup cg @(posedge clk);
      coverpoint s {bins idle_w = (idle =>w);
                    bins w_r = (w => r);
                    bins r_idle = (r => idle);}
    endgroup 
    cg c = new();
    
    initial clk = 0;
  always #5 clk = ~clk;
    
    initial begin
      rst=1;
      s=idle;
      #5;
      @(posedge clk);s=w;
      @(posedge clk);s=r;
      @(posedge clk);s=idle;
       @(posedge clk);s=w;
      @(posedge clk);s=r;
      @(posedge clk);s=idle;
      @(posedge clk);s=w;
      @(posedge clk);s=r;
      @(posedge clk);s=idle;
      #20;
    $display("Coverage = %0.2f %%", c.get_coverage());
    $finish;
  end
endmodule
      # Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# Coverage = 100.00 %
# ** Note: $finish    : design.sv(1688)
#    Time: 115 ns  Iteration: 0  Instance: /m
# End time: 12:21:40 on May 18,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 12:21:40 on May 18,2026, Elapsed time: 0:00:01
*** Summary *********************************************
