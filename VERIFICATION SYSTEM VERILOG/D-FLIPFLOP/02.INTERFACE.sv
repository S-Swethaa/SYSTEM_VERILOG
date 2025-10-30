interface intf();
logic clk, rst, d;
logic q; 
modport TB(input clk, d, rst); // REMOVE output q

clocking cb @(posedge clk);
input d, rst;
input q; 
endclocking
endinterface
