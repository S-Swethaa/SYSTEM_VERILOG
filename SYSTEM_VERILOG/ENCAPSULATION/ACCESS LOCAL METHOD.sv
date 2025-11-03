// DATA ENCAPSULATION AND HIDING
//declared local property
class encap;
  local int data;
  int addr;
  
  function new();
    data=99;
    addr=100;
    display();
  endfunction
  
  local function void display();
    $display("data=%0d,id=%0d",data,addr);
  endfunction
endclass

module encaps;
  encap e;
  initial  begin
   e = new();
  end
endmodule
OUTPUT:
# run -all
# data=99,id=100
# exit
    
