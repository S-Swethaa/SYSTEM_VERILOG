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
  event gn;
  mailbox g2d;
  mailbox m2s;
  virtual intf vif;

  function new(virtual intf vif);
    this.vif = vif;
    g2d = new();
    m2s = new();
    gen = new(g2d);
    drv = new(vif, g2d);
    mon = new(vif, m2s);
    scb = new(m2s);
    gen.gn = gn;
    scb.gn = gn;
  endfunction

  task run();
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join_none
  endtask
endclass
    
  
