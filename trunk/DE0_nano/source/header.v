
// synthesis VERILOG_INPUT_VERSION SYSTEMVERILOG_2005 

`default_nettype none

`timescale 1 ns / 1 ns

`define IPR_WIDTH               16
`define IPR_TOP                 `IPR_WIDTH - 1

// size of register file.  all registers are external to the Synapse316 core.
// MIN_NUM_REGS <= NUM_REGS <= MAX_NUM_REGS.
`define MIN_NUM_REGS            2
`define MAX_NUM_REGS            48
//`define NUM_REGS                32
//`define TOP_REG                 `NUM_REGS - 1
// those have been moved to the assembly program for each core, and from there auto-generated into a _defines.v file.

`define DEBUG_IN_WIDTH          3
`define DEBUG_OUT_WIDTH         7
`define DEBUG_PEEK_REG          `TOP_REG
// `define DEBUG_POKE_REG       `TOP_REG - 1   

// clear some macros that are commonly used locally in some files.
`undef NUM_REGS
`undef TOP_REG
`undef NUM_GP
`undef TOP_GP
`undef IO 
