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
  mailbox g2d, m2s;
  event gn;
  virtual intf vif;

  function new(virtual intf vif);
    this.vif = vif;
    g2d = new();
    m2s = new();
    gen = new(g2d);
    drv = new(g2d, vif);
    mon = new(m2s, vif);
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
    join
  endtask
endclass
