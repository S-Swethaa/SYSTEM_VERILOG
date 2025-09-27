module static_packed_arr_2d;
bit [2:0][1:0]arr;

initial begin
arr=$urandom;

foreach(arr[i])begin
foreach(arr[j])begin
$display("static 2d packed array [%0d][%0d]=%b%b",i,j,arr[i],arr[j]);
end
end
end
endmodule

output
static 2d packed array [2][2]=1010
# static 2d packed array [2][1]=1000
# static 2d packed array [2][0]=1011
# static 2d packed array [1][2]=0010
# static 2d packed array [1][1]=0000
# static 2d packed array [1][0]=0011
# static 2d packed array [0][2]=1110
# static 2d packed array [0][1]=1100
# static 2d packed array [0][0]=1111
