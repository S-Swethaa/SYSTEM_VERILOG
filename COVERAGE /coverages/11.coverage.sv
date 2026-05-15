module m;
logic clk,rst;

typedef enum logic [1:0]{a,s,m,d} op;
op operation;

logic sign;
logic overflow;

initial clk=0;
always #5 clk=~clk;

// COVERGROUP
covergroup cg @(posedge clk);

coverpoint operation {
bins add={a};
bins sub={s};
bins mul={m};
bins div={d};
}

coverpoint sign {
bins positive={0};
bins negative={1};
}

coverpoint overflow {
bins no_overflow={0};
bins overflow_yes={1};
}

cross operation,sign,overflow;

endgroup

cg c=new();

// TESTBENCH
initial begin

rst=1;
operation=a;
sign=0;
overflow=0;

#10;
rst=0;

// ALL COMBINATIONS
for(int i=0;i<4;i++) begin

for(int j=0;j<2;j++) begin

for(int k=0;k<2;k++) begin

@(posedge clk);

operation=op'(i);
sign=j;
overflow=k;

$display("TIME=%0t OP=%0d SIGN=%0d OVERFLOW=%0d",
$time,operation,sign,overflow);

end
end
end

#20;

$display("Coverage=%0.2f %%",c.get_coverage());

$finish;

end

endmodule
# Loading sv_std.std
# Loading work.m(fast)
# 
# run -all
# TIME=15 OP=0 SIGN=0 OVERFLOW=0
# TIME=25 OP=0 SIGN=0 OVERFLOW=1
# TIME=35 OP=0 SIGN=1 OVERFLOW=0
# TIME=45 OP=0 SIGN=1 OVERFLOW=1
# TIME=55 OP=1 SIGN=0 OVERFLOW=0
# TIME=65 OP=1 SIGN=0 OVERFLOW=1
# TIME=75 OP=1 SIGN=1 OVERFLOW=0
# TIME=85 OP=1 SIGN=1 OVERFLOW=1
# TIME=95 OP=2 SIGN=0 OVERFLOW=0
# TIME=105 OP=2 SIGN=0 OVERFLOW=1
# TIME=115 OP=2 SIGN=1 OVERFLOW=0
# TIME=125 OP=2 SIGN=1 OVERFLOW=1
# TIME=135 OP=3 SIGN=0 OVERFLOW=0
# TIME=145 OP=3 SIGN=0 OVERFLOW=1
# TIME=155 OP=3 SIGN=1 OVERFLOW=0
# TIME=165 OP=3 SIGN=1 OVERFLOW=1
# Coverage=100.00 %
# ** Note: $finish    : design.sv(1062)
#    Time: 185 ns  Iteration: 0  Instance: /m
# End time: 14:27:09 on May 15,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 14:27:09 on May 15,2026, Elapsed time: 0:00:02
*** Summary *********************************************
