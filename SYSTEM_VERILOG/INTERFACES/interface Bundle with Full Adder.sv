interface fa;
logic a,b,c;
logic sum,carry;
modport dut_mp(input a,b,c,output sum,carry);
modport tb_mp(output a,b,c,input sum,carry);
endinterface

module full_adder(fa.dut_mp m);
assign m.sum=m.a^m.b^m.c;
assign m.carry=(m.a&m.b) | (m.b&m.c) | (m.c&m.a);
endmodule

module full_adder_tb();
 fa m(); // Instantiate the interface
 full_adder dut(m); // bundle passed directly
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

