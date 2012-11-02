;THESE INCLUDE FILES SHOULD APPEAR AT THE BEGINNING BEFORE YOUR CODE AND DATA
#INCLUDE EE3420.INC

	ORG $1000
FN	DS.B 8 ;To store the Ascii value of Fn
FN1	DS.B 8 ; To store the Ascii value of the first seed
FN2	DS.B 8 ; To store the Ascii value of the second seed
IFN	DS.W 1 ; Integer value of Fn
IFN1	DS.W 1 ;Integer Value of Fn1
IFN2	DS.W 1 ;Integer Value of Fn2
NEWLINE 	DC.B CR,LF,NULL	;DEFINES A STRING OF THREE CHARACTERS CONSISTING OF CARRIAGE RETURN (CR), LINE FEED (LF), AND NULL 
PROMPT1	DC.B "Please Enter a Seed for F1 between (0-9)", CR,LF, NULL;Prompt for first seed
PROMPT2	DC.B "Please Enter a Seed for F2 between (0-9)", CR,LF, NULL;Prompt for second seed
COMMA 	DC.B ",",NULL
	ORG $2000
MAIN:
	
GETFN1:
	PUTS #PROMPT1;prompt user for first seed fn1
	GETS #FN1;Get value from user store in FN1
	ATOI #FN1, IFN1;convert what was inputed from ascii to integer
	LDD IFN1;load Integer value of fn1 into D
	CMPD #0;Compare with Zero
	BLO GETFN1;If value is Less than zero then prompt for seed again
	CMPD #9;Compare with 9
	BHI GETFN1; If greater than 9 prompt again
GETFN2:
	PUTS #PROMPT2;prompt user for second seed
	GETS #FN2;get user input and store in FN2
	ATOI #FN2, IFN2;convert from ascii to integer
	LDD IFN2;load into D
	CMPD #0;compare with 0
	BEQ GETFN2;if 0 prompt again
	BLO GETFN2;if lower than zero prompt again
	CMPD #9;compare with 9
	BHI GETFN2;if greater prompt again
	LDD IFN1;load fn1 into D
	ADDD IFN2;add fn2 to D
	STD IFN;store d in FN
	ITOA IFN, #FN;convert IFN from integer to Ascii 
	PUTS #FN1;Display FN1
	PUTS #COMMA;Display Comma
	PUTS #FN2;Display FN2
	PUTS #COMMA	;Display Comma
	PUTS #FN;Display FN
	PUTS #COMMA	;Display Comma
LOOPFN:;Loop to do Fibonaci sequence
	MOVW IFN2, IFN1;move Integers FN2 -> FN1
	MOVW IFN, IFN2;move Integers FN -> FN2

	LDD IFN1;Load FN1 into D
	ADDD IFN2;Add FN2 to D
	BCS EXIT;if carry set than we have gone over the limit for the register greater than 65,000 so we exit
	STD IFN;store D in variable IFN
	ITOA IFN, #FN;Convert Integer FN to Ascii FN
	PUTS #FN;display ascii FN
	PUTS #COMMA	;Display a comma
    BRA LOOPFN;Branch to LOOPFN
EXIT:
	RTS
