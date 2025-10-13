
interface fa(input logic clk);
logic a,b,c;
logic sum,carry;
clocking cb @(posedge clk);
input a,b,c;
output sum,carry;
endclocking
//modport dut_mp(input a,b,c,output sum,carry);
endinterface

module full_adder(fa m);
assign m.sum=m.a^m.b^m.c;
assign m.carry=(m.a&m.b) | (m.b&m.c) | (m.c&m.a);
endmodule

module full_adder_tb();
logic clk=0;
always #5 clk=~clk;
 fa m(clk);// Instantiate the interface
 full_adder dut(m); //bundle passed directly
initial begin
@(posedge clk);
m.cb.a=0;m.cb.b=0;m.cb.c=0; @(posedge clk);;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.cb.a, m.cb.b, m.cb.c, m.cb.sum, m.cb.carry);

m.cb.a=0;m.cb.b=0;m.cb.c=1; @(posedge clk);;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.cb.a, m.cb.b, m.cb.c, m.cb.sum, m.cb.carry);

m.cb.a=0;m.cb.b=1;m.cb.c=1; @(posedge clk);;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.cb.a, m.cb.b, m.cb.c, m.cb.sum, m.cb.carry);

m.cb.a=1;m.cb.b=1;m.cb.c=0; @(posedge clk);;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.cb.a, m.cb.b, m.cb.c, m.cb.sum, m.cb.carry);

m.cb.a=1;m.cb.b=1;m.cb.c=1; @(posedge clk);;
$display("a=%0b b=%0b c=%0b ,out:sum=%0b carry=%0b", m.cb.a, m.cb.b, m.cb.c, m.cb.sum, m.cb.carry);
end
endmodule

o/p:
a=0 b=0 c=0 ,out:sum=0 carry=0
a=0 b=0 c=1 ,out:sum=1 carry=0
a=0 b=1 c=1 ,out:sum=0 carry=1
a=1 b=1 c=0 ,out:sum=0 carry=1
a=1 b=1 c=1 ,out:sum=1 carry=1
