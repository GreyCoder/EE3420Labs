#INCLUDE EE3420.INC
    ORG $1000
REGH DC.B 0
INCHAR DC.B 0
OUTCHAR1 DC.B 0
OUTCHAR2 DC.B 'Z'
INT1 DC.B 0
INT2 DC.B 0
NEWLINE DC.B CR,LF,NULL
    ORG $2000
    LDAA    #$0
    STAA    DDRH    ;PTH as Input
LOOP1:
    CLRA
    CLRB
    LDB PTH
    CMPB REGH
    BEQ LOOP1
    STAB REGH
    CLRA
    LDA #0
LOOP2:
    LSRB
    BLO PRINTCOUNT
    INCA
    CMPA #8
    BEQ EXIT
    BRA LOOP2
PRINTCOUNT:
    STAA INT1
    ITOA INT1, #OUTCHAR1
    PUTC OUTCHAR1
    INCA
    CMPA #8
    BEQ EXIT
    BRA LOOP2
EXIT:
    PUTC OUTCHAR2
    PUTS #NEWLINE
    BRA  LOOP1
    RTS