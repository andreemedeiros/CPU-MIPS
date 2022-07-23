
// Assembler:

LW $3, FF($0)
SW $3, FF($0)
ADDi $1, $0, 1
AND $2, $1, $3
J 0
