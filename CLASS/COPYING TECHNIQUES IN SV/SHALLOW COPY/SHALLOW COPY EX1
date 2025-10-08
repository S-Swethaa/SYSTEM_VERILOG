//New packet object is created with copied addr and data, but nested a handle is shared. Changing p2.a affects p1.a.

//class 1
class addrr;
logic [31:0]st_addr;
logic [31:0]end_addr;

function new();//constructor new for class 1
st_addr=50;
end_addr=45;
endfunction
endclass

//class 2
class packet;
logic [31:0]addr;
logic [31:0]data;
addrr a;  //calling class1 create handle

function new();//constructor new for class 2
addr=2;
data='hff;
a=new();
endfunction

function void display();//display the values
$display("st_addr=%0d",a.st_addr);
$display("end_addr=%0d",a.end_addr);
$display("addr=%0d",addr);
$display("data=%0d",data);
endfunction
endclass

module shallow_copy_ex1;
packet p1,p2;
initial begin
p1=new();
$display("to display the packet 1");
p1.display();
p2=new p1;
$display("to display the packet 2");
p2.display();
p2.addr=80;
p2.a.st_addr=5;
p2.a.end_addr=9;
$display("to display the packet 1 after changing packet 2 properties");
p1.display();
$display("to display the packet 2 after changing packet 2 properties");
p2.display();
end
endmodule

o/p:
# Loading sv_std.std
# Loading work.shallow_copy_ex2_sv_unit(fast)
# Loading work.shallow_copy_ex1(fast)
run
# to display the packet 1
# st_addr=50
# end_addr=45
# addr=2
# data=255
# to display the packet 2
# st_addr=50
# end_addr=45
# addr=2
# data=255
# to display the packet 1 after changing packet 2 properties
# st_addr=5
# end_addr=9
# addr=2
# data=255
# to display the packet 2 after changing packet 2 properties
# st_addr=5
# end_addr=9
# addr=80
# data=255
