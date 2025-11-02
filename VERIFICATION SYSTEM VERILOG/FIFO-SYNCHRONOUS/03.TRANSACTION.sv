class transaction;
  rand bit w_en;
  rand bit r_en;
  rand bit [7:0] din;
  bit empty;
  bit full;
  bit [7:0] dataout;

  constraint w_en_cs { w_en dist {1 := 50, 0 := 50}; }
  constraint r_en_cs { r_en dist {1 := 50, 0 := 50}; }

  function void display(string name);
    $display("   %s   ", name);
    $display("Time=%0t | w_en=%0b | r_en=%0b | din=%0h | dataout=%0h | empty=%0b | full=%0b",
             $time, w_en, r_en, din, dataout, empty, full);
    $display("***********************************");
  endfunction
endclass
