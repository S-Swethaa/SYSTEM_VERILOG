
//dynamic casting
class bs;
  int data;
   
  function void display();
    $display("BASE CLASS:data=%0d",data);
  endfunction
endclass

class child_class extends bs;
  int id;
  function void display();
    super.display();
    $display("child class:id=%0d",id);
  endfunction
endclass

module dyn_casting;
  initial begin
    bs b;
    child_class c = new();
    c.data=10;
    c.id=1;
    c = b;
    c.display();
  end
endmodule

o/p:
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
    child_class c = new();
                  |
xmvlog: *W,VARIST (design.sv,400|18): Local static variable with initializer requires 'static' keyword.
    c = b;
        |
xmvlog: *E,TYCMPAT (design.sv,403|8): assignment operator type check failed (expecting datatype compatible with 'class $unit::child_class' but found 'class $unit::bs' instead).
xrun: *E,VLGERR: An error occurred during parsing. 
    
