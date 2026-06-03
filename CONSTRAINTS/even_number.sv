class c;
  rand int a;
  
  constraint csa {a inside {[1:100]};}
  constraint cs{a%2==0;}
  
  function void display();
    $display("a=%0d",a);
  endfunction
endclass
 module m;
   c cc;
   initial begin
     repeat(10)begin
     cc=new();
       cc.randomize();
       cc.display();
     end
   end
 endmodule
# run -all
# a=88
# a=70
# a=66
# a=74
# a=56
# a=16
# a=14
# a=52
# a=92
# a=58
# exit
# End time: 13:09:20 on Jun 03,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 13:09:20 on Jun 03,2026, Elapsed time: 0:00:03
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
class c;
  rand int a;
  
  constraint csa {a inside {[1:100]};}
  constraint cs{a%5==0;}
  
  function void display();
    $display("a=%0d",a);
  endfunction
endclass
 module m;
   c cc;
   initial begin
     repeat(10)begin
     cc=new();
       cc.randomize();
       cc.display();
     end
   end
 endmodule
# run -all
# a=15
# a=95
# a=40
# a=50
# a=95
# a=40
# a=35
# a=45
# a=35
# a=20
# exit
# End time: 13:07:39 on Jun 03,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 13:07:39 on Jun 03,2026, Elapsed time: 0:00:02
*** Summary *********************************************
