//encapsulation example
// ACCESS THE LOCAL KEYWORD - ONLY THAT CLASS AND METHOD
class bs;
  local int i;
  
  function void display(int a);
    i=a;
    $display("the value of i =%0d,a=%0d",i,a);
  endfunction  
endclass

module de_ex;
  initial begin
    bs b = new();
    b.display(10);
  end
endmodule
OUTPUT:
# Loading sv_std.std
# Loading work.design_sv_unit(fast)
# Loading work.de_ex(fast)
# 
# run -all
# the value of i =10,a=10
# exit
# End time: 06:28:05 on Oct 31,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
