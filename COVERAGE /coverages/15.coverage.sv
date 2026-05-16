//Q1. How would you write coverage for a 32-bit data bus ensuring corner cases are hit?  
module m;
  logic clk,rst;
  logic [31:0]data;
  
  covergroup cg @(posedge clk);
    coverpoint data {bins data_range ={[31:24]};
                     bins midhigh = {[16:23]};
                     bins mid = {[8:15]};
                     bins low = {[0:7]};}
  endgroup
  
  cg c = new();
  initial clk = 0;
  always #5 clk  = ~ clk;
  
  initial begin
    rst=1;
    data=0;
    #5;
    data = $urandom_range (0,4294967295);
    #500;
    $display(" coverage = %0.2f %%",c.get_coverage());
    $finish;
  end
endmodule
#  coverage = 25.00 %
# ** Note: $finish    : design.sv(1466)
#    Time: 505 ns  Iteration: 0  Instance: /m
# End time: 13:02:10 on May 16,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 13:02:10 on May 16,2026, Elapsed time: 0:00:01
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
    vlog: Errors:   0, Warnings:   1
    vopt: Errors:   0, Warnings:   1
    vsim: Errors:   0, Warnings:   0
    
    
    
    
       
          
      
