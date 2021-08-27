#include "p16F628a.inc" 
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    

RES_VECT  CODE    0x0000          
    GOTO    START              

MAIN_PROG CODE                      

i equ 0x30
j equ 0x31
k equ 0x32
dado equ 0x40

START
    MOVLW 0x07 
    MOVWF CMCON
    BCF STATUS, RP1 
    BSF STATUS, RP0 
    MOVLW b'00000000' 
    MOVWF TRISB 
    MOVLW b'00000010' 
    MOVWF TRISA
    BCF STATUS, RP0 

INICIO
    CLRF PORTB
    MOVLW b'00000110'
    MOVWF dado
    MOVFW dado
    MOVWF PORTB
    BTFSC PORTA, 1
    BTFSS PORTA, 1
    GOTO $-2
    DECFSZ dado
    GOTO $-6
    GOTO $-9
			
    END