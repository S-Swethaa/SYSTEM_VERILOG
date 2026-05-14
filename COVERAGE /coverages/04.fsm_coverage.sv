//// Write a covergroup tracking state transitions in 4-state FSM (IDLE=0, WAIT=1, ACTIVE=2, DONE=3) with illegal_bins for invalid transitions.

    
 module fsm;

  typedef enum logic [1:0] {
    idle,
    w_ait,
    active,
    done
  } state;

  state s;

  reg clk, rst;

  initial clk = 0;
  always #5 clk = ~clk;

  always @(posedge clk or posedge rst) begin

    if (rst)
      s <= idle;

    else begin

      case (s)

        idle   : s <= w_ait;
        w_ait  : s <= active;
        active : s <= done;
        done   : s <= idle;

        default: s <= idle;

      endcase
    end
  end


  // COVERGROUP
  covergroup cg @(posedge clk);

    coverpoint s {

      bins id_wait     = (idle   => w_ait);
      bins wait_active = (w_ait  => active);
      bins act_done    = (active => done);
      bins done_idle   = (done   => idle);

      illegal_bins invalid_trans[] = (

          idle   => active,
          idle   => done,

          active => idle,
          active => w_ait,

          w_ait  => idle,
          w_ait  => done,

          done   => w_ait,
          done   => active
      );

    }

  endgroup


  cg c = new();


  initial begin

    rst = 1;

    #10;
    rst = 0;

    #100;

    $display("Coverage = %0.2f %%", c.get_coverage());

    $finish;

  end

endmodule


# Loading sv_std.std
# Loading work.fsm(fast)
# 
# run -all
# Coverage = 100.00 %
# ** Note: $finish    : design.sv(218)
#    Time: 110 ns  Iteration: 0  Instance: /fsm
# End time: 01:49:52 on May 14,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 01:49:52 on May 14,2026, Elapsed time: 0:00:02
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
    vlog: Errors:   0, Warnings:   0
    vopt: Errors:   0, Warnings:   1
    vsim: Errors:   0, Warnings:   0
