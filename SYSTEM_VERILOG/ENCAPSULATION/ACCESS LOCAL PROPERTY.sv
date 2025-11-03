// DATA ENCAPSULATION AND HIDING
//declared local property
class encap;
  local int data;
  int addr;
  
  function new();
    data=99;
    addr=100;
  endfunction
  
  function void display();
    $display("data=%0d,id=%0d",data,addr);
  endfunction
endclass

module encaps;
  initial  begin
    encap e = new();
    e.display();
  end
endmodule

OUTPUT:
# 
# run -all
# data=99,id=100
# exit
# End time: 04:33:48 on Nov 03,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
    
