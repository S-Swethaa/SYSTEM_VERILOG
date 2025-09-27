module associative_arr_using_dynamic;
int arr[][string];//dynamic arr[],associative=[string]

initial begin
arr=new[2];//create the dynamic array size 2
arr[0]='{"sankar":20,"kalai":10};
arr[1]='{"suba":50,"praksah":1};

foreach(arr[i])begin //iterate each index of dynamic array
foreach (arr[i][k]) begin //each current indx with elements
$display("arr[%0d][%s]=%0d",i,k,arr[i][k]);end//using k to avoid conflict instead of using arr
end
end
endmodule

run
# arr[0][kalai]=10
# arr[0][sankar]=20
# arr[1][praksah]=1
# arr[1][suba]=50
