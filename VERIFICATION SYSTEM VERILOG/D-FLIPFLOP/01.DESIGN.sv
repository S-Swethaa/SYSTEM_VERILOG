// DUT: D Flip-Flop module (ANSI-style port declaration)
module d_ff(input logic d, clk, rst,output logic q);
always_ff @(posedge clk or posedge rst) begin
if (rst)
  q <= 0;
else
  q <= d;
end
endmodule
