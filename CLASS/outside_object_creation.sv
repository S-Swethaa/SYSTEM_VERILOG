class obj_crea;
bit [31:0] addr;
int data;
endclass

module outside_object_creation;
obj_crea o1,o2;
initial begin
o1=new();
o1.addr=30;
o1.data=255;
$display("data=%0d,addr=%0d",o1.data,o1.addr);

o2.addr=3;
o1.data=25;
$display("data=%0d,addr=%0d",o2.data,o2.addr);
end
endmodule

o/p:
Loading sv_std.std
# Loading work.outside_object_creation_sv_unit(fast)
# Loading work.outside_object_creation(fast)
run
# data=255,addr=30
# ** Fatal: (SIGSEGV) Bad handle or reference.                   //no onject creation in o2 ,so getting error
#    Time: 0 ns  Iteration: 0  Process: /outside_object_creation/#INITIAL#8 File: C:/Users/praka/AppData/Local/quartus/outside_object_creation.sv
# Fatal error in Module outside_object_creation at C:/Users/praka/AppData/Local/quartus/outside_object_creation.sv line 14
# 
# HDL call sequence:
# Stopped at C:/Users/praka/AppData/Local/quartus/outside_object_creation.sv 14 Module outside_object_creation
# 




