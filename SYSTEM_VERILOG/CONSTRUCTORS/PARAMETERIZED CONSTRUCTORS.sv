//  constructors
class transaction;
  int data;
 
  function new(int data);
    this.data=data;
  endfunction
  function void display();
    $display("the value of data=%0d",data);
  endfunction
  
endclass

module defaultcons;
  initial begin
    transaction trans=new(30);//passess argument to constructors
    trans.display();
  end
endmodule

OUTPUT:
# run -all
# the value of data=30
# exit
# End time: 00:12:02 on Nov 03,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
