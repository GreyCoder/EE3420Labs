;THESE INCLUDE FILES SHOULD APPEAR AT THE BEGINNING BEFORE YOUR CODE AND DATA
#INCLUDE EE3420.INC
	ORG	$1000
RESERVE DS.B 4
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

	CLRA            ;Clear A
	CLRB            ;Clear B
LOOP            ;Loop to add
	LDAB PTH        ;Get data from DIP Switches of PTH into B register
	ABA	            ;Add B to A store in A

DISPLAY
	PSHA            ;Push A to Stack
	CLRA            ;Clear A
        LDAA    #$FF    ;Turn on LEDS
        STAA    DDRJ    
        LDAA    #$0
        STAA    PTJ
	PULA            ;Pull A back from Stack
	STAA PORTB      ;Output A to LEDs
	JSR DELAY       ;Delay half a second
	JSR DELAY       ;Delay half a second
	PSHA            ;Push A
	CLRA            ;Clear A
        LDAA    #$00    ;Turn off LEDS
        STAA    DDRJ
        LDAA    #$1
        STAA    PTJ
	PULA            ;Pull A
	JSR DELAY       ;Delay half a second
	BRA LOOP        ;Branch back to Loop
	
	RTS
;The following is code from Slides for Delay
DELAY
        PSHA            ;Save Reg A on Stack
        LDAA    #50     ;Change this value to see
        STAA    R3      ;how fast LEDs Toggle
;--10 msec delay. The D-Bug12 works at speed of 48MHz with XTAL=8MHz on Dragon12+ board
;Freq. for Instruction Clock Cycle (and Bus Cycle) is 24MHz (1/2 of 48Mhz).
;(1/24MHz) x 10 Clk x240x100x100=1 sec. Overheads are excluded in this calculation.         
L3      LDAA    #100
        STAA    R2
L2      LDAA    #240
        STAA    R1
L1      NOP         ;1 Instruction Clk Cycle
        NOP         ;1
        NOP         ;1
        DEC     R1  ;4
        BNE     L1  ;3
        DEC     R2  ;Total Instr.Clk=10
        BNE     L2
        DEC     R3
        BNE     L3
        PULA         ;Restore Reg A
        RTS