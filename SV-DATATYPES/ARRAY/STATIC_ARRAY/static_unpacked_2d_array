module static_unpacked_2d_array;
  int arr[2:0][1:0]; // 3 rows (2 to 0), each with 2 columns (1 to 0)

  initial begin
    foreach(arr[i])begin
    foreach(arr[i][j]) begin
    arr[i][j] = $urandom;
     $display("static unpacked array[%0d][%0d] = %0d", i, j, arr[i][j]);
 end
 end
end
endmodule

output
oading work.static_unpacked_2d_array(fast)
run
# static unpacked array[2][1] = -834229725
# static unpacked array[2][0] = -1608815054
# static unpacked array[1][1] = 1555380746
# static unpacked array[1][0] = -1957781731
# static unpacked array[0][1] = -1476164168
# static unpacked array[0][0] = 1771474650
