//ENVIRONMENT:INCLUDE ALL LOWERR CLASS
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
generator gen;
driver drv;
monitor mon;
scoreboard scb;
virtual intf vif;
mailbox g2d;
mailbox m2s;

function new(virtual intf vif);
this.vif = vif;
g2d=new();
m2s=new();
gen=new(g2d);
drv=new(vif, g2d);
mon=new(vif, m2s);
scb=new(m2s);
endfunction

task run();
fork
gen.main();
drv.main();
mon.main();
scb.main();
join
endtask
endclass

//ARCHITECTURE TEST

program test(intf vif);
  environment env;

  initial begin
    env = new(vif);
    env.run();
  end
endprogram
