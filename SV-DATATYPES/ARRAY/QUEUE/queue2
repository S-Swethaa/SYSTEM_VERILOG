// Code your design here
module queue1;
  int s[$];
  int a;
  initial begin
    int s[0]=9;
    int s[1]=3;
    int s[2]=2;
    int s[3]=5;
    int s[4]=4;
    int s[5]=8;
    int s[6]=9;
    int s[7]=1;
    int s[8]=6;end
  initial begin
    a=s.size();
    $display("size%d",a);
    s.insert(3,5);
    $display(a);
    s.delete(5);
    $display(a);
    s.insert(s.size()/2,5);
    $display(a);
    s.insert(s.size(),6);
    $display(a);
    s.insert(s.size()-1,2);
    $display(a);
    a=s.pop_front();
    $display(a);
    a=s.pop_back();
        $display(a);
    s.push_front(4);
        $display(a);
    s.push_back(5);
        $display(a);
  end 
endmodule
    
