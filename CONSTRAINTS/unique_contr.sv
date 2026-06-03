class c;
  rand bit [7:0] a;
  rand bit [7:0]b;
  rand bit [7:0]c;

  constraint cs {unique {a,b,c};}
  
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
# a=87.b=140,c=114
# a=89.b=63,c=130
# a=157.b=195,c=225
# a=23.b=245,c=12
# a=110.b=217,c=215
# a=253.b=106,c=227
# a=147.b=212,c=215
# a=175.b=58,c=183
# a=236.b=120,c=51
# a=71.b=74,c=105
# exit
# End time: 13:20:48 on Jun 03,2026, Elapsed time: 0:00:02
# Errors: 0, Warnings: 0
End time: 13:20:48 on Jun 03,2026, Elapsed time: 0:00:03
*** Summary *********************************************
     

      
