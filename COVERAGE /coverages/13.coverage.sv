    //// 2. Write covergroup for FIFO state machine: states (EMPTY, PARTIALLY_FULL, FULL), transitions, push/pop at boundaries.

         module m;
           logic clk,rst,push,pop;
           typedef enum logic [1:0]{empty,full,partialfull};state;
           state s;
           
           initial clk = 0;
           always #5 clk = ~clk;
           
           covergroup cd @(posedge clk);
             coverpoint s {bins emp = {empty};
                           bins fu = {full};
                           bins partfu={partialfull};
                           bins emtopartfull ={empty => partialfull};
                           bins partialfulltofull ={partialfull => full};
                           bins fulltoempty = {full =>empty };
                           bins emptofull = {empty => full};}
             coverpoint push {bins active = {1};
                              bins low = {0};}
             coverpoint pop {bins popactive ={1};
                             bins poplow = {0};}
             cross s, push {bins push_when_full =binsof(s.full) && binsof(push.active);}
             cross s, pop {bins pop_when_empty =binsof(s.empty) &&binsof(pop.popactive)}
             cg c = new();
             end
             endmodule
             
