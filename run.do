vlog *.v

vlib work
vsim -voptargs="+acc" work.FINAL_sys_tb
do wave.do
run -all



 