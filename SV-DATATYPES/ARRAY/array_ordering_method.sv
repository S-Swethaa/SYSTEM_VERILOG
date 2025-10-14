module array_ordering_method;
int sta[8]='{9,7,25,4,16,30,22,5};//static_array
int q[];//dynamic array

initial begin
q=new[7];
q='{3,5,7,9,2,4,6};

sta.sort();
q.sort();
$display("sta sorting elments :%p",sta);
$display("q sorting elements:%p",q);

sta.rsort();
q.rsort();
$display("sta reverse sorting elments :%p",sta);
$display("q reverse sorting elements:%p",q);

sta.shuffle();
q.shuffle();
$display("sta shuffle elments :%p",sta);
$display("q shuffle elements:%p",q);

sta.reverse();
q.reverse();
$display("sta reverse elments :%p",sta);
$display("q reverse elements:%p",q);
end
endmodule

output
sta sorting elments :'{4, 5, 7, 9, 16, 22, 25, 30}
# q sorting elements:'{2, 3, 4, 5, 6, 7, 9}
# sta reverse sorting elments :'{30, 25, 22, 16, 9, 7, 5, 4}
# q reverse sorting elements:'{9, 7, 6, 5, 4, 3, 2}
# sta shuffle elments :'{25, 7, 9, 16, 22, 4, 5, 30}
# q shuffle elements:'{2, 6, 9, 3, 5, 4, 7}
# sta reverse elments :'{30, 5, 4, 22, 16, 9, 7, 25}
# q reverse elements:'{7, 4, 5, 3, 9, 6, 2}




