//New packet object is created with copied , but nested a handle is shared.
class a;
int j=15;
endclass

class b;
int i=20;
a a_inst =new;
endclass

module shallow_copy;
b tr1,tr2;
initial begin
tr1=new();
tr2=new tr1; // with new shallow copy: both handles point to different object
//tr2=tr1; without new shallow copy: both handles point to same 'b' object
tr2.i=30;
tr2.a_inst.j=10;
$display("tr1.i=%0d",tr1.i);
$display("tr2.i=%0d",tr2.i);
$display("tr1.a_inst.j = %0d", tr1.a_inst.j);
$display("tr2.a_inst.j = %0d", tr2.a_inst.j);
end
endmodule

o/p:
 Loading sv_std.std
# Loading work.shallow_copy_sv_unit(fast)
# Loading work.shallow_copy(fast)
run
# tr1.i=20
# tr2.i=30
# tr1.a_inst.j = 10
# tr2.a_inst.j = 10


