//DRIVER CLASS WAITING FOR EVENT
class driver;
  virtual intf vif;
  mailbox g2d;
  event gen_done;

  function new(virtual intf vif, mailbox g2d, event gen_done);
    this.vif = vif;
    this.g2d = g2d;
    this.gen_done = gen_done;
  endfunction

  task main();
    repeat (5) begin
       transaction trans;
      g2d.get(trans);
      wait(gen_done.triggered); // Wait for generator     
      // if synchronous means we aplly a clk
      vif.a <= trans.a;
      vif.b <= trans.b;
      vif.c <= trans.c;
      #1;
      $display("Driver class inputs");
    end
  endtask
endclass
