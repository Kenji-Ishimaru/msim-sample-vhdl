#!/bin/sh

# RTL directory
RTL_DIR="../rtl"

# make work dir
if [ ! -e ./work ]; then
    vlib ./work
fi

sim_file=$1
echo "Test Scenario=" $sim_file
vhdl_files="${RTL_DIR}/mod_a.vhd ${RTL_DIR}/mod_b.vhd ${RTL_DIR}/mod_top.vhd"

# compile
vcom  ${vhdl_files}  ${sim_file}

# simulation
vsim -c -keepstdout test_module <<EOF
vcd file dumpvars.vcd
vcd add -r /test_module/*
run -all
quit
EOF
