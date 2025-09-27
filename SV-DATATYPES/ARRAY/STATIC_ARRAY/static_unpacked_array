module static_unpacked_array;
int arr[0:4];

initial begin
foreach(arr[i])begin
arr[i]=$urandom;
$display("the unpacked array[%0d]=%0d",i,arr[i]);
end
end
endmodule
output
static unpacked array[2][1] = -834229725
# static unpacked array[2][0] = -1608815054
# static unpacked array[1][1] = 1555380746
# static unpacked array[1][0] = -1957781731
# static unpacked array[0][1] = -1476164168
# static unpacked array[0][0] = 1771474650
