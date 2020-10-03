# msim-sample-vhdl
ModelSim vhdl simulation environment sample

## Directories
 - rtl/            - vhdl source code
 - scenario/       - test scenario
 - bin/            - bash script
 - work/           - simulation work directory

## How to Run
1. add ModelSim bin path to your bash $PATH
```
$export PATH=$PATH:/your-path/modelsim_ase/bin
```
2. run the bash script in the work directory

```
$cd work
$../bin/run_msin.sh ../scenario/test_1.vhd

Test Scenario= ../scenario/test_1.vhd
vcom ../rtl/mod_a.vhd ../rtl/mod_b.vhd ../rtl/mod_top.vhd ../scenario/test_1.vhd 
-- Loading package STANDARD
-- Loading package TEXTIO
-- Loading package std_logic_1164
-- Compiling entity mod_a
-- Compiling architecture rtl of mod_a
-- Compiling entity mod_b
-- Compiling architecture rtl of mod_b
-- Compiling entity mod_top
-- Compiling architecture rtl of mod_top
-- Loading package std_logic_arith
-- Loading package MATH_REAL
-- Compiling entity test_module
-- Compiling architecture testbench of test_module
Errors: 0, Warnings: 0
Reading pref.tcl

# 10.5b

# vsim -c -keepstdout test_module 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.math_real(body)
# Loading work.test_module(testbench)
# Loading work.mod_top(rtl)
# Loading work.mod_a(rtl)
# Loading work.mod_b(rtl)
VSIM 1> vcd file dumpvars.vcd
VSIM 2> vcd add -r /test_module/*
VSIM 3> run -all
# ** Note: ModelSim simulation sample
#    Time: 0 ps  Iteration: 0  Instance: /test_module
# ** Note: reset end
#    Time: 105 ns  Iteration: 1  Instance: /test_module
# ** Note: simulation finished.
#    Time: 305 ns  Iteration: 1  Instance: /test_module
VSIM 4> quit
# Errors: 0, Warnings: 0

```
