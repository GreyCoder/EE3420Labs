#IFNDEF SYSTEM_SELECT
SYSTEM_SELECT EQU 1
#MSG "SYSTEM_SELECT.INC REVISION 08/06/2010"
#MSG "COPYRIGHT 2010 WILLIAM STAPLETON"
#MSG "THIS FILE MAY BE FREELY DISTRIBUTED AS LONG AS IT REMAINS UNCHANGED AND FULLY CREDITED."

#INCLUDE CONSTANTS.INC

;COMMENT OUT THE FOLLOWING LINE TO INCLUDE THE FULL FILE IN THE LISTING
	NOLIST

;SYSTEM_BOARD, SYSTEM_CPU, AND SYSTEM_OS MAY ALL BE SPECIFIED SEPARATELY
;BEFORE INCLUDING THIS FILE AND WILL OVERRIDE THE DEFAULTS LISTED HERE

;BOARDS
DRAGON12 EQU 1
DRAGON12PLUS EQU 2
MINIDRAGON EQU 3
MINIDRAGONPLUS EQU 4
SPIDER12 EQU 5
THUNDERBIRD12 EQU 6
MICRODRAGON EQU 7
TINYDRAGON EQU 8
DRAGONFLY12 EQU 9
DRAGONFLY12PLUS EQU 10
DRAGONFLYBOT EQU 11
NANOCORE12 EQU 12
NANOCORE12DX EQU 13
NANOCORE12MAX EQU 14

#IFNDEF SYSTEM_BOARD
#MSG "NO SYSTEM BOARD SPECIFIED. ASSUMING DRAGON12-PLUS."
#MSG "PLEASE NOTE THAT SOME FUNCTIONS SUCH AS SYSTEM SPEED VARY BY SYSTEM BOARD."
#MSG "ALSO, PORT AND PERIPHERAL AVAILABILITY VARIES BY SYSTEM BOARD."
SYSTEM_BOARD EQU DRAGON12PLUS	;CHANGE TO APPROPRIATE SYSTEM BOARD
#ENDIF

;CPUS
DP256 EQU 1	;MC9S12DP256
DG256 EQU 2
DT256 EQU 3
DJ256 EQU 4
C32 EQU 5
C128 EQU 6

;OS
DBUG12 EQU 1
UBUG12 EQU 2
SERIALMONITOR EQU UBUG12
UBUG12X EQU 3
SERIALMONITORX EQU UBUG12X

#IF SYSTEM_BOARD = DRAGON12
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU DP256
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU DBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 4000	;4MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = DRAGON12PLUS
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU DG256
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU DBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = MINIDRAGON
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU DP256
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU DBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 16000	;16MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = MINIDRAGONPLUS
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU DG256
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU DBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 16000	;16MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = SPIDER12
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU DG256
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU DBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = THUNDERBIRD12
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU DG256
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU DBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = MICRODRAGON
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU DG256
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU UBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 16000	;16MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = TINYDRAGON
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU DG256
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU UBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = DRAGONFLY12
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU C32
;SYSTEM_CPU EQU C128
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU UBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = DRAGONFLY12PLUS
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU C32
;SYSTEM_CPU EQU C128
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU UBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = DRAGONFLYBOT
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU C32
;SYSTEM_CPU EQU C128
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU UBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = NANOCORE12
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU C32
;SYSTEM_CPU EQU C128
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU UBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = NANOCORE12DX
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU C32
;SYSTEM_CPU EQU C128
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU UBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_BOARD = NANOCORE12MAX
#IFNDEF SYSTEM_CPU
SYSTEM_CPU EQU C32
;SYSTEM_CPU EQU C128
#ENDIF
#IFNDEF SYSTEM_OS
SYSTEM_OS EQU UBUG12
#ENDIF
#IFNDEF CRYSTAL_KHZ
CRYSTAL_KHZ EQU 8000	;8MHZ
#ENDIF
#ENDIF

#IF SYSTEM_CPU = DP256 | SYSTEM_CPU = DG256 | SYSTEM_CPU = DT256 | SYSTEM_CPU = DJ256
FIRST_FLASH_PAGE EQU $30
#ENDIF

#IF SYSTEM_CPU = C32
FIRST_FLASH_PAGE EQU $3E
#ENDIF

#IF SYSTEM_CPU = C128
FIRST_FLASH_PAGE EQU $38
#ENDIF

;112 PIN D_256 
;PORTA_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTB_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTE_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTH_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTJ_AVAILABLE	EQU BIT7+BIT6+BIT1+BIT0
;PORTK_AVAILABLE	EQU BIT7+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTM_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTP_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTS_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTAD0_AVAILABLE 	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTAD1_AVAILABLE 	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTAD_AVAILABLE  	EQU 0	;NO GP I/O ON A/D

