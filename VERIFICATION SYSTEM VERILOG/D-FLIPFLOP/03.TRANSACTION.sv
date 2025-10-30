//TRANSACTION :IP SIGNAL + CONSTRAINTS(define randomized signal);
class transaction;
rand bit d;
rand bit rst;
bit q;

function void display(string name);
$display("---- %s ----", name);
$display("$time=%0t,d=%0b,rst=%0b,q=%0b",$time,d,rst,q);
$display(".........*..........");
endfunction
endclass
