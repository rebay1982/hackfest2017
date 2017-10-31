#include <stdio.h>
#include <stdint.h>
#include <limits.h>

int random_int = 0x2345;

unsigned long __attribute__((__weak__)) asm_fn(void)
{
	return random_int;
}

int main(void)
{
	printf("0x%lX\n", asm_fn());
	return 0;
}
