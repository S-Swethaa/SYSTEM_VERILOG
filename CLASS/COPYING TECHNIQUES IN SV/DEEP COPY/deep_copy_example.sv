class det;//class 1
bit [31:0]st_addr;
bit [31:0]end_addr;
//constructor new object allocation
function new(bit [31:0]st_addr=0,bit [31:0]end_addr=0);
this.st_addr=st_addr;
this.end_addr=end_addr;
endfunction

endclass
//class 2
class packet;
logic [31:0]addr;
logic [31:0]data;
det d;//haldle creation class 1

function new();
addr=20;
data=40;
d=new(1,2);
endfunction

function deep_copy(packet p);
this.addr=p.addr;
this.data=p.data;
this.d.st_addr=p.d.st_addr;
this.d.end_addr=p.d.end_addr;
endfunction

function void display();
$display("final data=%0d addr=%0d",data,addr);
$display("final st_addr=%0d,end_addr=%0d",d.st_addr,d.end_addr);
endfunction
endclass

module deep_copy_example;
packet p1,p2;
initial begin
p1=new();
$display("p1:st_addr=%0d,end_addr=%0d",p1.d.st_addr,p1.d.end_addr);
p2=new();
p2.deep_copy(p1);
$display("p2:st_addr=%0d,end_addr=%0d",p2.d.st_addr,p2.d.end_addr);
p2.addr=25;
p2.data=35;
p2.d.st_addr=18; 
$display("after changing p2:addr=%0d,data=%0d,st_addr=%0d",p2.addr,p2.data,p2.d.st_addr);
$display("after changing p1:addr=%0d,data=%0d,st_addr=%0d",p1.addr,p1.data,p1.d.st_addr);
p1.display();
p2.display();
end
endmodule

o/p:
Loading sv_std.std
# Loading work.shallow_Copy_EXample_sv_unit(fast)
# Loading work.deep_copy_example(fast)
run
# p1:st_addr=1,end_addr=2
# p2:st_addr=1,end_addr=2
# after changing p2:addr=25,data=35,st_addr=18
# after changing p1:addr=20,data=40,st_addr=1
# final data=40 addr=20
# final st_addr=1,end_addr=2
# final data=35 addr=25
# final st_addr=18,end_addr=2
