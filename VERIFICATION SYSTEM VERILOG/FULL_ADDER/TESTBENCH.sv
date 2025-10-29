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

o/p:
# Loading sv_std.std
# Loading work.design_sv_unit(fast)
# Loading work.testbench(fast)
# Loading work.intf(fast__2)
# Loading work.test(fast)
# Loading work.full_adder(fast)
# Loading work.intf(fast)
# 
# run -all
# ---- Generator class signal ----
# $time=0,a=0 b=1 c=1 sum=0 carry=0
# ---- Generator class signal ----
# $time=0,a=1 b=0 c=0 sum=0 carry=0
# ---- Generator class signal ----
# $time=0,a=1 b=0 c=0 sum=0 carry=0
# ---- Generator class signal ----
# $time=0,a=0 b=1 c=0 sum=0 carry=0
# ---- Generator class signal ----
# $time=0,a=1 b=0 c=1 sum=0 carry=0
# Driver class inputs
# ---- Monitor class signals ----
# $time=1,a=0 b=1 c=1 sum=0 carry=1
# ---- Scoreboard class signals ----
# $time=1,a=0 b=1 c=1 sum=0 carry=1
# ***PASS***,ref_sum=0,ref_carry=1,trans.sum=0,trans.carry=1
# ---- Monitor class signals ----
# $time=2,a=0 b=1 c=1 sum=0 carry=1
# ---- Scoreboard class signals ----
# $time=2,a=0 b=1 c=1 sum=0 carry=1
# ***PASS***,ref_sum=0,ref_carry=1,trans.sum=0,trans.carry=1
# ---- Monitor class signals ----
# $time=3,a=0 b=1 c=1 sum=0 carry=1
# ---- Scoreboard class signals ----
# $time=3,a=0 b=1 c=1 sum=0 carry=1
# ***PASS***,ref_sum=0,ref_carry=1,trans.sum=0,trans.carry=1
# ---- Monitor class signals ----
# $time=4,a=0 b=1 c=1 sum=0 carry=1
# ---- Scoreboard class signals ----
# $time=4,a=0 b=1 c=1 sum=0 carry=1
# ***PASS***,ref_sum=0,ref_carry=1,trans.sum=0,trans.carry=1
# ---- Monitor class signals ----
# $time=5,a=0 b=1 c=1 sum=0 carry=1
# ---- Scoreboard class signals ----
# $time=5,a=0 b=1 c=1 sum=0 carry=1
# ***PASS***,ref_sum=0,ref_carry=1,trans.sum=0,trans.carry=1
# exit
# End time: 05:32:19 on Oct 29,2025, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
End time: 05:32:19 on Oct 29,2025, Elapsed time: 0:00:01
