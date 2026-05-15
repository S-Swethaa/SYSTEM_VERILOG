//5. Write a property combining overlapping (`|->`) and non-overlapping (`|=>`) implications for pipeline.
      module m;
        logic clk,rst,valid,out1,out2,out3,out4;
        
        initial clk=0;
        always #5 clk = ~ clk;
        
        property p;
          @(posedge clk)
          disable iff(rst)
          valid |-> out1
                |=> out2
                |-> out3
                 |=>out4;
        endproperty
        
        assert property(p)
          $display("pipeline assertion pass");
          else
            $display("pipeline assertion failed");
          
          initial begin
            rst=1;
            valid=0;
            out1=0;out2=0;out3=0;out4=0;
            #5;
            rst=0;
            valid=1;
            out1=1;
            valid=1;
            repeat(2)
              @(posedge clk);
            out2<=1;
            valid<=1;
            @(posedge clk);
            out2<=1;
            valid<=1;
            @(posedge clk);
            out3<=1;
            valid<=1;
            @(posedge clk);
            out4<=1;
            #50;
            $finish;
          end
          endmodule
          # Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# pipeline assertion pass
# pipeline assertion pass
# pipeline assertion pass
# pipeline assertion pass
# ** Note: $finish    : design.sv(1216)
#    Time: 105 ns  Iteration: 0  Instance: /m
# End time: 11:16:41 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 11:16:41 on May 15,2026, Elapsed time: 0:00:02
*** Summary *********************************************
            
            
        
        
    
