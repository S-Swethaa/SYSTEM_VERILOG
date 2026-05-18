module wild_card_cov;
  logic clk, rst;
  logic [7:0] data;

  covergroup cg @(posedge clk);
    coverpoint data {
      bins b[] = {[128:255]} with (item[7] == 1 && item[0] == 0);
    }
  endgroup

  cg c = new();

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    rst = 1;
    data = 0;
    #5 rst = 0;

    repeat(500) begin
      @(posedge clk);
      data = $urandom_range(128,255);
    end

    #50;
    $display("Coverage = %0.2f %%", c.get_coverage());
    $finish;
  end
endmodule
# // of the Customer's facilities without the express written permission of SISW,
# // and may not be used in any way not expressly authorized by SISW.
# //
# Loading sv_std.std
# Loading work.wild_card_cov(fast)
# 
# run -all
# Coverage = 98.44 %
# ** Note: $finish    : design.sv(1761)
#    Time: 5055 ns  Iteration: 0  Instance: /wild_card_cov
# End time: 12:44:07 on May 18,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 12:44:07 on May 18,2026, Elapsed time: 0:00:01
*** Summary *********************************************

       
          
      
