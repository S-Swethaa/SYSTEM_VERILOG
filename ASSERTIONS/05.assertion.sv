module burst_check;

  logic clk, rst;
  logic valid;
  logic [7:0] burst_count;

  initial clk = 0;
  always #5 clk = ~clk;

  // Property:
  // valid must stay HIGH exactly burst_count cycles

  property p_burst;
    int c;

    @(posedge clk)
    disable iff (rst)

    // Detect start of burst
    ($rose(valid), c = 0)

    |->
    
    // Count every cycle while valid is HIGH
    ((valid, c = c + 1)[*1:$]

    // Burst must end
    ##1 !valid)

    // Check exact burst length
    ##0 (c == burst_count);

  endproperty

  // Assertion
  assert property(p_burst)
    $display("%0t ASSERTION PASS", $time);
  else
    $display("%0t ASSERTION FAIL", $time);

  // Test stimulus
  initial begin

    rst = 1;
    valid = 0;
    burst_count = 0;

    #12;
    rst = 0;

    // Burst length = 4
    burst_count = 4;

    valid = 1;

    repeat(4)
      @(posedge clk);

    valid = 0;

    #20;

    $finish;
  end

endmodule
    # Loading sv_std.std
# Loading work.burst_check(fast)
# 
# run -all
# 55 ASSERTION PASS
# ** Note: $finish    : design.sv(526)
#    Time: 65 ns  Iteration: 0  Instance: /burst_check
# End time: 11:14:38 on May 14,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 11:14:38 on May 14,2026, Elapsed time: 0:00:01
*** Summary *********************************************
