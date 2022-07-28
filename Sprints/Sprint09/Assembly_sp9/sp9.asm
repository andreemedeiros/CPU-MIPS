# - 1
ADDi $1, $0, A4
ADDi $2, $0, 0
ADDi $2, $2, 1
BEQ $2, $1, 1
J 5
ADDi $7, $7, 1
SW $7, FF($0)
J 0

# - 2
LW $3, FF($0)
SW $3, 0($0)
BEQ $3, $0, 8
ADDi $1, $0, A1
ADDi $2, $0, 0
ADDi $2, $2, 1
BEQ $2, $1, 1
J 5
ADDi $7, $7, 1
SW $7, FF($0)
J 0
ADDi $7, $0, 0
SW $7, FF($0)
J 0
