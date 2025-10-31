class generator;
  mailbox g2d;
  event gn; 
  

  function new(mailbox g2d);
    this.g2d=g2d;
  endfunction

  task main();
    transaction trans;
    repeat (20) begin
      trans=new();
      trans.randomize();
      g2d.put(trans);
      trans.display("GENERATOR OUTPUT");
     @gn;
    end
  endtask
endclass
