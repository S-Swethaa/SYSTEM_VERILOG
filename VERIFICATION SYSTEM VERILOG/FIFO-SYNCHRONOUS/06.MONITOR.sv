class monitor;
  virtual intf vif;
  mailbox m2s;
  transaction trans;

  function new(virtual intf vif, mailbox m2s);
    this.vif = vif;
    this.m2s = m2s;
  endfunction

  task main();
    forever begin
      @(posedge vif.clk);
      trans = new();
      trans.din = vif.din;
      trans.w_en = vif.w_en;
      trans.r_en = vif.r_en;
      #1;
      trans.full = vif.full;
      trans.empty = vif.empty;
      trans.dataout = vif.dataout;
      m2s.put(trans);
      trans.display("Monitor");
    end
  endtask
endclass
