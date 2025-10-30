//SCOREBOARD:making the decision o/p from dut througn the monitor whether correct or not
class scoreboard;
mailbox m2s;
  
function new(mailbox m2s);
this.m2s=m2s;
endfunction
  
task main();
transaction trans;
int N;
bit exp_q; 
N = 10; 
repeat (N) begin
m2s.get(trans);
  
trans.display("scoreboard class signal");
  
exp_q = trans.rst ? 0 : trans.d;           // expected value
if (trans.q == exp_q)
$display("***PASS***Exp=%0b, dut_out=%0b", exp_q, trans.q);
else
$display("***FAIL***Exp=%0b, dut_out=%0b", exp_q, trans.q);
$display(".....transaction done.....");
$display("====================================");
end
endtask
endclass
