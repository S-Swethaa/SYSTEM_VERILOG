class transaction;
  int data;
  //default constructor
  function new();//WITHOUT PASSING 
    data=30;
  endfunction
  function void display();
    $display("the value of data=%0d",data);
  endfunction
  
endclass

module defaultcons;
  initial begin
    transaction trans=new();//CALLS THE DEFAULT CONSTRUCTORS
    trans.display();
  end
endmodule

OUTPUT:
# 
# run -all
# the value of data=30
# exit
