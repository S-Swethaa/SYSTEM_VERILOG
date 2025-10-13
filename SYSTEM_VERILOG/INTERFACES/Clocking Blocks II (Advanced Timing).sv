interface fa;
logic a,b,c;
logic sum,carry;
clocking cb @(posedge clk);
input #1 a, b, c;
output #1 sum, carry;
endclocking
modport dut_mp(input a,b,c,output sum,carry);
endinterface

module full_adder(fa.dut_mp m);
assign m.sum=m.a^m.b^m.c;
assign m.carry=(m.a&m.b) | (m.b&m.c) | (m.c&m.a);
endmodule

module full_adder_tb();
logic clk=0;
always #5 clk=~clk;
fa m(clk);               // Instantiate interface
full_adder dut(m);       // Connect DUT using modport
initial begin
m.a=0;m.b=0;m.c=0; #1;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.a, m.b, m.c, m.sum, m.carry);

m.a=0;m.b=0;m.c=1; #1;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.a, m.b, m.c, m.sum, m.carry);

m.a=0;m.b=1;m.c=1; #1;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.a, m.b, m.c, m.sum, m.carry);

m.a=1;m.b=1;m.c=0; #1;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.a, m.b, m.c, m.sum, m.carry);

m.a=1;m.b=1;m.c=1; #1;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.a, m.b, m.c, m.sum, m.carry);
end
endmodule

o/p:
# One of the assignments is implicit. See design.sv(3).
# Time: 0 ns  Iteration: 0  Instance: /full_adder_tb/dut File: design.sv Line: 16
# 
# run -all
# a=0 b=0 c=0 out:sum=0 carry=0
# a=0 b=0 c=1 out:sum=1 carry=0
# a=0 b=1 c=1 out:sum=0 carry=1
# a=1 b=1 c=0 out:sum=0 carry=1
# a=1 b=1 c=1 out:sum=1 carry=1
# ** Note: $finish   
