module else_stmt;
int a,b;

initial begin
a=20;
b=20;

if(a>b)
$display("a is greater than b",a,b);
else if(a<b)
$display("a is less than b",a,b);
else 
$display("a is equal to b",a,b);
end
endmodule
# a is equal to b         20         20
