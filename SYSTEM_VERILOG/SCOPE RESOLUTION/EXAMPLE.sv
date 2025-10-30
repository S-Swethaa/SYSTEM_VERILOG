// SCOPE RESOLUTION

class scope;
  static int data;
  int id;
  
  static function void display();
    $display("static function:data=%0d",data);
  endfunction
  
  function void auto_display();
    $display("without static function:data=%0d,id=%0d",data,id);
  endfunction
  
endclass

module scoperesolution;
  initial begin
    scope::data=10;
    scope::display;
    
    //scope::int=10 //getting error id is non static variable
    //scope::auto_display;//non static function
  end
endmodule
  OUTPUT:
# Loading sv_std.std
# Loading work.design_sv_unit(fast)
# Loading work.scoperesolution(fast)
# 
# run -all
# static function:data=10
# exit
