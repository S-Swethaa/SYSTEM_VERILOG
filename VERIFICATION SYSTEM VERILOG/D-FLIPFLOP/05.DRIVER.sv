//DRIVER:get the values from generator(via mb), and transmit to dut using interface
//- clk should be driven by the testbench or interface, not inside the driver.
class driver;
virtual intf vif;
mailbox g2d;

function new(virtual intf vif,mailbox g2d);
this.vif=vif;
this.g2d=g2d;
endfunction
  
task main();
  repeat (10)begin
   transaction trans;
   g2d.get(trans);
    @(negedge vif.clk);// Wait for clock edge
     vif.d<=trans.d;
     vif.rst<=trans.rst;
     @(posedge vif.clk); 
      trans.display("driver class signal");
  end
endtask
endclass
