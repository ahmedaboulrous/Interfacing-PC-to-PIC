// Lcd pinout settings
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

unsigned char Recv;

void main() {
    TRISA = TRISB = TRISD = TRISC = 0;
    TRISC.F7 = 1;
    
    ADCON1 = 0X07;
    
    Lcd_Init();                        // Initialize LCD
    Lcd_Cmd(_LCD_CLEAR);               // Clear display
    Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
    Lcd_Out(1,2,"Serial Comm");        // Write text in first row

    Uart1_Init(9600);
    Delay_ms(100);

    for(;;) {
        if(UART1_Data_Ready()) {
            Recv = UART1_Read();
        }

        if(Recv == 'Y' || Recv == 'y') {
            PORTC.F0 = 1;
            PORTC.F1 = 0;
            Lcd_Cmd(_LCD_CLEAR);
        }
        else if(Recv == 'R' || Recv == 'r') {
            PORTC.F0 = 0;
            PORTC.F1 = 1;
            Lcd_Cmd(_LCD_CLEAR);
        }
        else if(Recv == 'L' || Recv == 'l') {
            PORTC.F0 = 0;
            PORTC.F1 = 0;
            Lcd_Out(2, 1, "Test LCD Output");
        }
        
        Delay_ms(20);
    }
}