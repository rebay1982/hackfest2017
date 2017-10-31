#include <stdio.h>
#include <stdint.h>
#include <limits.h>

__attribute__((__weak__)) 
uint32_t asm_fn(uint32_t a, uint32_t b, uint32_t c, uint32_t d)
{
	return a + b + c + d;
}

int main(void)
{
	unsigned int num[] = {0, 32, 64, 128};
	uint32_t sum  = asm_fn(num[0], num[1], num[2], num[3]);
	printf("%u + %u + %u + %u = %u\n", num[0], num[1], num[2], num[3], sum);
	return 0;
}
