`include "interface.sv"
`include "environment.sv"
`include "test.sv"
module testbench;
  intf i();
  //test t(i);
  sram dut(.clk(i.clk), .rst(i.rst), .rw(i.rw), .addr(i.addr), .din(i.din), .dataout(i.dataout));

  initial begin
    i.clk=0;
  forever #5 i.clk=~i.clk;
  end

  initial begin
    i.rst=1;
    #2;
    i.rst=0;
  end
  
  //initial begin
  //  i.rw = 0;
// #5 i.rw = 1;
  //end


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end

  initial begin
    #100;
    $finish;
  end
endmodule




