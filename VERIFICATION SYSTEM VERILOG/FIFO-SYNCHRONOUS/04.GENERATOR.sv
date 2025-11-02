class generator;
  transaction trans;
  mailbox g2d;
  event gn;

  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction

  task main();
    forever begin
      trans = new();
      if (!trans.randomize())
        $display("RANDOMIZATION FAILED");
      g2d.put(trans);
      trans.display("Generator");
      @gn;
    end
  endtask
endclass
