//- Write a SystemVerilog snippet where a Driver class uses a Transaction class handle before Transaction is defined

typedef class transaction;
class driver;
  bit [31:0]c,d;
  transaction trans;
  function void display();
    trans.randomize();
    c=trans.a;
    d=trans.b;
    $display("the transaction ip values:a=%0d,b=%0d",trans.a,trans.b);
    $display("the driver ip values c=%0d,d=%0d",c,d);
  endfunction
endclass
  
  class transaction;
    rand bit [31:0]a,b;
  endclass
  
  
   module typedefex;
     initial begin
       driver d = new();
       d.trans = new();
     //  d.trans.randomize();
       d.display();
     end
   endmodule

  OUTPUT:
  # Loading sv_std.std
# Loading work.design_sv_unit(fast)
# Loading work.typedefex(fast)
# 
# run -all
# the transaction ip values:a=3524381154,b=3839725960
# the driver ip values c=3524381154,d=3839725960
# exit
# End time: 02:30:46 on Nov 05,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
