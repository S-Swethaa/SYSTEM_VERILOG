//polymorphism-OVERRIDING CHILD CLASS 
class Bs;
  int data;
  int id;
  
  function void display();
    $display("base class:data=%0d,id=%0d",data,id);
  endfunction
endclass

class child1 extends Bs;
   function void display();
     $display("child1 class:data=%0d,id=%0d",data,id);
  endfunction
endclass

class child2 extends Bs;
   function void display();
     $display("child1 class:data=%0d,id=%0d",data,id);
  endfunction
endclass

class child3 extends Bs;
   function void display();
     $display("child1 class:data=%0d,id=%0d",data,id);
  endfunction
endclass
  
module polymorphism_ex;
  initial begin
    Bs bs1,bs2,bs3;
    child1 c1=new();
    child2 c2=new();
    child3 c3=new();
    
    bs1=c1;
    bs2=c2;
    bs3=c3;
    
    c1.data=200;c1.id=20;
    c2.data=300;c2.id=30;
    c3.data=500;c3.id=50;
    
    bs1.data=100;bs1.id=10;
    
    bs1.display();
    bs2.display();
    bs3.display();
  end
endmodule
    o/p:
Loading snapshot worklib.polymorphism_ex:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
base class:data=100,id=10
base class:data=300,id=30
base class:data=500,id=50
xmsim: *W,RNQUIE: S
