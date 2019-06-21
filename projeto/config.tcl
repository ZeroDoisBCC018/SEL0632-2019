vsim -gui -t ns work.mult_tb(testbench)
add wave sim:/mult_tb/*
run 1 us
quit -sim