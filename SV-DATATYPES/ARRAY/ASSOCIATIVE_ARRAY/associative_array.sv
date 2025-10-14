module associative_array;
  int arr[string];

  initial begin
    string f;
    arr = '{"swetha":3, "varsha":20, "devika":25, "swathi":10};
    $display("arr.size() = %0d", arr.size());
    $display("arr.num() = %0d", arr.num());
    if (arr.exists("swathi"))
      $display("found it: %0d", arr["swathi"]);
    if (arr.first(f))
      $display("arr.first [%s] = %0d", f, arr[f]);
    if (arr.last(f))
      $display("arr.last [%s] = %0d", f, arr[f]);
    f = "varsha";
    if (arr.prev(f))
      $display("arr.prev [%s] = %0d", f, arr[f]);
    f = "devika";
    if (arr.next(f))
      $display("arr.next [%s] = %0d", f, arr[f]);
  end
endmodule
output
"
run
# arr.size() = 4
# arr.num() = 4
# found it: 10
# arr.first [devika] = 25
# arr.last [varsha] = 20
# arr.prev [swetha] = 3
# arr.next [swathi] = 10



