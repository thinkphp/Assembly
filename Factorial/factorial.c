#include <stdio.h>
#include <inttypes.h>

uint64_t fact(uint64_t n);

int main(int argc, char const *argv[])
{
	for(uint64_t i = 0; i <= 20; ++i)
	{
	 	printf("factorial(%2lu) = %lu\n", i, fact(i));
	} 
	return(0);
}
