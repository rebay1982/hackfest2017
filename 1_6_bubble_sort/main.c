#include <ctype.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>

#define ARRAY_SIZE(x) ( sizeof(x)/sizeof(x[0]) )

extern int random_numbers[10];

__attribute__((__weak__)) void 
sort_ascending(int *array, size_t array_len)
{
	int i = 0;
	int tmp;
	while (i < array_len) {
		if (i == array_len - 1) {
			array_len--;
			i = 0;
			continue;
		}

		tmp = array[i];
		if (tmp > array[i+1]) {
			array[i] = array[i+1];
			array[i+1] = tmp;
		}
		i++;
	}
}

int main(void)
{
	int i;
	int tmp;

	printf("Unsorted numbers\n");
	for (i = 0; i < ARRAY_SIZE(random_numbers); ++i) {
		printf("%d ", random_numbers[i]);
	}

	printf("\nSorted numbers\n");
	sort_ascending(random_numbers, ARRAY_SIZE(random_numbers));
	for (i = 0; i < ARRAY_SIZE(random_numbers); ++i) {
		printf("%d ", random_numbers[i]);
	}
	printf("\n");
		
	return 0;
}
