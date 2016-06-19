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
`define NUM_REGS  48
`define TOP_REG  47
`define NUM_GP  12
`define TOP_GP  11
`define SR_G6  6
`define DR_G6  6
`define SR_G7  7
`define DR_G7  7
`define SR_GA  6
`define DR_GA  6
`define SR_GB  7
`define DR_GB  7
`define SR_PA  8
`define DR_PA  8
`define SR_PB  9
`define DR_PB  9
`define SR_PC  10
`define DR_PC  10
`define SR_PD  11
`define DR_PD  11
`define SR_RSTK  12
`define DR_RSTK  12
`define SR_EVENT_PRIORITY  13
`define DR_EVENT_PRIORITY  13
`define SR_SOFT_EVENT  14
`define DR_SOFT_EVENT  14
`define EVENT_CONTROLLER_RESET_BIT  15
`define EVENT_CONTROLLER_RESET_MASK  32768
`define SR_USAGE_COUNT  15
`define DR_USAGE_COUNT  15
`define SR_PRODUCT_LO  16
`define SR_PRODUCT_HI  17
`define SR_USTIMER0  18
`define DR_USTIMER0  18
`define SR_MSTIMER0  19
`define DR_MSTIMER0  19
`define SR_MSTIMER1  20
`define DR_MSTIMER1  20
`define SR_MSTIMER2  21
`define DR_MSTIMER2  21
`define SR_SPI_DATA  22
`define DR_SPI_DATA  22
`define SR_AV_WRITE_DATA  23
`define DR_AV_WRITE_DATA  23
`define SR_AV_READ_DATA  24
`define SR_AV_AD_HI  25
`define DR_AV_AD_HI  25
`define SR_AV_AD_LO  26
`define DR_AV_AD_LO  26
`define SDRAM_BASE  0
`define SDRAM_BASE_HI  0
`define SDRAM_BASE_LO  0
`define SDRAM_SIZE  33554432
`define SDRAM_SIZE_HI  512
`define SDRAM_SIZE_LO  0
`define DR_DROM_AD  27
`define SR_DROM_DATA  28
`define SR_FDUART_DATA  29
`define DR_FDUART_DATA  29
`define SR_FDUART_STATUS  30
`define DR_FDUART_STATUS  30
`define SR_LEDS  31
`define DR_LEDS  31
`define SR_BOARD_CTRL  32
`define DR_BOARD_CTRL  32
`define DIPSWITCH0_BIT  0
`define DIPSWITCH1_BIT  1
`define DIPSWITCH2_BIT  2
`define DIPSWITCH3_BIT  3
`define KEY0_BIT  4
`define KEY1_BIT  5
`define BEEPER_ENABLE_BIT  6
`define FTDI_POWER_BIT  7
`define SR_ANMUX_CTRL  33
`define DR_ANMUX_CTRL  33
`define ANMUX_ENABLE_MASK  8
`define ANMUX_CHANNEL_MASK  7
`define SR_POWER_DUTY  34
`define DR_POWER_DUTY  34
`define SR_IGN_CAPTURE_JF  35
`define SR_IGN_TIMEOUT_LEN_JF  36
`define DR_IGN_TIMEOUT_LEN_JF  36
`define SR_PUFF_LEN_US  37
`define DR_PUFF_LEN_US  37
`define ATX_FIFO_EMPTY_BIT  0
`define ATX_FIFO_FULL_BIT  1
`define ATX_BUSY_BIT  2
`define ARX_FIFO_EMPTY_BIT  3
`define ARX_FIFO_FULL_BIT  4
`define ARX_BUSY_BIT  5
`define ATX_FIFO_EMPTY_MASK  1
`define ATX_FIFO_FULL_MASK  2
`define ATX_BUSY_MASK  4
`define ARX_FIFO_EMPTY_MASK  8
`define ARX_FIFO_FULL_MASK  16
`define ARX_BUSY_MASK  32
