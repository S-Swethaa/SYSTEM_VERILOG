class facto_rial;
int a;
int res_fac;

//create constructor
function new(input int val);
a=val;
res_fac=factorial(val);
endfunction

//fact process 
function int factorial(int n);
int f,i;
f=1;
for(i=2;i<=n;i++)begin
f*=i;
$display("i=%0d,f=%0d",i,f);
end
return f;
endfunction

//displaying the res
function void display();
$display("a=%0d,res_fac=%0d",a,res_fac);
endfunction

endclass

module factorial;
facto_rial facts[];//dynamic array
initial begin
int count = 8; 
facts = new[count];  //dynamic array memory creation
for(int i=0;i<8;i++)begin
facts[i]=new(i);
end

foreach(facts[i])begin
facts[i].display();
end
end
endmodule

o/p:
#a=0,res_fac=1
# a=1,res_fac=1
# a=2,res_fac=2
# a=3,res_fac=6
# a=4,res_fac=24
# a=5,res_fac=120
# a=6,res_fac=720
# a=7,res_fac=5040


