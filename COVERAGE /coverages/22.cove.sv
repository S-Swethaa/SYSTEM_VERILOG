 module err_coverage;
     logic clk,rst,parity_err,overflow,underflow;
     
     initial clk = 0;
     always #5 clk = ~ clk;
     
     covergroup cg @(posedge clk);
       coverpoint parity_err {bins p0 ={0};
                              bins p1 = {1};}
       coverpoint overflow {bins o0 ={0};
                            bins o1 = {1};}
       coverpoint underflow {bins u0 = {0};
                             bins u1 = {1};}
       cross parity_err,overflow,underflow;
     endgroup
     
     cg c = new();
     
     initial begin
       rst=1;
       parity_err=0;
       overflow=0;
       underflow=0;
       #5;
       rst=0;
       @(posedge clk);parity_err=1;overflow=0;underflow=0;
       @(posedge clk);parity_err=0;overflow=1;underflow=0;
       @(posedge clk);parity_err=0;overflow=0;underflow=1;
       @(posedge clk);parity_err=1;overflow=1;underflow=0;
       @(posedge clk);parity_err=0;overflow=1;underflow=1;
       @(posedge clk);parity_err=1;overflow=0;underflow=1;
       @(posedge clk);parity_err=0;overflow=0;underflow=0;
       
       repeat(20)begin
         @(posedge clk);
         parity_err=$urandom_range(0,1);
         overflow=$urandom_range(0,1);
         underflow=$urandom_range(0,1);
       end
       #20;
       $display("coverge = %0.2f %%",c.get_coverage());
       $finish;
     end
   endmodule
# // of the Customer's facilities without the express written permission of SISW,
# // and may not be used in any way not expressly authorized by SISW.
# //
# Loading sv_std.std
# Loading work.err_coverage(fast)
# 
# run -all
# coverge = 100.00 %
# ** Note: $finish    : design.sv(1852)
#    Time: 295 ns  Iteration: 0  Instance: /err_coverage
# End time: 13:14:44 on May 18,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 13:14:44 on May 18,2026, Elapsed time: 0:00:01
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
    vlog: Errors:   0, Warnings:   0
    vopt: Errors:   0, Warnings:   1
    vsim: Errors:   0, Warnings:   0
  Totals: Errors:   0, Warnings:   1
Done
