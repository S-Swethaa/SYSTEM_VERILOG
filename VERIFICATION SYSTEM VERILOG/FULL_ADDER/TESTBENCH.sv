// Code your testbench here
// or browse Examples
//TOP LEVEL TESTBENCH
`include "environment.sv"
`include "interface.sv"
`include "test.sv"
module testbench();
  intf intf_inst();
  test tst(intf_inst);
  full_adder dut(.a(intf_inst.a), .b(intf_inst.b), .c(intf_inst.c),
                 .sum(intf_inst.sum), .carry(intf_inst.carry));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
