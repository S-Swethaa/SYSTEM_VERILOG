//typedef class - forward declaration - declare a class name before defining it

typedef class ip_cl;
class packet;
  int sum;
  ip_cl i;
  function void display();
    sum=i.a+i.b;
    $display("the sum is %0d",sum);
  endfunction
endclass

class ip_cl;
  bit [31:0]a,b;
endclass

module typedefex;
  initial begin
    packet p = new();
    p.i = new();
    p.i.a=20;
    p.i.b=30;
    p.display();
  end
endmodule
  OUTPUT:
  # Loading work.typedefex(fast)
# 
# run -all
# the sum is 50
# exit
# End time: 02:14:53 on Nov 05,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
