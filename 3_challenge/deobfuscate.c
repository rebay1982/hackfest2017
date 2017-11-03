#include <stdio.h>

int main(void)
{
	int i;

#if 0
	unsigned int b6_long[] = {0x3ade9daa, 0x659ae09d, 0x6da2e09d, 0x75aae09d,
			      0x554ed89d, 0x65855fd3, 0x9d15549d, 0x45401e54,
			      0x555518b2, 0x55555555, 0x55555555};
	char *b6 = (char*)b6_long;
	for (i = 0; i < sizeof(b6_long); ++i) {
		printf("%c", b6[i] - 0x55);
	}
#endif

#if 1
	char b1[] = {30,  57,  33, 118, 55, 52, 57,  35, 34,
		     118, 33,  51, 118, 38, 58, 55,  47, 118,
		     55,  118, 49, 55,  59, 51, 105, 92, 0x00};
	printf("b1:");
	for (i = 0; i < sizeof(b1) / sizeof(*b1); ++i) {
		printf("%c", b1[i] ^ 0x56);
	}
	printf("\n");
#endif

#if 1
	printf("b2:");
	char b2[] = {15,  57,  35,  118, 53,  55, 56,  118, 57, 56,  58,
		     47,  118, 49,  57,  118, 34, 57,  118, 56, 51,  46,
		     34,  118, 37,  34,  51,  38, 118, 33,  63, 34,  62,
		     118, 34,  62,  51,  118, 49, 57,  57,  50, 118, 61,
		     51,  47,  120, 120, 120, 92, 0x00};
	for (i = 0; i < sizeof(b2) / sizeof(*b2); ++i) {
		printf("%c", b2[i] ^ 0x56);
	}
	printf("\n");
#endif

#if 1
	printf("b3:");
	char b3[] = {6,  58, 51,  55, 37, 51, 118, 51,  56, 34, 51, 36, 118, 34,
		     62, 51, 118, 49, 57, 57, 50,  118, 61, 51, 47, 92, 0x00};
	for (i = 0; i < sizeof(b3) / sizeof(*b3); ++i) {
		printf("%c", b3[i] ^ 0x56);
	}
	printf("\n");
#endif

#if 1
	printf("b4:");
	char b4[] = {24, 62, 55, 118, 56, 62,  55, 118, 56, 62,  55, 119, 118,
		     1,  36, 57, 56,  49, 118, 61, 51,  47, 119, 92, 0x00};
	for (i = 0; i < sizeof(b4) / sizeof(*b4); ++i) {
		printf("%c", b4[i] ^ 0x56);
	}
	printf("\n");
#endif

#if 1
	printf("b5:");
	char b5[] = {17, 57, 57,  50, 118, 60, 57,  52, 122, 118, 47,
		     57, 35, 118, 49, 57,  34, 118, 34, 62,  51,  118,
		     49, 57, 57,  50, 118, 61, 51,  47, 119, 92,  0x00};
	for (i = 0; i < sizeof(b5) / sizeof(*b5); ++i) {
		printf("%c", b5[i] ^ 0x56);
	}
	printf("\n");
#endif
#if 1
	printf("rax:");
	long l_rax[] = {0x41424443};
	char *rax = (char*)l_rax;
	for (i = 0; i < sizeof(l_rax); ++i) {
		printf("%c", rax[i]);
	}
	printf("\n");
#endif
}
