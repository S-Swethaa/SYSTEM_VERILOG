class driver;
  virtual intf vif;
  transaction trans;
  mailbox g2d;

  function new(virtual intf vif, mailbox g2d);
    this.vif = vif;
    this.g2d = g2d;
  endfunction

  task main();
    wait(vif.rst == 0);
    forever begin
      g2d.get(trans);
      @(vif.cb);
      vif.cb.w_en <= (!vif.full && trans.w_en);
      vif.cb.r_en <= (!vif.empty && trans.r_en);
      vif.cb.din <= trans.din;
      trans.display("Driver");
    end
  endtask
endclass
