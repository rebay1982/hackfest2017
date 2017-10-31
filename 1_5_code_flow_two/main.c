#include <ctype.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>

#define ARRAY_SIZE(x) ( sizeof(x)/sizeof(x[0]) )

char note[] = "This is my secret note to Bob - Alice";
 
#ifndef HEXDUMP_COLS
#define HEXDUMP_COLS 8
#endif
void hexdump(void *mem, unsigned int len)
{
	unsigned int i, j;

	for (i = 0; i < len + ((len % HEXDUMP_COLS)
				   ? (HEXDUMP_COLS - len % HEXDUMP_COLS)
				   : 0);
	     i++) {
		/* print offset */
		if (i % HEXDUMP_COLS == 0) {
			printf("0x%06x: ", i);
		}

		/* print hex data */
		if (i < len) {
			printf("%02x ", 0xFF & ((char *)mem)[i]);
		} else {
			printf("   ");
		}

		/* print ASCII dump */
		if (i % HEXDUMP_COLS == (HEXDUMP_COLS - 1)) {
			for (j = i - (HEXDUMP_COLS - 1); j <= i; j++) {
				if (j >=
				    len) /* end of block, not really printing */
				{
					putchar(' ');
				} else if (isprint(((char *)mem)[j])) {
					putchar(0xFF & ((char *)mem)[j]);
				} else {
					putchar('.');
				}
			}
			putchar('\n');
		}
	}
}

__attribute__((__weak__)) 
#define XOR_KEY 0b10101010
void obfuscate(char *msg, size_t msg_len)
{
	off_t i;
	for (i = 0; i < msg_len; i++) {
		msg[i] = msg[i] ^ XOR_KEY;	
	}
}

int main(void)
{
	printf("Original message\n");
	hexdump(note, ARRAY_SIZE(note));

	obfuscate(note, ARRAY_SIZE(note)-1);
	printf("\nObfuscated message\n");
	hexdump(note, ARRAY_SIZE(note));

	printf("\nDeobfuscated message\n");
	obfuscate(note, ARRAY_SIZE(note)-1);
	hexdump(note, ARRAY_SIZE(note));

	return 0;
}
