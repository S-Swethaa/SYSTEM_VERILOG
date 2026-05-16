//// Write assertions for simple memory protocol: write_cmd -> write_done (2 cycles), read_cmd -> data_valid (3 cycles), prevent simultaneous read/write.

module m;
  logic clk,rst,write_cmd,write_done,read_cmd,data_valid;
  
  initial clk = 0;
  always #5 clk = ~ clk;
  
  property p;
    @(posedge clk)
    disable iff (rst)
    write_cmd|-> ##2 write_done;
  endproperty
  
  assert property (p)
    $display(" assertion pass : write command pass in 2 clock cycle write done");
    else
      $display(" assertion fail : write command  not pass in 2 clock cycle write done");

  
  
  property po;
    @(posedge clk)
    disable iff (rst)
    read_cmd|-> ##3 data_valid;
  endproperty
    
    assert property (po)
      $display("assertion pass: read_cmd high after 3 clkck cycle data_is_valid");
      else
        $display("assertion fail: read_cmd high after 3 clkck cycle data_is_not_valid");

  
  property poo;
    @(posedge clk)
    disable iff(rst)
    !(write_cmd && read_cmd);
  endproperty
      
      assert property (poo)
        $display("assertion pass : write and read not happen in same cycle");
        else
          $display("assertion fail : write and read happen in same cycle");
        
        initial begin
          $monitor("$time=%0t | write_cmd = %0d | read_cmd = %0d |data_valid=%0d",$time,write_cmd,read_cmd,data_valid);
          rst=1;
          write_cmd=0;
          read_cmd=0;
          data_valid=0;
          #5;
          rst=0;
          write_cmd=1;
          repeat(2)
          @(posedge clk);
          write_cmd<=1;
          write_done<=1;
          #5;
          read_cmd=1;
          repeat(3)
            @(posedge clk);
          read_cmd<=1;
          data_valid<=1;
          #5;
          
          @(posedge clk);
          write_cmd<=1;
          read_cmd<=1;
          #5;
          @(posedge clk);
          write_cmd<=1;
          @(posedge clk);
          read_cmd<=1;
          #50;
          $finish;
        end
        endmodule
        # Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# $time=0 | write_cmd = 0 | read_cmd = 0 |data_valid=0
# assertion pass : write and read not happen in same cycle
# $time=5 | write_cmd = 1 | read_cmd = 0 |data_valid=0
# assertion pass : write and read not happen in same cycle
# assertion pass : write and read not happen in same cycle
# $time=30 | write_cmd = 1 | read_cmd = 1 |data_valid=0
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
# $time=55 | write_cmd = 1 | read_cmd = 1 |data_valid=1
# assertion pass: read_cmd high after 3 clkck cycle data_is_valid
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
# assertion pass: read_cmd high after 3 clkck cycle data_is_valid
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
# assertion pass: read_cmd high after 3 clkck cycle data_is_valid
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
# assertion pass: read_cmd high after 3 clkck cycle data_is_valid
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
# assertion pass: read_cmd high after 3 clkck cycle data_is_valid
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
# assertion pass: read_cmd high after 3 clkck cycle data_is_valid
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
# assertion pass: read_cmd high after 3 clkck cycle data_is_valid
#  assertion pass : write command pass in 2 clock cycle write done
# assertion fail : write and read happen in same cycle
# ** Note: $finish    : design.sv(1145)
#    Time: 135 ns  Iteration: 0  Instance: /m
# End time: 09:02:51 on May 16,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 09:02:51 on May 16,2026, Elapsed time: 0:00:02
*** Summary *********************************************
            
          
          
      
