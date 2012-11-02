#include ee3420.inc

	org $1000
Num1 dc.b 0
Num2 dc.b 0
Int1 dc.b 0
Int2 dc.b 0
OutNum1 dc.b 0
OutNum2 dc.b 0
Opperand dc.b 0
Total dc.b 0
Prompt1	DC.B "Enter 1st Number", CR,LF, NULL
Prompt2	DC.B "Enter 2nd Number", CR,LF, NULL


DIGIT_PATTERN DC.B $3f,$06,$5b,$4f,$66,$6d,$7d,$07,$7f,$6f,$77,$7c,$39,$5e,$79,$71
;		     0,  1,  2,  3,  4,  5,  6,  7, 8,  9,  A,  b,  C,  d,  E,  F

;digit_delay equ 10

#ifndef digit_delay
digit_delay equ 1
#endif

debug equ 1

	org $2000
main:
	bset ddrj,bit1		;output
	bset portj,bit1		;turns off discrete leds

	bset ddrp,$0f		;output pins 
	bset portp,$0f		;turn off all 7-seg

	bset ddrb,$ff

loop0:	
	LCD_SETUP				;INITIALIZE THE LCD SCREEN
	LCD_CURSOR 0,0			;MOVE THE LCD CURSOR TO ROW 0 COLUMN 0
	PUTS_LCD #Prompt1
	GETC_KEYPAD Num1

loop1:	ldaa Num1	;msb
	cmpa #'*'
	bne check1
	ldaa #14
	bra out1
check1:	cmpa #'#'
	bne check2
	ldaa #15
	bra out1
check2:	suba #$30
	cmpa #9
	ble out1
	suba #7
out1:	
	STAA Int1
	tfr a,x			;0<= x <= 15
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit3		;enable leftmost digit
	staa portb		;output 7-segment pattern
	LDY 10
Display1:
	delay_by_ms #digit_delay
	DBNE Y, Display1
	bset portp,bit3
loop2:	GETC_KEYPAD Opperand
	ldaa Opperand		; one right of msb
	cmpa #'*'
	beq loop3
	cmpa #'A'
	beq loop3
	bra loop2
loop3:	
	LCD_SETUP				;INITIALIZE THE LCD SCREEN
	LCD_CURSOR 0,0			;MOVE THE LCD CURSOR TO ROW 0 COLUMN 0
	PUTS_LCD #Prompt2
	GETC_KEYPAD Num2
	ldaa Num2		; one right of msb
	cmpa #'*'
	bne check1b
	ldaa #14
	bra out3
check1b:cmpa #'#'
	bne check2b
	ldaa #15
	bra out3
check2b: suba #$30
	cmpa #9
	ble out3
	suba #7
out3:	
	STAA Int2
	tfr a,x			;0<= x <= 15
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit3		;enable leftmost digit
	staa portb		;output 7-segment pattern
	LDY 10
Display2:
	delay_by_ms #digit_delay
	DBNE Y, Display2
	bset portp,bit3

	ldaa Opperand		; one right of msb
	cmpa #'*'
	bne addition
multiply:
	CLRA
	CLRB
	LDAA Int1
	LDAB Int2
	MUL
	BRA out4
addition:
	CLRA
	CLRB
	LDAB Int2
	ADDB Int1

out4:	
	LSLD
	LSLD
	LSLD
	LSLD
	LSRB
	LSRB
	LSRB
	LSRB
	STAA OutNum1
	STAB OutNum2
	LDY 10
DISPLAY:
	CLRA
	LDAA OutNum1
	tfr a,x
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit2		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit2
	CLRA
	LDAA OutNum2
	tfr a,x
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit3		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit3
	DBNE Y, DISPLAY
	lbra loop0

	rts
