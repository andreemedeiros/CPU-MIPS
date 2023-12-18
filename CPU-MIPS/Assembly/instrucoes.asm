; - 1
ADDi $1, $0, FF
ADDi $2, $0, 0
ADDi $2, $2, 1
BEQ $2, $1, 1
J 2
ADDi $3, $0, 4C
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $2, 1
J 7
ADDi $7, $7, 1
SW $7, FF($0)
J 0

; - 2
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

; - 3

ADDi $1, $0, A1
ADDi $3, $0, 2
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $7, $0, 1
SW $7, FF($0)
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 8
J 6
ADDi $7, $0, 4F
SW $7, FF($0)
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 12
J 10
ADDi $7, $0, 12
SW $7, FF($0)
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 1C
J 1A
ADDi $7, $0, 6
SW $7, FF($0)
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 26
J 24
ADDi $7, $0, 4C
SW $7, FF($0)
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 30
J 2E
ADDi $7, $0, 24
SW $7, FF($0)
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 3A
J 38
ADDi $7, $0, 20
SW $7, FF($0)
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 44
J 42
ADDi $7, $0, F
SW $7, FF($0)
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 4E
J 4C
ADDi $7, $0, 0
SW $7, FF($0)
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 58
J 56
ADDi $7, $0, 4
SW $7, FF($0)
ADDi $2, $0, 0
ADDi $4, $0, 0
ADDi $4, $4, 1
BEQ $4, $3, 4
ADDi $2, $2, 1
BEQ $2, $0, 1
J 62
J 60
J 2
