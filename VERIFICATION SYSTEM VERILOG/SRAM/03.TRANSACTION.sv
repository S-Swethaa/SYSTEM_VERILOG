 class transaction;
  rand bit [7:0] din, addr;
  rand bit rw;
  bit rst;
  bit [7:0]dataout;
   
  constraint addr_range_cs { addr inside {[0:255]}; }   
  //constraint rst_cs{rst dist {0:=90,1:=10};}
   constraint rw_cs{rw dist {1:=50,0:=50};}
   
  function void display(string name);
    $display("[%0t] %s | rst=%0b rw=%0b addr=%0h din=%0h dataout=%0h",
      $time, name, rst, rw, addr, din, dataout);
  endfunction
endclass
