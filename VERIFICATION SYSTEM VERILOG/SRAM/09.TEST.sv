//TEST
//`include "environment.sv"
program test;
  virtual intf vif;
  environment env;

  initial begin
    vif=testbench.i;
    env=new(vif);
    env.run();
  end
endprogram
