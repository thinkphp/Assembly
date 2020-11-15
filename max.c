#include <stdio.h>
#include <inttypes.h>

int64_t maxOf3(int64_t, int64_t, int64_t);

int main(int argc, char const *argv[])
{
	printf("%ld\n", maxOf3(1,2,3));
	printf("%ld\n", maxOf3(1,-2,4));
	printf("%ld\n", maxOf3(-1,2,5));
	printf("%ld\n", maxOf3(-1,-2,-3));
	printf("%ld\n", maxOf3(7,23,8));
	printf("%ld\n", maxOf3(7,10,3));
	printf("%ld\n", maxOf3(10,100,88));
	return 0;
}
