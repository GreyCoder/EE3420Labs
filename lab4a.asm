;THESE INCLUDE FILES SHOULD APPEAR AT THE BEGINNING BEFORE YOUR CODE AND DATA
#INCLUDE EE3420.INC
	ORG	$1000
R1      EQU     $1001
R2      EQU     $1002
R3      EQU     $1003
VAR1 DS.B 1

;code section
        ORG     $2000   ;RAM address for Code
        LDS     #$2000  ;Stack
        LDAA    #$FF
        STAA    DDRB    ;Make PORTB output
        LDAA    #$0
        STAA    DDRH    ;PTH as Input
  ;PTJ1 controls the LEDs connected to PORTB (For Dragon12+ ONLY)
        LDAA    #$FF              
        STAA    DDRJ    ;Make PORTJ output, (Needed by Dragon12+)
        LDAA    #$0
        STAA    PTJ     ;Turn off PTJ1 to allow the LEDs on PORTB to show data (Needed by Dragon12+)
BACK
	CLRA
	CLRB
	LDAB PTH        ;Get data from DIP Switches of PTH
	LSLD            ;Left Shift D 4 Times moving upper four bits of B into lower 4 bits of A
	LSLD
	LSLD
	LSLD
	LSRB            ;Right Shift B 4 Times Moving Lower 4 bits of B back to position
	LSRB
	LSRB
	LSRB
	STAB VAR1       ; Store B in VAR1
	CMPA VAR1       ; Compare A with Var1
	BHI GREATER     ;If A is > go to Greater
	BLO LESS        ;If A is < go to Less
	BEQ EQUAL       ;If A is = turn off the leds
	BRA BACK
EQUAL
	LDAA #$00       ;Load A with 0
	STAA PORTB      ;Output A to LEDS
	BRA BACK	    ;Branch back to loop
GREATER
	LDAA #$F0       ; Load A with $F0
	STAA PORTB      ;and send it to PORTB which displays to LEDS
	BRA BACK
LESS
	LDAA #$0F       ;Load A with $0F
	STAA PORTB      ;and send it to PORTB which displays to LEDS
	BRA BACK
	RTS