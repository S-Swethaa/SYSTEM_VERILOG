class scoreboard;
  mailbox m2s;
  event gn;
  transaction trans;
  bit [7:0] dout;
  bit [7:0] mem[0:15];
  int w_ptr = 0;
  int r_ptr = 0;
  localparam DEPTH = 16;

  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction

  task main();
    forever begin
      m2s.get(trans);
      trans.display("Scoreboard");

      if (trans.w_en && !trans.full)
        write(trans.din);
      if (trans.r_en && !trans.empty)
        read();

      if (trans.r_en && !trans.empty) begin
        $display("-------------------------------------------");
        if (dout == trans.dataout)
          $display("PASS");
        else
          $display("FAIL");
        $display("-------------------------------------------");

      end

      ->gn;
    end
  endtask

  task write(bit [7:0] data);
    mem[w_ptr] = data;
    $display("Writing %0h to mem[%0d]", data, w_ptr);
    w_ptr = (w_ptr + 1) % DEPTH;
  endtask

  task read();
    dout = mem[r_ptr];
    $display("Expecting %0h from mem[%0d]", dout, r_ptr);
    r_ptr = (r_ptr + 1) % DEPTH;
  endtask
endclass
