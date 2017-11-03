#include <stdio.h>

__attribute__((__weak__)) extern unsigned int bar(void);

unsigned int foo(void)
{
	return 0xf;
}

int main(void)
{
	printf("Return is 0x%X\n", foo());
	printf("Return is 0x%X\n", bar());
}
