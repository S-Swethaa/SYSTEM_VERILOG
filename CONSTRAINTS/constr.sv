//Write constraints for addresses aligned to 4-byte boundaries.
// last two bits 00 01 10 11 which is aligned to 4 byte boundaries:
class c;
  rand bit [31:0] a;
    constraint cs{a%4==0;}
  
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
# a=1200851016
# a=2659683252
# a=3835885332
# a=2511740808
# a=3177827964
# a=3777045164
# a=1660690372
# a=707784072
# a=1717932636
# a=1510217792
# exit
# End time: 13:12:54 on Jun 03,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 13:12:54 on Jun 03,2026, Elapsed time: 0:00:02
*** Summary *********************************************
