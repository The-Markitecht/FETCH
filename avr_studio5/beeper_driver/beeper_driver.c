
#include <avr/io.h>

int rest(uint16_t dur) {
	for (uint16_t i = 0; i < dur; i++) {}	
}

int beep(uint16_t dur, uint16_t period) {
	uint16_t high_time = period >> 1;
	for (uint16_t pulses = 0; pulses < dur; pulses++) {			
		PORTB = 1 << 4;
		rest(high_time);
		PORTB = 0;
		rest(period);
	}	
}

int main(void)
{
	// B3 = beeper enable input.
	// B4 = piezo output.
	DDRB = 1 << 4;
    while(1)
    {
		if ((PINB & (1 << 3)) == 0) {
			// silence & remove DC from the piezo.
			PORTB = 0;			
		} else {
			beep(300, 10);
			rest(100);
			beep(300, 8);
			rest(36000);
		}
    }
}