//without using unique to generate unique values
class c;
  rand bit [7:0] a;
  rand bit [7:0]b;
  rand bit [7:0]c;

  constraint cs { a!=b;
                b!=c;
                c!=a;}
  
  function void display();
    $display("a=%0d.b=%0d,c=%0d",a,b,c);
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
# a=34.b=244,c=50
# a=124.b=152,c=215
# a=158.b=47,c=215
# a=203.b=133,c=171
# a=35.b=157,c=85
# a=0.b=49,c=58
# a=62.b=254,c=175
# a=219.b=55,c=123
# a=194.b=31,c=36
# a=253.b=39,c=139
# exit
# End time: 13:22:59 on Jun 03,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 13:22:59 on Jun 03,2026, Elapsed time: 0:00:02
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
    vlog: Errors:   0, Warnings:   1
    vopt: Errors:   0, Warnings:   2
    vsim: Errors:   0, Warnings:   0
     

      
