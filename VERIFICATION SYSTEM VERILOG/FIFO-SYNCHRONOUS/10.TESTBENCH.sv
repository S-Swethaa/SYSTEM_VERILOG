
`include "interface.sv"
`include "test.sv"

module testbench;
  intf i();

  sync_fifo #(8,16) dut (
    .clk(i.clk),
    .rst(i.rst),
    .w_en(i.w_en),
    .r_en(i.r_en),
    .din(i.din),
    .empty(i.empty),
    .full(i.full),
    .dataout(i.dataout)
  );

  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, testbench);
  $dumpvars(1, testbench.dut);
  $dumpvars(1, testbench.i);
end

  initial begin
    i.clk = 0;
    forever #5 i.clk = ~i.clk;
  end

  initial begin
    i.rst = 1;
    #15;
    i.rst = 0;
  end

  initial begin
    #100;
    $finish;
  end
endmodule
