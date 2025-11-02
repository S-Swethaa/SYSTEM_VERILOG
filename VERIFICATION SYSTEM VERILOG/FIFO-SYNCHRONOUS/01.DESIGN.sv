module sync_fifo #(parameter WIDTH=8, DEPTH=16)(
  input logic clk,
  input logic rst,           // Active-high reset
  input logic w_en,
  input logic r_en,
  input logic [WIDTH-1:0] din,
  output logic [WIDTH-1:0] dataout,
  output logic empty,
  output logic full
);

  localparam PTR_WIDTH = $clog2(DEPTH);
  logic [WIDTH-1:0] mem [0:DEPTH-1];
  logic [PTR_WIDTH:0] w_ptr, r_ptr;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      w_ptr <= 0;
      r_ptr <= 0;
      dataout <= 0;
    end else begin
      if (w_en && !full) begin
        mem[w_ptr[PTR_WIDTH-1:0]] <= din;
        w_ptr <= w_ptr + 1;
      end
      if (r_en && !empty) begin
        dataout <= mem[r_ptr[PTR_WIDTH-1:0]];
        r_ptr <= r_ptr + 1;
      end
    end
  end

  assign empty = (w_ptr == r_ptr);
  assign full = ((w_ptr[PTR_WIDTH] != r_ptr[PTR_WIDTH]) &&
                 (w_ptr[PTR_WIDTH-1:0] == r_ptr[PTR_WIDTH-1:0]));

endmodule
