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
    $display("data=%0d,id=%0d",data,id);
  endfunction
endclass

module encaps;
  initial  begin
    encap e = new();
    e.data=40;//illegal access local property only accessible in local class only
    e.display();
  end
endmodule

OUTPUT:
** Error (suppressible): (vlog-8688) design.sv(609): Illegal access to local member data.
        Full name of member: design_sv_unit::encap::data
        Full name of calling scope: outside a class context
End time: 04:18:01 on Nov 03,2025, Elapsed time: 0:00:01
Errors: 1, Warnings: 2
