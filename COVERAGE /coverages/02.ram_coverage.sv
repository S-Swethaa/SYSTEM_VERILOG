// Write a covergroup that tracks read_en and write_en signal combinations.
module ram(
  input clk,rst,w,r,
  input [7:0]addr,datain,
  output reg [7:0]r_data);
  
  reg [7:0]mem [0:7];
  
  integer i;
  always @(posedge clk or posedge rst)begin
    if(rst)begin
      for(i=0;i<8;i++)begin
        mem[i]<=0;
        r_data<=0;
      end
    end
      else begin
        if(w)
          mem[addr[2:0]]<=datain;
        
          if(r)
            r_data<=mem[addr[2:0]];
      end
  end
  
  covergroup vd @(posedge clk );
    coverpoint w{ bins all[]={0,1};}
    coverpoint r{ bins all_r[]= {0,1};}
  endgroup
  
  vd c = new();
endmodule
        
          module m;
  reg clk,rst,w,r;
  reg [7:0]addr,datain;
  wire [7:0]r_data;
  
  initial clk =0;
  always #5 clk = ~clk;
  
  ram dut (.clk(clk),.rst(rst),.w(w),.r(r),.addr(addr),.datain(datain),.r_data(r_data));
  
  initial begin
    rst = 1;
    #5;
    rst = 0;
    w=1;
    r=0;
    addr=10;
    datain=20;
    #10;
     w=0;
    r=1;
    addr=10;
    datain=20;
    #10;
    repeat (50)begin
      w=1;
      r=0;
      addr = $urandom_range(0,7);
      datain=$urandom_range(0,255);
    end
    
    repeat (50)begin
      w=0;
      r=1;
      addr = $urandom_range(0,7);
    end
    
    #20;
    $display("coverage = %0.2f %%",dut.c.get_coverage());
    $finish;
  end
  endmodule
    
      
    
# Loading sv_std.std
# Loading work.m(fast)
# Loading work.ram(fast)
# 
# run -all
# coverage = 100.00 %
# ** Note: $finish    : testbench.sv(304)
#    Time: 45 ns  Iteration: 0  Instance: /m
# End time: 00:51:35 on May 14,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
