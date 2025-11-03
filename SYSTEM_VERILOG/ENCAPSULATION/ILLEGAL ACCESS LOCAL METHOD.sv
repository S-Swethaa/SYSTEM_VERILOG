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
    e.display();
  end
endmodule

OUTPUT:
** Error (suppressible): (vlog-8688) design.sv(611): Illegal access to local member display.
        Full name of member: design_sv_unit::encap::display
        Full name of calling scope: outside a class context
End time: 04:44:32 on Nov 03,2025, Elapsed time: 0:00:00
Errors: 1, Warnings: 0
