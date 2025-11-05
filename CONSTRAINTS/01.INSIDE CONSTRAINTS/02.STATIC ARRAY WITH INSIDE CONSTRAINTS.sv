// inside constraint with static arrays

class static_array_cs;
  rand bit [7:0]arr[4];
 local bit [7:0] arr_val[4] = '{10, 20, 30, 40};  
  
 constraint cs {
    foreach(arr[i]) (arr[i] inside {arr_val});
  }  
  function void display();
    $display("the values of arr=%p",arr);
  endfunction
endclass

module example;
  initial begin
    static_array_cs s;
    s = new();
    s.randomize();
    if(!s.randomize())
      $display("randomization failed");
    s.display();
  end
endmodule

OUTPUT:
# 
# run -all
# the values of arr='{10, 40, 10, 30}
# exit
# End time: 06:11:22 on Nov 05,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
    
  
