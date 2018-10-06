#ifndef _ALARM_H
#define _ALARM_H
#include "types.h"
#include "defs.h"

struct alarm_struct {
	int count;
	uint last;
	int ticks;
	int alarmed;
	void (*handler)(void);
};
#endif
