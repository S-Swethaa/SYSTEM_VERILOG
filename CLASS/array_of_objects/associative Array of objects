//in class using array to crate a object
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
end
return f;
endfunction

//displaying the res
function void display();
$display("a=%0d,res_fac=%0d",a,res_fac);
endfunction
endclass

module factorial_example;
typedef int key;
typedef facto_rial v;
v facts[key];//associative array

initial begin
int i;
int a[]; //dynamic array
a='{7,6,5,4,3,2,8,0};
foreach (a[i])begin 
facts[a[i]]=new(a[i]);  //memory creation to store the value
end
foreach (a[i])
facts[a[i]].display();  //display tha value 
end
endmodule

o/p:
 Loading work.cls_associative_array_sv_unit(fast)
# Loading work.factorial_example(fast)
run
# a=7,res_fac=5040
# a=6,res_fac=720
# a=5,res_fac=120
# a=4,res_fac=24
# a=3,res_fac=6
# a=2,res_fac=2
# a=8,res_fac=40320
# a=0,res_fac=1






