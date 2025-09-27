module array_locator();
  int array[] = '{4,5,7,1,9,6,5,7}; //dynamic array
  int a[$];

  initial begin
    a = array.find with (item > 5);//find fifth element
    $display("find x  :%p", a);

    a = array.find_index with (item == 4);//find fourth element and their index
    $display("find x :a[%0d]=4", a[0]);

    a = array.find_first with (item < 7 && item > 6);//find first
    $display("find x :%p", a);

    a = array.find_last with (item > 5);//find last
    $display("find x :%p", a);

    a = array.find_first_index with (item > 5);//find first with index
    $display("find x :%p", a);

    a = array.find_last_index with (item > 5);//find last with index
    $display("find x :%p", a);

  


  end
endmodule


output:


find x  :'{7, 9, 6, 7}
# find x :a[0]=4
# find x :'{}
# find x :'{7}
# find x :'{2}
# find x :'{7}
