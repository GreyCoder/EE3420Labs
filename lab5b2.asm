;Lab5 Part 2 Israel Cabello and Eduardo Chavez
#include ee3420.inc

	org $1000
Num1a dc.b 0
Num1b dc.b 0
Num2a dc.b 0
Num2b dc.b 0
Int1 dc.b 0
Int2 dc.b 0
Int1a dc.b 0
Int1b dc.b 0
Int2a dc.b 0
Int2b dc.b 0
OutNum1 dc.b 0
OutNum2 dc.b 0
OutNum3 dc.b 0
OutNum4 dc.b 0
ADD1 dc.w 0
Opperand dc.b 0
Total dc.w 0
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
;This is the main loop
loop0:
	
	LCD_SETUP				;INITIALIZE THE LCD SCREEN
	LCD_CURSOR 0,0			;MOVE THE LCD CURSOR TO ROW 0 COLUMN 0
	PUTS_LCD #Prompt1
	GETC_KEYPAD Num1a;First part of byte int
	GETC_KEYPAD Num1b;Second part of byte int
;First Set of Loops to get the Most Significant 4bits of Num1
loop1Num1a:
	ldaa Num1a
	cmpa #'*'
	bne loop2Num1a
	ldaa #14
	bra StoreNum1a
loop2Num1a:
	cmpa #'#'
	bne loop3Num1a
	ldaa #15
	bra StoreNum1a
loop3Num1a:
	suba #$30
	cmpa #9
	ble StoreNum1a
	suba #7
StoreNum1a:
	STAA Int1a
;Second Set of Loops to get the Least Significant 4bits of Num1
loop1Num1b:
	ldaa Num1b
	cmpa #'*'
	bne loop2Num1b
	ldaa #14
	bra StoreNum1b
loop2Num1b:
	cmpa #'#'
	bne loop3Num1b
	ldaa #15
	bra StoreNum1b
loop3Num1b:
	suba #$30
	cmpa #9
	ble StoreNum1b
	suba #7
StoreNum1b:	
	STAA Int1b
;Load Y to set delay for the Seven Segment display
	LDY #500
;Display Num1 on seven segment leds
DisplayNum1ab:
	LDAA Int1a
	tfr a,x
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit2		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit2
	LDAA Int1b
	tfr a,x			;0<= x <= 15
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit3		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit3
	DBNE Y, DisplayNum1ab
;Get next input from the keypad this is the opperand
loop2:
	GETC_KEYPAD Opperand
	ldaa Opperand		; one right of msb
	cmpa #'*'
	beq loop3
	cmpa #'A'
	beq loop3
	bra loop2
;Repeat the process to get the next byte sized integer
loop3:
	LCD_SETUP				;INITIALIZE THE LCD SCREEN
	LCD_CURSOR 0,0			;MOVE THE LCD CURSOR TO ROW 0 COLUMN 0
	PUTS_LCD #Prompt2

	GETC_KEYPAD Num2a
	GETC_KEYPAD Num2b
;Loops to process Most Significant 4 bits of Num2
loop1Num2a:
	ldaa Num2a	;msb
	cmpa #'*'
	bne loop2Num2a
	ldaa #14
	bra StoreNum2a
loop2Num2a:
	cmpa #'#'
	bne loop3Num2a
	ldaa #15
	bra StoreNum2a
loop3Num2a:
	suba #$30
	cmpa #9
	ble StoreNum2a
	suba #7
StoreNum2a:
	STAA Int2a

;Loops to process Least Significant 4 bits of Num2
loop1Num2b:
	ldaa Num2b	;lsb
	cmpa #'*'
	bne loop2Num2b
	ldaa #14
	bra StoreNum2b
loop2Num2b:
	cmpa #'#'
	bne loop3Num2b
	ldaa #15
	bra StoreNum2b
loop3Num2b:
	suba #$30
	cmpa #9
	ble StoreNum2b
	suba #7
StoreNum2b:
	STAA Int2b
    
;Load Loop for Delay to display Num2 on 7 Segment
	LDY #500
;Display Num2 on Seven segments
DisplayNum2ab:
	LDAA Int2a
	tfr a,x			;0<= x <= 15
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit2		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit2
	LDAA Int2b
	tfr a,x			;0<= x <= 15
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit3		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit3
	DBNE Y, DisplayNum2ab
;Start the math part by checking opperand
Do_Math:
	ldaa Opperand		; one right of msb
	cmpa #'*'
	bne addition
;Multiply Process:
;Load A and B registers with Num1 and Num2
;The process involves loading A with the first half of num1
;then left shifting 4 times and then adding the second half of num1
;the process is repeated for register B and Num2
multiply:
	CLRA
	CLRB
    
	LDAA Int1a
	LSLA
	LSLA
	LSLA
	LSLA
	ADDA Int1b
    
	LDAB Int2a
	LSLB
	LSLB
	LSLB
	LSLB
	ADDB Int2b
	MUL
	BRA processTotal
;Addition Process:
;The process involves loading B with the first half of num1
;then left shifting 4 times and then adding the second half of num1
;store B in the variable ADD1
;clear B
;load B with the first half of num2
;then left shifting 4 times and then add the second half of num2
;Next Add the variable ADD1 to Register D
addition:
	CLRA
	CLRB
	LDAB Int2a
	LSLB
	LSLB
	LSLB
	LSLB
	ADDB Int2b
	STD ADD1
	CLRB
	LDAB Int1a
	LSLB
	LSLB
	LSLB
	LSLB
	ADDB Int1b
	ADDD ADD1
;With Total in D we now process it and store each part of the total in OutNum1 - OutNum4
;First we load Total into D register
;next we AND A with #$0F and AND B with #S0F now a and be have OutNum3 and OutNum1
;Next we Load Total into D again and this time we AND A with #$F0 and AND B with #$F0
;Then we Right Shift A 4 times and Right Shift B 4 times.  This leaves A and B with the values
;for OutNum4 and OutNum2 respectively.
processTotal:
	STD Total
	LDD Total
	ANDB #$0F
	STAB OutNum1
	ANDA #$0F
	STAA OutNum3
	LDD Total
	ANDA #$F0
	ANDB #$F0
	
    LDY #4
RShift:
	LSRB
	LSRA
	DBNE Y, RShift
    
	STAB OutNum2
	ANDA #$0F
	STAA OutNum4
	LDY #500
;We now display the Total to the Seven Segment LED's
DISPLAY:
	CLRA
	LDAA OutNum1
	tfr a,x
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit3		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit3
	CLRA
	LDAA OutNum2
	tfr a,x
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit2		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit2
	
	LDAA OutNum3
	tfr a,x
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit1		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit1
	CLRA
	LDAA OutNum4
	tfr a,x
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit0		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit0
	DBNE Y, DISPLAY
	lbra loop0

	rts
