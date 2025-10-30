//MONITOR :Capture DUT output q and send to scoreboard
class monitor;
virtual intf vif;
mailbox m2s;
  
function new(virtual intf vif,mailbox m2s);
this.vif=vif;
this.m2s=m2s;
endfunction
  
task main();
  repeat(10)begin
transaction trans;
  @(posedge vif.clk);
#1;//DELAY FOR SETTLED OUTPUT
trans=new();
trans.d=vif.d;
trans.rst=vif.rst;
trans.q=vif.q;
m2s.put(trans);
$display("monitor class signals");
end
endtask
endclass
