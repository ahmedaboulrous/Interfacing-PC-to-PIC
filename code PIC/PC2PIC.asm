
_main:

;PC2PIC.c,19 :: 		void main() {
;PC2PIC.c,20 :: 		TRISA = 0;
	CLRF        TRISA+0 
;PC2PIC.c,21 :: 		TRISB = 0;
	CLRF        TRISB+0 
;PC2PIC.c,22 :: 		TRISD = 0;
	CLRF        TRISD+0 
;PC2PIC.c,24 :: 		TRISC.F0 = 0;
	BCF         TRISC+0, 0 
;PC2PIC.c,25 :: 		TRISC.F1 = 0;
	BCF         TRISC+0, 1 
;PC2PIC.c,26 :: 		TRISC.F6 = 0;
	BCF         TRISC+0, 6 
;PC2PIC.c,27 :: 		TRISC.F7 = 1;
	BSF         TRISC+0, 7 
;PC2PIC.c,29 :: 		ADCON1 = 0X07;
	MOVLW       7
	MOVWF       ADCON1+0 
;PC2PIC.c,31 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;PC2PIC.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;PC2PIC.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;PC2PIC.c,34 :: 		Lcd_Out(1,2,"Serial Comm");        // Write text in first row
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_PC2PIC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_PC2PIC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;PC2PIC.c,36 :: 		Uart1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;PC2PIC.c,37 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;PC2PIC.c,40 :: 		for(;;)
L_main1:
;PC2PIC.c,43 :: 		if(UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;PC2PIC.c,45 :: 		Recv = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Recv+0 
;PC2PIC.c,46 :: 		}
L_main4:
;PC2PIC.c,49 :: 		if(Recv == 'Y' || Recv == 'y')
	MOVF        _Recv+0, 0 
	XORLW       89
	BTFSC       STATUS+0, 2 
	GOTO        L__main17
	MOVF        _Recv+0, 0 
	XORLW       121
	BTFSC       STATUS+0, 2 
	GOTO        L__main17
	GOTO        L_main7
L__main17:
;PC2PIC.c,51 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;PC2PIC.c,52 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;PC2PIC.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;PC2PIC.c,54 :: 		}
L_main7:
;PC2PIC.c,55 :: 		if(Recv == 'R' || Recv == 'r')
	MOVF        _Recv+0, 0 
	XORLW       82
	BTFSC       STATUS+0, 2 
	GOTO        L__main16
	MOVF        _Recv+0, 0 
	XORLW       114
	BTFSC       STATUS+0, 2 
	GOTO        L__main16
	GOTO        L_main10
L__main16:
;PC2PIC.c,57 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;PC2PIC.c,58 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;PC2PIC.c,59 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;PC2PIC.c,60 :: 		}
L_main10:
;PC2PIC.c,61 :: 		if(Recv == 'L' || Recv == 'l')
	MOVF        _Recv+0, 0 
	XORLW       76
	BTFSC       STATUS+0, 2 
	GOTO        L__main15
	MOVF        _Recv+0, 0 
	XORLW       108
	BTFSC       STATUS+0, 2 
	GOTO        L__main15
	GOTO        L_main13
L__main15:
;PC2PIC.c,63 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;PC2PIC.c,64 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;PC2PIC.c,65 :: 		Lcd_Out(2, 1, "Test LCD Output");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_PC2PIC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_PC2PIC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;PC2PIC.c,66 :: 		}
L_main13:
;PC2PIC.c,68 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	NOP
	NOP
;PC2PIC.c,70 :: 		}
	GOTO        L_main1
;PC2PIC.c,72 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
