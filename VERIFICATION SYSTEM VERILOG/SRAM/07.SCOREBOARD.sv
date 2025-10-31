class scoreboard;
  mailbox m2s;
  event gn;
  bit [7:0] mem_t[0:255];
  transaction trans;
  bit [7:0] out;
  //integer i;

  function new(mailbox m2s);
    this.m2s = m2s;
    foreach(mem_t[i])  mem_t[i] = 8'h00;     
  endfunction

  task main();
    repeat(20) begin
      m2s.get(trans);
      if(trans.rst)
        foreach(mem_t[i]) mem_t[i] = 8'h00;
      else if(trans.rw)
        mem_t[trans.addr]=trans.din;
      else
        out=mem_t[trans.addr];
      $display("[%0t]SCOREBOARD | Expected: %h Observed: %h",$time, out, trans.dataout);
      if(out===trans.dataout)
        $display("PASS\n");
      else
        $display("FAIL\n");
      ->gn;
    end
  endtask
endclass
SCOREBO
