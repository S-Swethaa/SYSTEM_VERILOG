# Loading sv_std.std
# Loading work.design_sv_unit(fast)
# Loading work.test(fast)
# Loading work.testbench(fast)
# Loading work.intf(fast__2)
# Loading work.sram(fast)
# Loading work.intf(fast)
# 
# run -all
# [0] GENERATOR OUTPUT | rst=0 rw=1 addr=f5 din=bb dataout=0
# [5] MONITOR CLASS SIGNALS | rst=0 rw=0 addr=0 din=0 dataout=0
# [5]SCOREBOARD | Expected: 00 Observed: 00
# PASS
# 
# [5] GENERATOR OUTPUT | rst=0 rw=0 addr=53 din=e1 dataout=0
# [15] MONITOR CLASS SIGNALS | rst=0 rw=1 addr=f5 din=bb dataout=0
# [15] DRIVER CLASS SIGNALS | rst=0 rw=1 addr=f5 din=bb dataout=0
# [15]SCOREBOARD | Expected: 00 Observed: 00
# PASS
# 
# [15] GENERATOR OUTPUT | rst=0 rw=0 addr=20 din=81 dataout=0
# [25] MONITOR CLASS SIGNALS | rst=0 rw=0 addr=f5 din=bb dataout=bb
# [25]SCOREBOARD | Expected: bb Observed: bb
# PASS
# 
# [25] GENERATOR OUTPUT | rst=0 rw=1 addr=e2 din=62 dataout=0
# [35] MONITOR CLASS SIGNALS | rst=0 rw=1 addr=53 din=e1 dataout=bb
# [35] DRIVER CLASS SIGNALS | rst=0 rw=0 addr=53 din=e1 dataout=0
# [35]SCOREBOARD | Expected: bb Observed: bb
# PASS
# 
# [35] GENERATOR OUTPUT | rst=0 rw=1 addr=aa din=1d dataout=0
# [45] MONITOR CLASS SIGNALS | rst=0 rw=0 addr=53 din=e1 dataout=e1
# [45]SCOREBOARD | Expected: e1 Observed: e1
# PASS
# 
# [45] GENERATOR OUTPUT | rst=0 rw=0 addr=e6 din=f7 dataout=0
# [55] MONITOR CLASS SIGNALS | rst=0 rw=1 addr=20 din=81 dataout=e1
# [55] DRIVER CLASS SIGNALS | rst=0 rw=0 addr=20 din=81 dataout=0
# [55]SCOREBOARD | Expected: e1 Observed: e1
# PASS
# 
# [55] GENERATOR OUTPUT | rst=0 rw=0 addr=97 din=70 dataout=0
# [65] MONITOR CLASS SIGNALS | rst=0 rw=0 addr=20 din=81 dataout=81
# [65]SCOREBOARD | Expected: 81 Observed: 81
# PASS
# 
# [65] GENERATOR OUTPUT | rst=0 rw=0 addr=2d din=43 dataout=0
# [75] MONITOR CLASS SIGNALS | rst=0 rw=1 addr=e2 din=62 dataout=81
# [75] DRIVER CLASS SIGNALS | rst=0 rw=1 addr=e2 din=62 dataout=0
# [75]SCOREBOARD | Expected: 81 Observed: 81
# PASS
# 
# [75] GENERATOR OUTPUT | rst=0 rw=0 addr=a1 din=78 dataout=0
# [85] MONITOR CLASS SIGNALS | rst=0 rw=0 addr=e2 din=62 dataout=62
# [85]SCOREBOARD | Expected: 62 Observed: 62
# PASS
# 
# [85] GENERATOR OUTPUT | rst=0 rw=0 addr=e0 din=a1 dataout=0
# [95] MONITOR CLASS SIGNALS | rst=0 rw=1 addr=aa din=1d dataout=62
# [95] DRIVER CLASS SIGNALS | rst=0 rw=1 addr=aa din=1d dataout=0
# [95]SCOREBOARD | Expected: 62 Observed: 62
# PASS
# 
# [95] GENERATOR OUTPUT | rst=0 rw=0 addr=93 din=84 dataout=0
# ** Note: $finish    : testbench.sv(33)
#    Time: 100 ns  Iteration: 0  Instance: /testbench
# End time: 08:55:13 on Oct 31,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
End time: 08:55:13 on Oct 31,2025, Elapsed time: 0:00:02
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
    vlog: Errors:   0, Warnings:   1
    vopt: Errors:   0, Warnings:   2
    vsim: Errors:   0, Warnings:   0
  Totals: Errors:   0, Warnings:   3
Finding VCD file...
