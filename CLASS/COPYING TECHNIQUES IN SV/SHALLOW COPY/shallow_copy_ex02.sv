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

function new(packet pkt = null);
    if (pkt==null) begin
      addr=20;
      data=40;
      d=new(5,10);
    end else begin
      addr=pkt.addr;
      data=pkt.data;
      d=pkt.d; // shallow copy
    end
  endfunction

//display function
function void display();
$display("det class:st_addr=%0d,end_addr=%0d",d.st_addr,d.end_addr);
$display("packet class:addr=%0d,data=%0d",addr,data);
endfunction
endclass

module shallow_copy_example;
packet p1,p2;
initial begin
p1=new();
$display("st_addr=%0d,end_addr=%0d",p1.d.st_addr,p1.d.end_addr);

p2=new(p1);//Shallow copy: p2 shares det object with p1
p2.addr=25;
p2.data=35;
p2.d.st_addr=18; // Change shared det's st_addr
$display("addr=%0d,data=%0d,st_addr=%0d",p2.addr,p2.data,p2.d.st_addr);
$display("p1:addr=%0d,data=%0d,st_addr=%0d",p1.addr,p1.data,p1.d.st_addr);
p1.display();
p2.display();
end
endmodule
o/p:
 Loading sv_std.std
# Loading work.shallow_Copy_EXample_sv_unit(fast)
# Loading work.shallow_copy_example(fast)
run
# st_addr=5,end_addr=10
# addr=25,data=35,st_addr=18
# p1:addr=20,data=40,st_addr=18

# det class:st_addr=18,end_addr=10
# packet class:addr=20,data=40

# det class:st_addr=18,end_addr=10
# packet class:addr=25,data=35
