//// //Write a covergroup tracking all values of an 8-bit counter (counter_out).
module covergae(
    input clk,
    input rst,
    output reg y
);

  reg [7:0] count;

  // Counter Logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      y     <= 0;
      count <= 0;
    end
    else begin
      if (count == 8'd255)
        count <= 0;
      else
        count <= count + 1;
    end
  end

  // Covergroup
  covergroup cg @(posedge clk);

    coverpoint count {
      bins all_val[] = {[0:255]};
    }

  endgroup

  // Create covergroup instance
  cg c = new();

endmodule



module co;
  reg clk,rst;
  wire y;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  covergae dut (.clk(clk),.rst(rst),.y(y));
  
  initial begin
    rst = 1;
    #5;
    rst = 0;
    
    #3000;
    $display("coverage = %0.2f %% ",dut.c.get_coverage());
    $finish;
  end
endmodule



# Loading sv_std.std
# Loading work.co(fast)
# Loading work.covergae(fast)
# 
# run -all
# coverage = 100.00 % 
# ** Note: $finish    : testbench.sv(261)
#    Time: 3005 ns  Iteration: 0  Instance: /co
# End time: 00:27:33 on May 14,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 00:27:33 on May 14,2026, Elapsed time: 0:00:02
*** Summary *********************************************
