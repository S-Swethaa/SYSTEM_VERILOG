//// extern keyword
class transaction;
  int d ;
  int sq ;
  
  extern function void display();
  extern task square();
endclass
      
    function void transaction::display();
      $display("d=%0d,sq=%0d",d,sq);
    endfunction
    
    task transaction::square();
      #12;
      $display("[%0t] d=%0d,sq=%0d",$time,d,sq);
    endtask
    
    module trans;
      initial begin
        transaction t =new();
        t.d=10;
        t.sq=(t.d*t.d);
        t.display();
      end
     endmodule
    OUTPUT:
    # Loading sv_std.std
# Loading work.design_sv_unit(fast)
# Loading work.trans(fast)
# 
# run -all
# d=10,sq=100
# exit