;80 PIN D_256
;PORTA_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTB_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTE_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTH_AVAILABLE	EQU 0
;PORTJ_AVAILABLE	EQU BIT7+BIT6
;PORTK_AVAILABLE	EQU 0
;PORTM_AVAILABLE	EQU BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTP_AVAILABLE	EQU BIT7+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTS_AVAILABLE	EQU BIT3+BIT2+BIT1+BIT0
;PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTAD0_AVAILABLE 	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTAD1_AVAILABLE 	EQU 0
;PORTAD_AVAILABLE  	EQU 0	;NO GP I/O ON A/D

;48 PIN C32/C128
;PORTA_AVAILABLE	EQU BIT0
;PORTB_AVAILABLE	EQU BIT4
;PORTE_AVAILABLE	EQU BIT7+BIT4+BIT1+BIT0
;PORTH_AVAILABLE	EQU 0
;PORTJ_AVAILABLE	EQU 0
;PORTK_AVAILABLE	EQU 0
;PORTM_AVAILABLE	EQU BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTP_AVAILABLE	EQU BIT5
;PORTS_AVAILABLE	EQU BIT1+BIT0
;PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
;PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;A/D INPUT ONLY
;PORTAD1_AVAILABLE EQU 0
;PORTAD_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;GP I/O OVERLAY PORTAD0

#IF SYSTEM_BOARD = DRAGON12  | SYSTEM_BOARD = DRAGON12PLUS 
PORTA_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTB_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTE_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTH_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTJ_AVAILABLE	EQU BIT7+BIT6+BIT1+BIT0
PORTK_AVAILABLE	EQU BIT7+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTM_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTP_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTS_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD1_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD_AVAILABLE EQU 0	;NO GP I/O ON A/D
#ENDIF ;SYSTEM_BOARD = DRAGON12  | SYSTEM_BOARD = DRAGON12PLUS 

#IF SYSTEM_BOARD = MINIDRAGON | SYSTEM_BOARD = MINIDRAGONPLUS 
PORTA_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTB_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTE_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTH_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTJ_AVAILABLE	EQU BIT7+BIT6+BIT1+BIT0
PORTK_AVAILABLE	EQU BIT7+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTM_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTP_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTS_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD1_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD_AVAILABLE EQU 0	;NO GP I/O ON A/D
#ENDIF ;SYSTEM_BOARD = MINIDRAGON | SYSTEM_BOARD = MINIDRAGON2 

#IF SYSTEM_BOARD = SPIDER12
PORTA_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTB_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTE_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTH_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTJ_AVAILABLE	EQU BIT7+BIT6+BIT1+BIT0
PORTK_AVAILABLE	EQU BIT7+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTM_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTP_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTS_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD1_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD_AVAILABLE EQU 0	;NO GP I/O ON A/D
#ENDIF ;SYSTEM_BOARD = SPIDER12

#IF SYSTEM_BOARD = THUNDERBIRD12
PORTA_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTB_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTE_AVAILABLE	EQU BIT7+BIT6+BIT3+BIT2+BIT1
PORTH_AVAILABLE	EQU 0
PORTJ_AVAILABLE	EQU BIT7+BIT6
PORTK_AVAILABLE	EQU 0
PORTM_AVAILABLE	EQU BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTP_AVAILABLE	EQU BIT7+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTS_AVAILABLE	EQU BIT3+BIT2+BIT1+BIT0
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2
PORTAD1_AVAILABLE EQU 0
PORTAD_AVAILABLE EQU 0	;NO GP I/O ON A/D
#ENDIF ;SYSTEM_BOARD = THUNDERBIRD12 

#IF SYSTEM_BOARD = MICRODRAGON
PORTA_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTB_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTE_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTH_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTJ_AVAILABLE	EQU BIT7+BIT6+BIT1+BIT0
PORTK_AVAILABLE	EQU BIT7+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTM_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTP_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTS_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD1_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD_AVAILABLE EQU 0	;NO GP I/O ON A/D
#ENDIF ;SYSTEM_BOARD = MICRODRAGON

#IF SYSTEM_BOARD = TINYDRAGON 
PORTA_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTB_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTE_AVAILABLE	EQU 0
PORTH_AVAILABLE	EQU 0
PORTJ_AVAILABLE	EQU 0
PORTK_AVAILABLE	EQU 0
PORTM_AVAILABLE	EQU BIT5+BIT4+BIT3+BIT2		;ONLY AVAILABLE ON SPI HEADER
PORTP_AVAILABLE	EQU BIT7+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTS_AVAILABLE	EQU BIT3+BIT2+BIT1+BIT0		;ONLY AVAILABLE AS SCI0 AND SCI1
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD1_AVAILABLE EQU 0
PORTAD_AVAILABLE EQU 0	;NO GP I/O ON A/D
#ENDIF ;SYSTEM_BOARD = TINYDRAGON 

