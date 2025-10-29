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
  mailbox g2d;
  mailbox m2s;
  event gen_done;
  virtual intf vif;

  function new(virtual intf vif);
    this.vif = vif;
    g2d = new();
    m2s = new();
    //gen_done = new.event; // event does not need new()
    gen = new(g2d);
    drv = new(vif, g2d, gen.gen_done);
    mon = new(vif, m2s);
    scb = new(m2s);
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

