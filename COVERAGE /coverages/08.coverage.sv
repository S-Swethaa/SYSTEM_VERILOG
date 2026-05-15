// Write a covergroup tracking state machine transitions between 4 states (sample with current and previous state).

module m;

  logic clk, rst;

  typedef enum logic [1:0] {

    S0,
    S1,
    S2,
    S3

  } state_t;

  state_t s, prev_s;

  initial clk = 0;
  always #5 clk = ~clk;

  always_ff @(posedge clk or posedge rst) begin

    if(rst) begin
      s      <= S0;
      prev_s <= S0;
    end

    else begin

      prev_s <= s;

      case(s)

        S0: s <= S1;
        S1: s <= S2;
        S2: s <= S3;
        S3: s <= S0;

      endcase
    end
  end

  covergroup cg @(posedge clk);

    coverpoint prev_s;
    coverpoint s;

    cross prev_s, s;

  endgroup

  cg c = new();


  initial begin

    rst = 1;

    #12;
    rst = 0;

    #100;

    $display("Coverage = %0.2f %%", c.get_coverage());

    $finish;

  end

endmodule
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# Coverage = 77.08 %
# ** Note: $finish    : design.sv(922)
#    Time: 112 ns  Iteration: 0  Instance: /m
# End time: 13:52:05 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 13:52:05 on May 15,2026, Elapsed time: 0:00:02
*** Summary *********************************************

        
    
