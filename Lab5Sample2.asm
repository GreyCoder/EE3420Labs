#include ee3420.inc

	org $1000
str1	dc.b "Hello World",null

	org $2000
	lcd_setup
	lcd_cursor 0,3
	puts_lcd #str1

	rts
