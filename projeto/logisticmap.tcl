vsim -gui -t ns work.logisticmap_tb(testbench)
add wave sim:/logisticmap_tb/clk
add wave sim:/logisticmap_tb/clr
add wave sim:/logisticmap_tb/start
add wave sim:/logisticmap_tb/x0
add wave -clampanalog 0 -format analog-step -max 655360 -min -655360 -height 100 sim:/logisticmap_tb/xout
run 10 us
