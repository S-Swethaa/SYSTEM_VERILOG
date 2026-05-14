//// Write a covergroup with cross coverage combining address (high/low) and data (valid/invalid).


module ram(
    input clk,
    input rst,
    input w,
    input r,
    input [7:0] addr,
    input [7:0] datain,
    output reg [7:0] r_data
);

  reg [7:0] mem [0:7];
  integer i;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      for (i = 0; i < 8; i = i + 1) begin
        mem[i] <= 0;
      end
      r_data <= 0;
    end

    else begin

      if (w)
        mem[addr[2:0]] <= datain;

      if (r)
        r_data <= mem[addr[2:0]];
    end
  end


  covergroup vd @(posedge clk);
    coverpoint w {
      bins all[] = {0,1};}
    
    coverpoint r {
      bins all_r[] = {0,1};}
    
    coverpoint addr {
      bins low[]  = {[0:3]};
      bins high[] = {[4:7]};}
    
    coverpoint datain {
      bins invalid[] = {[0:127]};
      bins valid[]   = {[128:255]};}
    cross addr, datain;

  endgroup

  vd c = new();

endmodule
          module m;
  reg clk, rst, w, r;
  reg [7:0] addr, datain;
  wire [7:0] r_data;
  ram dut (
      .clk(clk),
      .rst(rst),
      .w(w),
      .r(r),
      .addr(addr),
      .datain(datain),
      .r_data(r_data)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin

    rst    = 1;
    w      = 0;
    r      = 0;
    addr   = 0;
    datain = 0;

    #10;
    rst = 0;
    @(posedge clk);
    w      = 1;
    r      = 0;
    addr   = 3;
    datain = 20;

    @(posedge clk);
    w    = 0;
    r    = 1;
    addr = 3;

    repeat (100) begin
      @(posedge clk);

      w      = 1;
      r      = 0;
      addr   = $urandom_range(0,7);
      datain = $urandom_range(0,255);
    end

    repeat (100) begin
      @(posedge clk);

      w    = 0;
      r    = 1;
      addr = $urandom_range(0,7);
    end

    // Stop operations
    @(posedge clk);
    w = 0;
    r = 0;

    #20;

    // Coverage
    $display("Coverage = %0.2f %%", dut.c.get_coverage());

    $finish;

  end

endmodule

# Loading sv_std.std
# Loading work.m(fast)
# Loading work.ram(fast)
# 
# run -all
# Coverage = 67.58 %
# ** Note: $finish    : testbench.sv(333)
#    Time: 2055 ns  Iteration: 0  Instance: /m
# End time: 01:04:26 on May 14,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 01:04:26 on May 14,2026, Elapsed time: 0:00:02
*** Summary *********************************************
