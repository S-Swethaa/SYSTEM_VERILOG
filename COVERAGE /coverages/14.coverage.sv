// 3. Write covergroup for APB protocol: setup phase cycles (1, 2, 3+), access phase with/without wait states, response types, data ranges.
module m;
  logic clk,rst;
  logic [31:0]addr_range;
  logic slverr,decodeerror;
  logic wait_st,without_wait;
  
  typedef enum logic [1:0]{idle,pse,access}state;
  state s;
  covergroup cg @(posedge clk);
    coverpoint addr_range {bins addr = {[0:4294967295]};}
    coverpoint slverr {bins pass= {0};
                       bins fail = {1};}
    coverpoint decoderror {bins pass_decode= {0};
                           bins fail_decode= {1};}
    coverpoint s {bins acce ={access => wait_st};
                  bins acc= {access => without_wait};}
  endgroup
  
  cg c = new();
  end
endmodule
