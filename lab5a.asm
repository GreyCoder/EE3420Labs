;Lab5 Part 1 Israel Cabello and Eduardo Chavez
#include ee3420.inc

	org $1000
digi0 dc.b 0
digi1 dc.b 0
digi2 dc.b 0
digi3 dc.b 0

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
;This loop gets the next value from the keypad
loop0:	
;Shift Digit Variables to the Left
	movb digi2, digi3
	movb digi1, digi2
	movb digi0, digi1
	GETC_KEYPAD digi0
	ldy #160

;Process Digit 1
loop1:	ldaa digi0		;msb
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
;Display Digit 1
out1:	tfr a,x			;0<= x <= 15
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit3		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit3
    
;Process Digit 2
loop2:	ldaa digi1		; one right of msb
	cmpa #'*'
	bne check1a
	ldaa #14
	bra out2
check1a:	cmpa #'#'
	bne check2a
	ldaa #15
	bra out2
check2a: suba #$30
	cmpa #9
	ble out2
	suba #7
;Display Digit 2
out2:	tfr a,x			;0<= x <= 15
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit2		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit2	
    
;Process Digit 3
loop3:	ldaa digi2		; one right of msb
	cmpa #'*'
	bne check1b
	ldaa #14
	bra out3
check1b:	cmpa #'#'
	bne check2b
	ldaa #15
	bra out3
check2b: suba #$30
	cmpa #9
	ble out3
	suba #7
;Display Digit 3
out3:	tfr a,x			;0<= x <= 15
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit1		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit1
;Process Digit 4
loop4:	ldaa digi3		; one right of msb
	cmpa #'*'
	bne check1c
	ldaa #14
	bra out4
check1c:	cmpa #'#'
	bne check2c
	ldaa #15
	bra out4
check2c: suba #$30
	cmpa #9
	ble out4
	suba #7
;Display Digit 4
out4:	tfr a,x			;0<= x <= 15
	ldaa digit_pattern,x	;a has 7-segment pattern for 0-9,A-F
	bclr portp,bit0		;enable leftmost digit
	staa portb		;output 7-segment pattern
	delay_by_ms #digit_delay
	bset portp,bit0
	delay_by_ms #digit_delay
	dbne y, loop1;Repeat Processing and Displaying of the 7 Segment LED's
	lbra loop0;Repeat the whole Process With Next Value from the Keypad

	rts
