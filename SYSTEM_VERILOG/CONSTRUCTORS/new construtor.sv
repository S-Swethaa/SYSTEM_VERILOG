//*********** new method //constructors

class transaction;
  int data;
  int addr;
  
  function new();
    addr=10;
    data=10;
  endfunction
  
  function void display();
    $display("the addr=%0d,data=%0d",addr,data);
  endfunction
endclass

module packet;
  initial begin
    transaction trans = new();//allocate memory +call constructor
    trans.display();
  end
    endmodule

output:
# Loading work.design_sv_unit(fast)
# Loading work.packet(fast)
# 
# run -all
# the addr=10,data=10
# exit
# End time: 00:39:54 on Nov 03,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
