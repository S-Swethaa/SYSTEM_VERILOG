module m;
  logic clk, rst;
  logic [63:0] packet_size;

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  // Covergroup for packet size ranges
  covergroup cg @(posedge clk);
    coverpoint packet_size {
      bins vvvh  = {[2**56 : 2**64-1]};   // very very high
      bins vvh   = {[2**48 : 2**56-1]};   // very high
      bins vh    = {[2**40 : 2**48-1]};   // high
      bins h     = {[2**32 : 2**40-1]};   // medium-high
      bins lllv  = {[2**24 : 2**32-1]};   // medium-low
      bins llv   = {[2**16 : 2**24-1]};   // low
      bins lv    = {[2**8  : 2**16-1]};   // very low
      bins l     = {[0     : 2**8-1]};    // tiny
    }
  endgroup

  cg c = new();

  initial begin
    rst = 1;
    packet_size = 0;
    #5 rst = 0;

    repeat(1000) begin
      @(posedge clk);
      packet_size = $urandom_range(0, 64'hFFFF_FFFF_FFFF_FFFF);
    end

    #30;
    $display("Coverage = %0.2f %%", c.get_coverage());
    $finish;
  end
endmodule

    # ** Warning: (vsim-3882) design.sv(1704): Out of bounds value range in bin 'vvvh' for Coverpoint 'packet_size' converted to nearest valid bounded range of [72057594037927936:0].
#    Time: 0 ns  Iteration: 0  Instance: /m
# Coverage = 50.00 %
# ** Note: $finish    : design.sv(1729)
#    Time: 10035 ns  Iteration: 0  Instance: /m
# End time: 12:24:57 on May 18,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 2
End time: 12:24:57 on May 18,2026, Elapsed time: 0:00:01
*** Summary *********************************************
