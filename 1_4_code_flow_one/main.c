#include <stdio.h>
#include <stdint.h>
#include <limits.h>

__attribute__((__weak__)) 
int32_t is_equal(int32_t param1, int32_t param2)
{
#if 0
	if (param1 == param2)
		return 1;
	else
		return 0;
#else
	return param1 == param2;
#endif
}

int main(void)
{
	int32_t param1 = 0;
	int32_t param2 = 0;

	printf("%d %s %d\n", param1, 
			is_equal(param1, param2) ? "==" : "!=", 
			param2);

	param1 = 0;
	param2 = 1;
	printf("%d %s %d\n", param1, 
			is_equal(param1, param2) ? "==" : "!=", 
			param2);
	return 0;
}
