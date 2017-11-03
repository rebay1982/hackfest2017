#include <ctype.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>

__attribute__((__weak__)) 
int is_prime(unsigned int num)
{
#if 0 /* Hard mode */
	int i;
	if (num < 2)
		return 0;
	if (num % 2 == 0 && num > 2)
		return 0;
	for (i = 3; i < num / 2; i += 2) {
		if (num % i == 0)
			return 0;
	}
	return 1;
#else
	int i = 0;
	if (num < 2)
		return 0;
	for (i = 2; i < num; i++)
		if (num % i == 0)
			return 0;
	return 1;
#endif
}

#define RANGE 20
int main(void)
{
	int i;
	for (i = 0; i < RANGE; i++)
		printf("%d is%sprime\n", i, is_prime(i) ? " " : " not ");
	return 0;
}
