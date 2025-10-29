//MONITOR CLASS
class monitor;
  virtual intf vif;
  mailbox m2s;

  function new(virtual intf vif, mailbox m2s);
    this.vif = vif;
    this.m2s = m2s;
  endfunction

  task main();
    repeat (5) begin
      transaction trans;
      #1;// wait for DUT outputs to stabilize
      trans = new();
      trans.a = vif.a;
      trans.b = vif.b;
      trans.c = vif.c;
      trans.sum = vif.sum;
      trans.carry = vif.carry;
      trans.display("Monitor class signals");
      m2s.put(trans);
    end
  endtask
endclass
