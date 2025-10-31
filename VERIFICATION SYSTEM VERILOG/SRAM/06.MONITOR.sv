
class monitor;
  virtual intf vif;
  mailbox m2s;
  transaction trans;

  function new(mailbox m2s, virtual intf vif);
    this.m2s = m2s; this.vif = vif;
  endfunction

  task main();
    repeat(20) begin
      @(posedge vif.clk);
      //#1;
      trans=new();
      trans.rst=vif.rst;
      trans.rw=vif.rw;
      trans.addr=vif.addr;
      trans.din=vif.din;
     //#1;
      trans.dataout=vif.dataout;
      trans.display("MONITOR CLASS SIGNALS");
      m2s.put(trans);
    end
  endtask
endclass
