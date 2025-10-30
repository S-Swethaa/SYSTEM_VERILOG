class scope_res;
  static int id;
  
  function display(int a,b);
    $display("the values are %0d %0d",a,b);
  endfunction
endclass

module scoperesolution;
  int id=10;
  initial begin
    scope_res s;
    s=new();
    scope_res::id=20;
    s.display(scope_res::id,id);
  end
endmodule

OUTPUT:
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
    s.display(scope_res::id,id);
            |
xmvlog: *W,FUNTSK (design.sv,374|12): function called as a task without void'().
	Top level design units:
		$unit_0x67f934e9
		scoperesolution
Loading snapshot worklib.scoperesolution:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run

the values are 20 10

xmsim: *W,RNQUIE: Simulation is complete.
