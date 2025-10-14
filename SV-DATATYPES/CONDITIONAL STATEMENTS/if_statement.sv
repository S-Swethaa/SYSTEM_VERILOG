module if_statement;
int a,b;

initial begin
a=20;
b=$urandom;

if(a>b)
$display("a is greater than b",a,b);
else if(a<b)
$display("a is less than b",a,b);
else 
$display("a is equal to b",a,b);
end
endmodule

output
# a is greater than b        a= 20 ,b=-834229725
