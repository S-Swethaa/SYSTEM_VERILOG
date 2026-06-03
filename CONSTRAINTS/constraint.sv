//Write constraints for addresses aligned to 64-byte boundaries.

class c;
  rand bit [31:0] a;
  constraint csq {a inside {[1:1000]};}
  constraint cs{a%64==0;}
  
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
# a=192
# a=640
# a=512
# a=640
# a=704
# a=512
# a=448
# a=384
# a=448
# a=896
# exit
# End time: 13:17:32 on Jun 03,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 13:17:32 on Jun 03,2026, Elapsed time: 0:00:02
*** Summary *********************************************
