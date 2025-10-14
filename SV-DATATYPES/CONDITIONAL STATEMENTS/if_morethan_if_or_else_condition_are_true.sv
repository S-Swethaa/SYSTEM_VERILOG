module if_morethan_if_or_else_condition_are_true;  
initial begin
int a,b;
 a=10;
 b=20;
 unique if(a>b)
 $display("a is greater than b");
 else if(a<b)
  $display("a is less than b");
 else if(a<50)
 $display("a is less than 50");
 else 
 $display("a is equal to b");
  end
endmodule

output:
# a is less than b
# ** Warning: (vsim-8360) The if/case statement is not unique.
#    Time: 0 ns  Iteration: 0  Process: /if_morethan_if_or_else_condition_are_true/#ublk#87687845#2/#implicit#unique__6 File: C:/Users/praka/questa_prjt/if_morethan_if_or_else_condition_true.sv Line: 6

