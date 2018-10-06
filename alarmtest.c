#include "types.h"
#include "stat.h"
#include "user.h"

void periodic();

static int i;
int
main(int argc, char *argv[])
{
  printf(1, "alarmtest starting\n");
  alarm(100, periodic);
  for(i = 0; i < 25*50000000; i++){
	  printf(1, " ");
	 // for(int h  = 0; h < 2000; h++);
	  //printf(1, "%x\n", i);
     // write(2, ".", 1);
  }
  exit();
}

void
periodic()
{
  printf(1, "%d\n", i);
}
