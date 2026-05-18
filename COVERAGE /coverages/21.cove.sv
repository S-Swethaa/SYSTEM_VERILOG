module fifo_level_coverage;
  logic clk,rst,full,empty,half_full,half_empty;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  covergroup cg @(posedge clk);
    coverpoint full {bins ac_full ={1};
                      bins lo_full = {0};}
    coverpoint half_full {bins ac_hafull ={1};
                      bins lo_hffull = {0};}
    coverpoint empty {bins ac_empty ={1};
                      bins lo_empty = {0};}
    coverpoint half_empty {bins ac_haempty ={1};
                      bins lo_haempty = {0};}
    cross full,empty,half_full,half_empty;
  endgroup
  
  cg c = new();
   initial begin
     rst=1;
     full=0;empty=0;half_full=0;half_empty=0;
     #5;
     rst=0;
     @(posedge clk); full=1; empty=0; half_full=0; half_empty=0;   // full condition
    @(posedge clk); full=0; empty=1; half_full=0; half_empty=0;   // empty condition
    @(posedge clk); full=0; empty=0; half_full=1; half_empty=0;   // half full
    @(posedge clk); full=0; empty=0; half_full=0; half_empty=1;   // half empty
    @(posedge clk); full=0; empty=0; half_full=1; half_empty=1;   // both half flags
    @(posedge clk); full=1; empty=1; half_full=0; half_empty=0;   // illegal combo (still covered)
    repeat(20) begin
      @(posedge clk);
      full       = $urandom_range(0,1);
      empty      = $urandom_range(0,1);
      half_full  = $urandom_range(0,1);
      half_empty = $urandom_range(0,1);
    end

    #20;
    $display("Coverage = %0.2f %%", c.get_coverage());
    $finish;
  end
endmodule
# Loading work.fifo_level_coverage(fast)
# 
# run -all
# Coverage = 96.25 %
# ** Note: $finish    : design.sv(1807)
#    Time: 285 ns  Iteration: 0  Instance: /fifo_level_coverage
# End time: 12:57:42 on May 18,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 12:57:42 on May 18,2026, Elapsed time: 0:00:02
*** Summary *********************************************
     
    
       
          
      
