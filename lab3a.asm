;THESE INCLUDE FILES SHOULD APPEAR AT THE BEGINNING BEFORE YOUR CODE AND DATA
#INCLUDE EE3420.INC

	ORG $1000
STR1		DS.B 80		;DEFINES UNINITIALIZED STORAGE OF 80 BYTES APPROPRIATE FOR A STRING OF CHARACTERS
STR2		DS.B 80
NAME1		DS.B 80
ENAME1		DS.B 80
COMPARE		DS.B 2
					;NOTE THAR CR,LF, AND NULL ARE ASCII CODES DEFINED IN "ASCII.INC"
INT1		DS.B 2		;DEFINES UNINITIALIZED STORAGE FOR 1 WORD-LENGTH INTEGER.  1 WORD IS 2 BYTES LONG
INT2		DS.B 2		;DEFINES A WORD-LENGTH INTEGER INITIALIZED TO DECIMAL 123
NEWLINE 	DC.B CR,LF,NULL	;DEFINES A STRING OF THREE CHARACTERS CONSISTING OF CARRIAGE RETURN (CR), LINE FEED (LF), AND NULL 
PROMPT1	DC.B "Please Enter Your Name", CR,LF, NULL
PROMPT2a	DC.B "Hello ", NULL
PROMPT2b	DC.B ", your lucky number is ", NULL
PROMPT2c	DC.B ".",CR,LF, NULL
PROMPT3a	DC.B "Your Name In Reverse is ", NULL
PROMPT3b	DC.B ".",CR,LF, NULL
NUMBER		DS.B 80


	ORG $2000
MAIN:
	LIBRARY_VERSION			;OUTPUT A MESSAGE VIA SCI0 SHOWING THE VERSION OF THE FLASH LIBRARY IN USE.  IF NO MESSAGE APPEARS, SEE THE LAB INSTRUCTOR.
	PUTS_SCI0 #PROMPT1		;BEGINNING AT THE ADDRESS DEFINED AS THE VALUE OF THE LABEL PROMPT1, OUTPUT EVERY BYTE AS AN ASCII CHARACTER TO RS-232 PORT SCI0 UNTIL REACHING THE FIRST NULL (ZERO).
	GETS_SCI0 #NAME1
	PUTS #NEWLINE			;GETS NEEDS 1 PARAMETER WHICH RESOLVES TO 16-BIT ADDRESS OF START OF STRING
	STRLEN_DBUG12 #NAME1 ;Gets length of Name and stores in D
	STD INT2;store D in INT2
	TFR D,X;Transfer D to X
	LDY #0;Load 0 into Y to keep track of current letter in Name we are on
	CLRA
	CLRB
Loop1:
	LDAB NAME1, Y;load character in name at y offset
	CMPB CR;Compare to CR in which case we are at the end of the addition
	BEQ JUMP;if equal to cr jump to JUMP
	ABX;else add b to x
JUMP:
	INY;Increment Y
	CMPB NULL;Compare B with NULL 
	BNE Loop1;IF not NULL jump back to beginning of loop

	TFR X,D;transfer x to d
	LDX #20;load 20 into X
	IDIV;divide d by x
	ADDD #1;add 1 to D
	STD INT1;store d into int1
	ITOA INT1, #STR1;convert int1 to ascii and store in #STR1
	ITOA INT2, #STR2;Convert int2 to ascii and store in #STR2
	PUTS #NEWLINE;put a new line on screen
	PUTS #Prompt2a;display prompt2a
	PUTS #NAME1;display name
	PUTS #Prompt2b;display prompt2b
	PUTS #STR1;display lucky number
	PUTS #Prompt2c;display prompt 2c
	STRLEN_DBUG12 #NAME1;load length of name into D register
	LDX #0;load 0 into X
	TFR D, Y;transfer D (the length of the name) into Y
	DEY;decrement Y
REVERSE:;loop to reverse the name bascially it exchanges the first half of name with the second half
	LDAA NAME1, X;load name[x] which is the front of name into A
	LDAB NAME1, Y;load name[y] which is the back part ofname into B
	EXG A,B;Exchange A and B
	STAA NAME1, X;store A in Name[X]
	STAB NAME1, Y;Store B in Name[Y]
	INX;increment X
	DEY;decrement Y
	STY COMPARE;Store y in variable Compare
	CMPX COMPARE;compare X with COMPARE
	BLO REVERSE;if lower then go to beginning of Reverse Loop
	PUTS #NEWLINE;Display new line
	PUTS #Prompt3a;Display prompt3a
	PUTS #NAME1;Display Name reversed
	PUTS #Prompt3b;Display Prompt3b
	PUTS #NEWLINE;Display Newline
	RTS;Exit
