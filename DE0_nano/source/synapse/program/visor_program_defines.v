`define MIN_NUM_REGS  2
`define MAX_NUM_REGS  48
`define WORD_WIDTH  16
`define WW  16
`define WORD_MSB  15
`define WMSB  15
`define DEST_LSB  10
`define DEST_WIDTH  6
`define SRC_MSB  9
`define SRC_WIDTH  10
`define IPR_WIDTH  16
`define IPR_TOP  15
`define DEST_NOP  50
`define DEBUG_IN_WIDTH  19
`define DEBUG_FORCE_EXEC_BIT  18
`define DEBUG_FORCE_LOAD_EXR_BIT  17
`define DEBUG_FORCE_HOLD_STATE_BIT  16
`define DEBUG_OUT_WIDTH  7
`define DEBUG_PRG_BREAK_OP_BIT  6
`define DEBUG_BRANCHING_CYCLE_BIT  5
`define DEBUG_CONST16_CYCLE1_BIT  4
`define DEBUG_FETCH_CYCLE1_BIT  3
`define DEBUG_FETCH_CYCLE2_BIT  2
`define DEBUG_LOAD_EXR_BIT  1
`define DEBUG_ENABLE_EXEC_BIT  0
`define CODE_ADDR_WIDTH  12
`define CODE_ADDR_TOP  11
`define CODE_SIZE_MAX_WORDS  4096
`define VISOR_CODE_ADDR_WIDTH  11
`define VISOR_CODE_ADDR_TOP  10
`define VISOR_CODE_SIZE_MAX_WORDS  2048
`define VISOR_NUM_REGS  32
`define VISOR_TOP_REG  31
`define VISOR_NUM_GP  8
`define VISOR_TOP_GP  7
`define SR_GA  6
`define DR_GA  6
`define SR_GB  7
`define DR_GB  7
`define SR_RSTK  8
`define DR_RSTK  8
`define SR_BP0_ADDR  9
`define DR_BP0_ADDR  9
`define SR_BP1_ADDR  10
`define DR_BP1_ADDR  10
`define SR_BP2_ADDR  11
`define DR_BP2_ADDR  11
`define SR_BP3_ADDR  12
`define DR_BP3_ADDR  12
`define BP_DISABLE  65535
`define SR_FORCE_OPCODE  13
`define DR_FORCE_OPCODE  13
`define SR_POKE_DATA  14
`define DR_POKE_DATA  14
`define SR_BUS_CTRL  15
`define DR_BUS_CTRL  15
`define BP_STEP_BIT  3
`define BP_STEP_MASK  8
`define DIVERT_CODE_BUS_BIT  2
`define DIVERT_CODE_BUS_MASK  4
`define TG_RESET_BIT  1
`define TG_RESET_MASK  2
`define TG_CODE_READY_BIT  0
`define TG_CODE_READY_MASK  1
`define SR_TG_FORCE  16
`define DR_TG_FORCE  16
`define FORCE_EXEC_BIT  2
`define FORCE_EXEC_MASK  4
`define FORCE_LOAD_EXR_BIT  1
`define FORCE_LOAD_EXR_MASK  2
`define HOLD_STATE_BIT  0
`define HOLD_STATE_MASK  1
`define SR_ATX_DATA  17
`define DR_ATX_DATA  17
`define SR_ATX_CTRL  18
`define DR_ATX_CTRL  18
`define SR_M9K_ADDR  19
`define DR_M9K_ADDR  19
`define SR_M9K_DATA  20
`define DR_M9K_DATA  20
`define SR_EXR_SHADOW  21
`define SR_TG_CODE_ADDR  22
`define SR_PEEK_DATA  23
`define SR_BP_STATUS  24
`define SR_BOOT_BREAK  25
`define ATX_LOAD_MASK  1
`define ATX_BUSY_MASK  2
`define ARX_BUSY_MASK  4