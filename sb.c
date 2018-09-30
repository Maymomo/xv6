#include "types.h"
#include "stat.h"
#include "user.h"


const char *hex = "012345678abcdef";

void shownum(uint num)
{
	char v = 0;
	if((num / 16) != 0) {
		shownum(num / 16);
	}
	v = hex[num%16];
	write(1, &v, 1);
}

void show(void *p)
{
	uint val = (uint)p;
	shownum(val);
	write(1, "\n", 1);
}


char *s = "sbrk(1)\n";
int main(int arg, char **argv)
{
	//char *p = 0;
	write(1, s, strlen(s));
	char *val = sbrk(4096*2);
	printf(1, "%p\n", val+1);

	if(fork() == 0) {
	//val++;
	  gets(val, 4096);
	  printf(1, "%s", val);
	  exit();
	}
	wait();
	//show(val);
	//show((void *)0x4000);
	for(int i = 0; i < 4096; i++) {
		//*p = 2;
	}
	exit();
}
