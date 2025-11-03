//*********PARAMETERIZED CLASSESS************
//WITHOUT OVERRIDING
class transaction #(parameter int addr_width=16,data_width=32);
 bit [addr_width-1:0]addr;
  bit [data_width-1:0]data;
  
  function new();
    addr='h23456;
    data='h65432;
  endfunction
  
  function void display();
    $display("the addr=%0d,data=%0d,addr_width=%0d,data_width=%0d",
             addr,data,addr_width,data_width);
  endfunction
endclass

module parameterex;
  initial begin
   // transaction #(32,64) t;
    transaction t;
    t=new();
    t.addr=987654;
    t.data=4352762;
    t.display();
  end
endmodule

OUTPUT:
# Loading sv_std.std
# Loading work.design_sv_unit(fast)
# Loading work.parameterex(fast)
# 
# run -all
# the addr=4614,data=4352762,addr_width=16,data_width=32
# exit
# End time: 01:25:09 on Nov 03,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0


//WITH OVERRIDING 
class transaction #(parameter int addr_width=16,data_width=32);
 bit [addr_width-1:0]addr;
  bit [data_width-1:0]data;
  
  function new();
    addr='h23456;
    data='h65432;
  endfunction
  
  function void display();
    $display("the addr=%0d,data=%0d,addr_width=%0d,data_width=%0d",
             addr,data,addr_width,data_width);
  endfunction
endclass

module parameterex;
  initial begin
    transaction #(32,64) t;
    t=new();
    t.addr=987654;
    t.data=4352762;
    t.display();
  end
endmodule
OUTPUT:
# Loading sv_std.std
# Loading work.design_sv_unit(fast)
# Loading work.parameterex(fast)
# 
# run -all
# the addr=987654,data=4352762,addr_width=32,data_width=64
# exit
# End time: 01:28:11 on Nov 03,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0

