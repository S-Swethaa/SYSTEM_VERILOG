`include "assertion.sv"
module m #(parameter addr_width=4,
          parameter data_width=8,
          parameter depth=16)(
  input bit clk,rst,
  input [addr_width-1:0]addr_a,addr_b,
  input [data_width-1:0]data_a,data_b,
  input bit we_a,we_b,rd_a,rd_b,
  output reg [data_width-1:0]dout_a,dout_b);
  
  reg [data_width-1:0]mem[0:depth-1];
  
  always @(posedge clk or posedge rst)begin
    if(rst)begin
      dout_a<=0;
      end 
    else if(we_a)
        mem[addr_a]<=data_a;
    else if(rd_a)
      dout_a<=mem[addr_a];
  end
  
  always @(posedge clk or posedge rst)begin
    if(rst)begin
      dout_b<=0;
    end 
    else if(we_b)
        mem[addr_b]<=data_b;
    else if(rd_b)
      dout_b<=mem[addr_b];
  end
          endmodule


module assertion #(parameter depth = 4)(
  input clk,rst,we_a,we_b,rd_a,rd_b,
  input [3:0] addr_a,
  input [3:0] addr_b);
  
  property p ;
    @(posedge clk)
    disable iff (rst)
    !(we_a && we_b && (addr_a == addr_b));
  endproperty
  
  assert property (p)
    else $display("simulation failed because we_a and we_b pointing to same addr to write is illegal");
    
  property po;
    @(posedge clk)
    disable iff (rst)
    (addr_a < depth) && (addr_b < depth);
  endproperty
  assert property (po)
    else $display("Illegal: addr_a or addr_b out of range");

  property poo;
    @(posedge clk)
    disable iff (rst)
    !( (we_a && rd_a) ||
       (we_b && rd_b) ||
       (we_a && rd_b && (addr_a == addr_b)) ||
       (we_b && rd_a && (addr_b == addr_a)) );
  endproperty
  assert property (poo)
    else $display("Illegal: write+read same addr same cycle");
        
        endmodule
    
    bind m assertion assertion_inst(
  .clk(clk),
  .rst(rst),
  .we_a(we_a),
  .we_b(we_b),
  .rd_a(rd_a),
  .rd_b(rd_b),
  .addr_a(addr_a),
  .addr_b(addr_b)
);
      
    
    
      `timescale 1ns/1ps
module tb_m;

  parameter addr_width = 4;
  parameter data_width = 8;
  parameter depth      = 16;

  bit clk, rst;
  logic [addr_width-1:0] addr_a, addr_b;
  logic [data_width-1:0] data_a, data_b;
  bit we_a, we_b, rd_a, rd_b;
  logic [data_width-1:0] dout_a, dout_b;

  m #(.addr_width(addr_width),
      .data_width(data_width),
      .depth(depth)) dut (
    .clk(clk), .rst(rst),
    .addr_a(addr_a), .addr_b(addr_b),
    .data_a(data_a), .data_b(data_b),
    .we_a(we_a), .we_b(we_b),
    .rd_a(rd_a), .rd_b(rd_b),
    .dout_a(dout_a), .dout_b(dout_b)
  );
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    // Reset
    rst = 1;
    we_a = 0; we_b = 0; rd_a = 0; rd_b = 0;
    addr_a = 0; addr_b = 0;
    data_a = 0; data_b = 0;
    #10 rst = 0;

    // Write on Port A
    @(posedge clk);
    we_a = 1; addr_a = 4; data_a = 8'hAA;
    @(posedge clk);
    we_a = 0;

    // Read on Port A
    @(posedge clk);
    rd_a = 1;
    @(posedge clk);
    rd_a = 0;

    //  Write on Port B
    @(posedge clk);
    we_b = 1; addr_b = 7; data_b = 8'h55;
    @(posedge clk);
    we_b = 0;

    // Read on Port B
    @(posedge clk);
    rd_b = 1;
    @(posedge clk);
    rd_b = 0;

    //  Illegal case: both write same addr (assertion should fire)
    @(posedge clk);
    we_a = 1; addr_a = 3; data_a = 8'hF0;
    we_b = 1; addr_b = 3; data_b = 8'hF1;
    @(posedge clk);
    we_a = 0; we_b = 0;

    // Illegal case: write + read same addr same cycle
    @(posedge clk);
    we_a = 1; rd_a = 1; addr_a = 5; data_a = 8'h99;
    @(posedge clk);
    we_a = 0; rd_a = 0;

    // End simulation
    #50 $finish;
  end

endmodule
# 
# run -all
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# simulation failed because we_a and we_b pointing to same addr to write is illegal
# Illegal: addr_a or addr_b out of range
# Illegal: write+read same addr same cycle
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# Illegal: addr_a or addr_b out of range
# ** Note: $finish    : testbench.sv(78)
#    Time: 175 ns  Iteration: 0  Instance: /tb_m
# End time: 02:44:00 on Jun 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 02:44:00 on Jun 15,2026, Elapsed time: 0:00:02
*** Summary *********************************************



  
        
      
    
    
      
  
