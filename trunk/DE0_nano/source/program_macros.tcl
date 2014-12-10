
source assemble.tcl
source system_macros.tcl

# define any application-specific macros here.

# main script; assemble individual files for each MCU core here.
assemble  target_program.asm  target_program.v

source assemble.tcl ;# reset the global lists of aliases, labels, etc.
source system_macros.tcl
assemble  visor_program.asm  visor_program.v
