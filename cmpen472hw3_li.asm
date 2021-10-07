
************************************************************************ 
* Title:  CMPEN 472 Homework 13
*
* Date:   9/15/2021
*
* Author: Joshua Li
*
*
***********************************************************************
* 
* Register use: A: LED Light ON/OFF state and Switch 1 on/off state
* X, Y: Delay loop counters 
*
* Memory use: RAM Locations from $3000 for data
*             RAM Locations from $3100 for program
*
* Input:Parameters hard-codedd in the program - PORTB
*       Switch 1 at PORTB bit 0
*       Switch 2 at PORTB bit 1
*       Switch 3 at PORTB bit 2
*       Switch 4 at PORTB bit 3
*
* Output:
*       LED 1 at PORTB bit 4
*       LED 2 at PORTB bit 5
*       LED 3 at PORTB bit 6
*       LED 4 at PORTB bit 7
*        
*
* Observation: This project is a program that blinks LEDs and controls brightness by PWM 
*
* Comments: This program was developed using CodeWarrrior simulation tool that simulated a CSM-12C124 Board running at 24MHz
* 
* 
***********************************************************************
* Parameter Declaration Section
*
* Export Symbols
	    XDEF	   pstart ; export 'pgstart' symbol
    	ABSENTRY pstart ; for assembly entry point
    	
* Symbols and Macros
PORTA EQU	$0000	      ; i/o port A addresses
PORTB	EQU	$0001       ; i/o port B addresses
DDRA	EQU	$0002       ; Data Direction Register
DDRB	EQU	$0003
******************************************************************
* Data Section; address used { $3000 to $30FF } RAM memory
*
	        ORG	  $3000	;reserved memory starting address origin
Counter1  DC.W  $003B	;X register count number for time delay inner loop for 10msec  	  
*******************************************************************
* Program Section
*
	      ORG $3100	  ;Program start address, in RAM
pstart  LDS #$3100  ;initialize the stack pointer	
                    ;load stack pointer 
	      
	      LDAA  #%11110001  ;LED 1,2,3,4 at PORTB bit 4,5,6,7 FOR SIMULATION ONLY
	                        ;Last bit for switch input
	                         
	      STAA  DDRB        ;Set PORTB bit 4,5,6,7 as output
	      
	      LDAA #%00000000
	      STAA PORTB        ;Turn off LED 1,2,3,4 (all bits in PORTB, for simulation)
	      
mainLoop
        
        BSET PORTB, %10000000 ;Turn on LED 4 at PortB bit 7 Always On

        LDAA  PORTB    
        ANDA #%00000001      ;check bit 0 of PORTB, switch 1
                             
        BNE sw1pushed         ;if 1, jump to pushed button code
                              ;if 0, continue to not pushed code
sw1notpushed
              
              ;Delay 21 times by loading counter 
              LDAB #$15
              BSET PORTB, %00100000 ;LED2 ON
repeat21
              JSR delay10msec        ;delay
              decb                   ;decrease counter
              bne repeat21
               
              ;Delay 79 times by loading counter
              LDAB #$4f
              BCLR PORTB, %00100000 ;LED2 OFF
repeat79
              JSR delay10msec
              decb                  ;delay
              bne repeat79          ;decrease counter
               
              BRA mainLoop; 

sw1pushed     
              ;Delay 89 times by loading couter  
              LDAB #$59
              BSET PORTB, %00100000   ;LED2 ON
repeat89
              JSR delay10msec          ;delay
              decb                    ;decrease counter
              bne repeat89
              
              ;Delay 11 times by loadng counter  
              LDAB #$B
              BCLR PORTB, %00100000   ;LED2 OFF

repeat11
              JSR delay10msec         ;delay
              decb                    ;decrease counter
              bne repeat11
              
              BRA mainLoop;


        
***********************************************************************************************                       
*	SUBROUTINES
* Address Used { $3100 to $3FFF } RAM memory
***********************************************************************************************


*delay10msec subroutine***********************************************

delay10msec
          
          PSHA
          LDAA Counter1
loop
          SUBA #$01
          BNE loop
          PULA
          RTS
          

*********************************************************************
END	                            ;last line of a file