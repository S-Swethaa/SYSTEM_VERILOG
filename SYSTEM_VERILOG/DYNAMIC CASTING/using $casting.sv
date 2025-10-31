//dynamic casting
class bs;
  int data=20;
   
  function void display();
    $display("BASE CLASS:data=%0d",data);
  endfunction
endclass

class child_class extends bs;
  int id=2;
  function void display();
    super.display();
    $display("child class:id=%0d",id);
  endfunction
endclass

module dyn_casting;
  initial begin
   bs b;
    child_class c = new();
    child_class c1;
    b=c;
    $cast(c1,b);
    c1.display();
  end
endmodule

OUTPUT:
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
    child_class c = new();
                  |
xmvlog: *W,VARIST (design.sv,400|18): Local static variable with initializer requires 'static' keyword.
	Top level design units:
		$unit_0x67f934e9
		dyn_casting
Loading snapshot worklib.dyn_casting:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
BASE CLASS:data=20
child class:id=2
xmsim: *W,RNQUIE: Simulation is complete.
