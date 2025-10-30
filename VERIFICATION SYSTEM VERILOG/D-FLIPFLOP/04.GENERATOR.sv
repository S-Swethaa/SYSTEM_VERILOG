//GENERATOR :do randomization process to store and send values via mailbox to driver
//- transaction class should not contain clk.
class generator ;
transaction trans;
mailbox g2d;

function new(mailbox g2d);
this.g2d=g2d;
endfunction

task main();
  repeat (10)begin
trans=new();
trans.randomize();
if(!trans.randomize())
$display("randomization failed");
/*void'(trans.randomize());
// Limit reset pulses only allow rst for first 3 cycles
if ($time > 20) trans.rst = 0;*/
trans.display("generator class signals");
g2d.put(trans);
end
endtask
endclass
