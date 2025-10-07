
class stu_det;
typedef struct packed{
logic [7:0]roll_no;
logic  [3:0]grade;
logic [1:0]section;
}packedinfo;

typedef struct{
string name;
int age;
}unpackedinfo;

//class properties
packedinfo pinfo;
unpackedinfo upinfo;

//constructor new() - object allocation or memory creation
function new(string name,int age,byte roll_no,byte grade,byte section);
upinfo.name=name;
upinfo.age=age;
pinfo.roll_no=roll_no;
pinfo.grade=grade;
pinfo.section=section;
endfunction

//display the vlaues
function void display();
$display("name=%s",upinfo.name);
$display("age=%0d",upinfo.age);
$display("roll_no=%0d",pinfo.roll_no);
$display("grade=%0d",pinfo.grade);
$display("section=%0d",pinfo.section);
endfunction
endclass

module class_ex;
initial begin
stu_det s1=new("Swetha", 21, 65, 8, 2);
s1.display();
end
endmodule

O/P:
# Loading work.class_ex(fast)
run
# name=Swetha
# age=21
# roll_no=65
# grade=8
# section=2

