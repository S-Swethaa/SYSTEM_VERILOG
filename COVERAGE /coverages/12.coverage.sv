//1. Write comprehensive covergroup for memory protocol: address ranges [0:4K], [4K:8K], [8K:16K]; data patterns (zeros, ones, alternating); access types (read, write, read-after-write).
module m;

  logic clk, rst;
  logic read, write, read_after_write;

  logic [21:0] addr;
  logic [31:0] data;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  covergroup cg @(posedge clk);
    coverpoint read {
      bins read_op = {1};
    }

    coverpoint write {
      bins write_op = {1};
    }

    coverpoint read_after_write {
      bins raw_op = {1};
    }
    coverpoint addr {

      bins low_range  = {[0:4095]};

      bins mid_range  = {[4096:8191]};

      bins high_range = {[8192:16383]};
    }
    coverpoint data {

      bins zeros      = {32'h00000000};

      bins ones       = {32'hFFFFFFFF};

      bins alternating1 = {32'hAAAAAAAA};

      bins alternating2 = {32'h55555555};
    }

  endgroup
  cg c = new();
  initial begin

    rst = 1;
    read = 0;
    write = 0;
    read_after_write = 0;
    addr = 0;
    data = 0;

    #20;
    rst = 0;

    @(posedge clk);
    read  = 1;
    write = 0;
    addr  = 100;
    data  = 32'h00000000;

    @(posedge clk);
    read  = 0;
    write = 1;
    addr  = 5000;
    data  = 32'hFFFFFFFF;

    @(posedge clk);
    read  = 1;
    write = 1;
    addr  = 12000;
    data  = 32'hAAAAAAAA;

    @(posedge clk);
    read_after_write = 1;
    read  = 1;
    write = 0;
    addr  = 7000;
    data  = 32'h55555555;

    @(posedge clk);
    read  = 0;
    write = 1;
    addr  = 16000;
    data  = 32'hAAAAAAAA;

    #20;
    $display("coverage = %0.2f %%",c.get_coverage());
    $finish;

  end

endmodule
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# coverage = 100.00 %
# ** Note: $finish    : design.sv(1382)
#    Time: 85 ns  Iteration: 0  Instance: /m
# End time: 12:16:04 on May 16,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 12:16:04 on May 16,2026, Elapsed time: 0:00:01
*** Summary *********************************************


    
    
                     

      
    
    
    
       
          
      
