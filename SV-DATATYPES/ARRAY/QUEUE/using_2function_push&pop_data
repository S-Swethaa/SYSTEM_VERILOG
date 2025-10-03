module queue_problems;
int a[$];


task insert_data;
begin
a.push_front(25);
a.push_back(20);
a.push_front(4);
a.push_back(15);
end
endtask

task delete_data;
begin
a.pop_back();
a.pop_front();
a.pop_back();
a.pop_front();
/*a.pop_back();
a.pop_front();
a.pop_back();
a.pop_front();
a.pop_back();
a.pop_front();*/
end
endtask

initial begin
  a = '{1,5,7,23,17,30};
  insert_data();
  $display("%p", a);
  delete_data();
  $display("%p", a);
end
endmodule

o/p:
'{4, 25, 1, 5, 7, 23, 17, 30, 20, 15}
# '{1, 5, 7, 23, 17, 30}
