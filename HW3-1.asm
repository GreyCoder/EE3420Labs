#INCLUDE EE3420.INC
    ORG $1000
INCHAR DC.B 0
OUTCHAR1 DC.B 0
OUTCHAR2 DC.B 0
INT1 DC.B 0
INT2 DC.B 0
NEWLINE DC.B CR,LF,NULL
    ORG $2000
LOOP1:
    CLRA
    CLRB
    GETC_SCI0
    STAB INCHAR
    LSLD
    LSLD
    LSLD
    LSLD
    LSRB            
    LSRB
    LSRB
    LSRB
    STAA INT1
    STAB INT2
    ITOA_16 INT1, #OUTCHAR1
    ITOA_16 INT2, #OUTCHAR2
    PUTS_SCI1 #NEWLINE
    PUTC_SCI1 OUTCHAR1
    PUTC_SCI1 OUTCHAR2
    PUTS_SCI1 #NEWLINE
    BRA LOOP1

    RTS