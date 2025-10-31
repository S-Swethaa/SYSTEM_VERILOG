class driver;
  virtual intf vif;
  mailbox g2d;
  transaction trans;

  function new(mailbox g2d, virtual intf vif);
    this.g2d=g2d; this.vif=vif;
  endfunction

  task main();
    wait(vif.rst==0);
    repeat(20) begin
      g2d.get(trans);
      @(posedge vif.clk);
      vif.din <=trans.din;
      vif.addr<=trans.addr;
      vif.rw<=1;
      //vif.rst<=trans.rst;
      @(posedge vif.clk);    
      vif.rw<=0;
      trans.display("DRIVER CLASS SIGNALS");
     
    // #2; // Wait for transaction to register at DUT
    end
  endtask
endclass

