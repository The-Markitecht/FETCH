`timescale 1 ns / 1 ns

`define IPR_WIDTH               16
`define IPR_TOP                 `IPR_WIDTH - 1

// size of register file.  all registers are external to the Synapse316 core.
// MIN_NUM_REGS <= NUM_REGS <= MAX_NUM_REGS.
`define MIN_NUM_REGS            2
`define MAX_NUM_REGS            48
`define NUM_REGS                32
`define TOP_REG                 `NUM_REGS - 1

`define DEBUG_IN_WIDTH          3
`define DEBUG_OUT_WIDTH         6
`define DEBUG_PEEK_REG          `TOP_REG
// `define DEBUG_POKE_REG       `TOP_REG - 1   
