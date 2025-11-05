//constraint - inside constraint --helps to identity randomized variable values to be provided range 

`define s 23
`define t 33

class constrain #(int a=10,b=20);
  rand bit [7:0]a1;
  rand bit [7:0]a2;
  rand bit [7:0]a3;
  rand bit [7:0]a4;
  rand bit [7:0]a5;
  rand bit [7:0]a6;
  rand bit [7:0]a7;
  
  constraint cs1 {a1 inside {[10:20]};}//range cs
  constraint cs2 {a2 inside {20,30,40,50};}//set of values cs
  constraint cs3 {a3 inside {20,[30:40],25,67,[78:90],100};}//set of values and range cs
  constraint cs4 {a4 inside { [`s:`t] }; }
  constraint cs5 {a5 inside { [a1:a2]};}//variable based range constraint
  constraint cs6 {a6 inside {[a:b]};}//parameter based range constraint
  constraint cs7 {!(a7 inside {[10:100]});}//inverted inside constraint
                    
                    function void display();
                      $display("a1=%0d,a2=%0d,a3=%0d,a4=%0d,a5=%0d,a6=%0d,a7=%0d",a1,a2,a3,a4,a5,a6,a7);
                    endfunction
                    endclass
                    
                    module constraint_ex;
                      constrain #(100,200)c;
                      initial begin
                        c = new();
                        c.randomize();
                        c.display();
                      end
                    endmodule
 OUTPUT:
# Loading sv_std.std
# Loading work.design_sv_unit(fast)
# Loading work.constraint_ex(fast)
# 
# run -all
# a1=17,a2=50,a3=90,a4=27,a5=25,a6=171,a7=227
# exit
# End time: 05:14:50 on Nov 05,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
