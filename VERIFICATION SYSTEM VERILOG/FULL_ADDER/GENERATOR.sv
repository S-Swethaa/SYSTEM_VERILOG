//GENERATOE CLASS WITH EVENT TRIGGER
class generator;
  mailbox g2d;
  event gen_done;

  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction

  task main();
    repeat (5) begin
      transaction trans = new();
      trans.randomize();
      if (!trans.randomize())
        $display("Randomization failed");
      trans.display("Generator class signal");
      g2d.put(trans);
      ->gen_done; // Trigger event
    end
  endtask
endclass
