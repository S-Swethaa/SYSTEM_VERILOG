module ass;

  logic clk, rst;
  bit req, grant;
  initial clk = 0;
  always #5 clk = ~clk;
  property p;
    @(posedge clk)
    disable iff (rst)
    $rose(req) |-> ##[0:2] grant;
  endproperty
  assert property (p)
    $display("TIME=%0t ASSERTION PASS", $time);
  else
    $display("TIME=%0t ASSERTION FAIL", $time);

  initial begin
    $monitor("TIME=%0t rst=%0d req=%0d grant=%0d",
              $time, rst, req, grant);
  end
  initial begin

    rst   = 1;
    req   = 0;
    grant = 0;

    #12;
    rst = 0;
    @(posedge clk);
    req <= 1;

    @(posedge clk);
    grant <= 1;

    @(posedge clk);
    req <= 0;
    grant <= 0;

    @(posedge clk);
    req <= 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);

    grant <= 1;

    #20;
    $finish;

  end

endmodule
    # Loading sv_std.std
# Loading work.ass(fast)
# 
# run -all
# TIME=0 rst=1 req=0 grant=0
# TIME=12 rst=0 req=0 grant=0
# TIME=15 rst=0 req=1 grant=0
# TIME=25 rst=0 req=1 grant=1
# TIME=35 ASSERTION PASS
# TIME=35 rst=0 req=0 grant=0
# TIME=45 rst=0 req=1 grant=0
# TIME=75 ASSERTION FAIL
# TIME=75 rst=0 req=1 grant=1
# ** Note: $finish    : design.sv(1044)
#    Time: 95 ns  Iteration: 0  Instance: /ass
# End time: 10:23:26 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 10:23:26 on May 15,2026, Elapsed time: 0:00:02
*** Summary *********************************************
