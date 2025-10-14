module iterator_index_querying;
int sta[8]='{7,1,9,3,6,5,5,7};
int q[];
int sta_x[];
initial begin
//this method Find  elements where element value equals the element's index
q=new[4];
q='{1,5,2,3};

sta_x=sta.find (x) with (x==x.index);
$display("elements are same with index:%p",sta_x);
q=q.find (x) with (x==x.index);
$display("elements are same with index:%p",q);
end
endmodule

output
# elements are same with index:'{1, 3, 5, 7}
# elements are same with index:'{2, 3}
