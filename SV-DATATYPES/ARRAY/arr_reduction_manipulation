module arr_reduction_manipulation();
int sta[8]='{30,20,25,7,10,19,2,29};//static_array
int q[];//dynamic_array;

    int sta_and, sta_or, sta_xor, sta_sum, sta_product;
    int q_and, q_or, q_xor, q_sum, q_product;
initial begin
q=new[4];
q='{5,8,2,9};

sta_and=sta.and();
q_and=q.and();
$display("and reduction elements os sta: %0d",sta_and);
$display("and reduction elements os q : %0d",q_and);

sta_or=sta.or();
q_or=q.or();
$display("or reduction elements os sta: %0d",sta_or);
$display("or reduction elements os q : %0d",q_or);

sta_xor=sta.xor();
q_xor=q.xor();
$display("xor reduction elements os sta: %0d",sta_xor);
$display("xor reduction elements os q : %0d",q_xor);

sta_sum=sta.sum();
q_sum=q.sum();
$display("sum reduction elements os sta: %0d",sta_sum);
$display("sum reduction elements os q : %0d",q_sum);

sta_product=sta.product();
q_product=q.product();
$display("product reduction elements os sta: %0d",sta_product);
$display("product reduction elements os q : %0d",q_product);
end
endmodule
OUTPUT:
/*and reduction elements os sta: 0
# and reduction elements os q : 0
# or reduction elements os sta: 31
# or reduction elements os q : 15
# xor reduction elements os sta: 18
# xor reduction elements os q : 6
# sum reduction elements os sta: 142
# sum reduction elements os q : 24
# product reduction elements os sta: 1157100000
# product reduction elements os q : 720*/
