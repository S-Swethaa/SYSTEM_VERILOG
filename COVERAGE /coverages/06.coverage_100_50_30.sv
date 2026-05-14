//100 percent coverage example
module m;
  logic  clk;
  logic [7:0]addr;
  
  initial clk =0;
  always #5 clk = ~clk;
  
  covergroup cg @(posedge clk);
    coverpoint addr {bins low[] = {[0:255]};}
  endgroup
  
  cg c = new();
  
  always @(posedge clk) 
    addr = $urandom_range (0,255);
  
  initial begin// repeated values getting again and again thats why using loog to avoid getting repeated values u can use any method
    for (int i = 0; i < 256; i++) begin
      @(posedge clk);
      addr = i;
    end
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
# ** Note: $finish    : design.sv(279)
#    Time: 2575 ns  Iteration: 0  Instance: /m
# End time: 02:31:16 on May 14,2026, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
End time: 02:31:16 on May 14,2026, Elapsed time: 0:00:01
*** Summary *********************************************

//50 percent coverage
module m;
  logic  clk;
  logic [7:0]addr;
  
  initial clk =0;
  always #5 clk = ~clk;
  
  covergroup cg @(posedge clk);
    coverpoint addr {bins low[] = {[0:255]};}
//                      ignore_bins high = {[128:255]};}
  endgroup
  
  cg c = new();
  
  always @(posedge clk)
    addr = $urandom_range (0,127);
  
  initial begin
    for (int i = 0; i < 128; i++) begin
      @(posedge clk);
      addr = i;
    end
    #20;
    $display("Coverage = %0.2f %%", c.get_coverage());
    $finish;

  end

endmodule

# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# Coverage = 50.00 %
# ** Note: $finish    : design.sv(280)
#    Time: 1295 ns  Iteration: 0  Instance: /m
# End time: 02:26:08 on May 14,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 02:26:08 on May 14,2026, Elapsed time: 0:00:02
*** Summary *********************************************

//30 percent coverage
module m;
  logic  clk;
  logic [7:0]addr;
  
  initial clk =0;
  always #5 clk = ~clk;
  
  covergroup cg @(posedge clk);
    coverpoint addr {bins low[] = {[0:255]};}
//                      ignore_bins high = {[128:255]};}
  endgroup
  
  cg c = new();
  
  always @(posedge clk)
    addr = $urandom_range (0,77);
  
  initial begin
    for (int i = 0; i < 77; i++) begin
      @(posedge clk);
      addr = i;
    end
    #20;
    $display("Coverage = %0.2f %%", c.get_coverage());
    $finish;

  end

endmodule
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# Coverage = 30.08 %
# ** Note: $finish    : design.sv(280)
#    Time: 785 ns  Iteration: 0  Instance: /m
# End time: 02:29:41 on May 14,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 02:29:41 on May 14,2026, Elapsed time: 0:00:02
*** Summary *********************************************







