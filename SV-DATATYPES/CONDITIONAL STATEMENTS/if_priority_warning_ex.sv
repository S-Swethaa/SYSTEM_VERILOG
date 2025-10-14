module if_priority_warning_ex;  
initial begin
int a,b;
 a=20;
 b=100;
 priority if(a>b)
 $display("a is greater than b");
 else if(a<10)
 $display("a is less than b");
end
endmodule

output
# ** Warning: (vsim-8315) No condition is true in the unique/priority if/case statement.
#    Time: 0 ns  Iteration: 0  Process: /if_priority_warning_ex/#ublk#144218168#2/#implicit#priority__6 File: C:/Users/praka/questa_prjt/if_priority_warning_ex.sv Line: 6
