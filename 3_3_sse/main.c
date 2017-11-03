#include <stdio.h>
#include <math.h>

extern double sse_bonus(void);
extern double sse_add(double a, double b);
extern double sse_mul(double a, double b);
extern double sse_sqrt(double a);
extern double sse_pythagore(double a, double b);


int main(int argc, char* argv[])
{
	double a = 4.5;
	double b = 5.5;
	double c = 0.0;

	//c = sse_pythagore(a, b);
	printf("value is %lf %lf %lf\n", a, b, c);

	a = sse_mul(a, a);
  b = sse_mul(b, b);
	c = sse_add(a, b);
	c = sse_sqrt(c);
	printf("value is %lf %lf %lf\n", a, b, c);
  //
	// c = sse_bonus();
	 printf("value is %lf\n", c);
}