#IF SYSTEM_BOARD = DRAGONFLY12 | SYSTEM_BOARD = DRAGONFLY12PLUS 
PORTA_AVAILABLE	EQU BIT0
PORTB_AVAILABLE	EQU BIT4
PORTE_AVAILABLE	EQU BIT7+BIT4+BIT1+BIT0
PORTH_AVAILABLE	EQU 0
PORTJ_AVAILABLE	EQU 0
PORTK_AVAILABLE	EQU 0
PORTM_AVAILABLE	EQU BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTP_AVAILABLE	EQU BIT5
PORTS_AVAILABLE	EQU BIT1+BIT0
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;A/D INPUT ONLY
PORTAD1_AVAILABLE EQU 0
PORTAD_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;GP I/O OVERLAY PORTAD0
#ENDIF ;SYSTEM_BOARD = DRAGONFLY12 | SYSTEM_BOARD = DRAGONFLY12PLUS 

#IF SYSTEM_BOARD = DRAGONFLYBOT 
PORTA_AVAILABLE	EQU BIT0
PORTB_AVAILABLE	EQU BIT4
PORTE_AVAILABLE	EQU BIT7+BIT4+BIT1+BIT0
PORTH_AVAILABLE	EQU 0
PORTJ_AVAILABLE	EQU 0
PORTK_AVAILABLE	EQU 0
PORTM_AVAILABLE	EQU BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTP_AVAILABLE	EQU BIT5
PORTS_AVAILABLE	EQU BIT1+BIT0
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;A/D INPUT ONLY
PORTAD1_AVAILABLE EQU 0
PORTAD_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;GP I/O OVERLAY PORTAD0
#ENDIF ;SYSTEM_BOARD = DRAGONFLYBOT

#IF SYSTEM_BOARD = NANOCORE12 
PORTA_AVAILABLE	EQU 0
PORTB_AVAILABLE	EQU 0
PORTE_AVAILABLE	EQU 0
PORTH_AVAILABLE	EQU 0
PORTJ_AVAILABLE	EQU 0
PORTK_AVAILABLE	EQU 0
PORTM_AVAILABLE	EQU 0
PORTP_AVAILABLE	EQU 0
PORTS_AVAILABLE	EQU BIT1+BIT0		;ONLY INDIRECT VIA RS-232
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;A/D INPUT ONLY
PORTAD1_AVAILABLE EQU 0
PORTAD_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;GP I/O OVERLAY PORTAD0
#ENDIF ;SYSTEM_BOARD = NANOCORE12 

#IF SYSTEM_BOARD = NANOCORE12DX 
PORTA_AVAILABLE	EQU 0
PORTB_AVAILABLE	EQU 0
PORTE_AVAILABLE	EQU BIT1+BIT0
PORTH_AVAILABLE	EQU 0
PORTJ_AVAILABLE	EQU 0
PORTK_AVAILABLE	EQU 0
PORTM_AVAILABLE	EQU BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTP_AVAILABLE	EQU 0
PORTS_AVAILABLE	EQU BIT1+BIT0 		;ONLY INDIRECT VIA RS-232
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;A/D INPUT ONLY
PORTAD1_AVAILABLE EQU 0
PORTAD_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;GP I/O OVERLAY PORTAD0
#ENDIF ;SYSTEM_BOARD = NANOCORE12DX

#IF SYSTEM_BOARD = NANOCORE12MAX 
PORTA_AVAILABLE	EQU BIT0
PORTB_AVAILABLE	EQU BIT4
PORTE_AVAILABLE	EQU BIT7+BIT4+BIT1+BIT0
PORTH_AVAILABLE	EQU 0
PORTJ_AVAILABLE	EQU 0
PORTK_AVAILABLE	EQU 0
PORTM_AVAILABLE	EQU BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTP_AVAILABLE	EQU BIT5
PORTS_AVAILABLE	EQU BIT1+BIT0		;ONLY INDIRECT VIA RS-232
PORTT_AVAILABLE	EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0
PORTAD0_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;A/D INPUT ONLY
PORTAD1_AVAILABLE EQU 0
PORTAD_AVAILABLE EQU BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0 ;GP I/O OVERLAY PORTAD0
#ENDIF ;SYSTEM_BOARD = NANOCORE12MAX 

;THE FOLLOWING LINE RESTORES LISTING FOR CODE OUTSIDE OF THIS LIBRARY
	LIST

#ENDIF ;SYSTEM_SELECT
