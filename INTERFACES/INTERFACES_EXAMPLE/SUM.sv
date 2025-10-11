module sum(interface intf sintf);
assign sintf.y=sintf.a+sintf.b;
endmodule

//interface creation
interface intf #(parameter N);
logic [N-1:0]a;
logic [N-1:0]b;
logic [N-1:0]y;
endinterface

//top module
module sumoftwoip;
parameter N=4;
intf #(N)sintf();//instantiate the interface,sintf=object contain 3 four bit s/l;
sum dut(sintf);//instantiate the design module

initial begin
sintf.a=4'd12;
sintf.b=4'd17;
#10;
sintf.a=4'd12;
sintf.b=4'd12;
#10;
end

always @(sintf.a or sintf.b)
$display("time=%0t,ip:a=%0d,b=%0d,  output:y=%0d",$time,sintf.a,sintf.b,sintf.y);
endmodule

O/P:
time=0,ip:a=12,b=17,output:y=29
time=10, ip:a=12,b=12,output:y=24
