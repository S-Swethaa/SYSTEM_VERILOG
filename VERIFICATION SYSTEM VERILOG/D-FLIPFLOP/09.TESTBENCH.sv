

`include "interface.sv"
`include "environment.sv"
`include "test.sv"

module testbench();
intf i();
test t(i);
d_ff dut(.d(i.d), .rst(i.rst), .clk(i.clk), .q(i.q));

initial i.clk=0;
always #5 i.clk=~i.clk;

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,testbench);
#500;
$finish;
end
endmodule
