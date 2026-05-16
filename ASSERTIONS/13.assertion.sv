// Write assertions for APB protocol: PSEL high for 1+ cycles before PENABLE, PENABLE high exactly 1 cycle, PREADY controls PRDATA validity.
module m;
  logic clk,rst,psel,prdata,pen,pready;
  
  initial  clk = 0;
    always #5 clk = ~clk;
    
  property p;
    @(posedge clk)
    disable iff (rst)
    psel |-> !pen ##1 psel;
  endproperty
  
  assert property(p)
    $display("assertion pass");
    else
      $display("assertion fail");
    
    property po;
      @(posedge clk)
      disable iff (rst)
      $rose (pen)|-> pen ##1 !pen;
    endproperty
    assert property (p)
      $display("assertion pass");
      else
        $display("assertion fail");
      
      property poo;
        @(posedge clk)
        disable iff (rst)
        pready |-> !$isunknown (prdata);
      endproperty
      assert property (poo)
        $display("assertion pass");
        else
          $display("assertion fail");
        
        initial begin
          rst=1;
          psel=0;
          pen=0;
          prdata=0;
          pready=0;
          #5;
          @(posedge clk);
          psel<=1;
          @(posedge clk);
          pen<=0;
                    @(posedge clk);
psel<=1;
                    @(posedge clk);
pen<=1;
                    @(posedge clk);

          pen<=1;
                    @(posedge clk);
pen<=1;
                    @(posedge clk);
pen<=0;
                    @(posedge clk);
pready<=1;
          prdata<=1;
                    @(posedge clk);
rst<=1;
          #50;
          $finish;
        end
        endmodule
