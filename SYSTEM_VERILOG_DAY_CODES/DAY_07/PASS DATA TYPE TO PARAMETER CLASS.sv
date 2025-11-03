 //PASS A DATA TYPE TO CLASS
class transaction #(parameter type t = int);
  t addr=56;
  t data=65;
  function void display();
    $display("the adrr =%0d,data=%0d",addr,data);
  endfunction
endclass

module parameterex;
  initial begin
    transaction trans = new();
    trans.display();
  end
endmodule

OUTPUT:
# 
# run -all
# the adrr =56,data=65
# exit
