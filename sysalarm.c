#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "syscall.h"


int
sys_alarm(void)
{

	void (*alarmhandler)(void);
	int ticks;
	struct proc *curproc = myproc();
	if(argptr(1, (char **)&alarmhandler, 4) < 0)
		return -1;
	if(argint(0, &ticks) < 0)
		return -1;
	if((uint)alarmhandler < curproc->pgstart || (uint)alarmhandler >= curproc->sz)
		return -1;
	if(ticks <= 0)
		return -1;
	set_alarm(curproc, ticks, alarmhandler);
	return 0;
}


static int 
setup_frame(struct trapframe *tf, alarm_handler handler)
{
	struct user_context usave;
	uint old_esp = tf->esp;
	uint *ret_eip = 0;
	usave.eflags = tf->eflags;
	usave.eip = tf->eip;
	usave.esp = tf->esp;
	usave.edi = tf->edi;
	usave.esi = tf->esi;
	usave.ebp = tf->ebp;
	usave.oesp = tf->oesp;
	usave.ebx = tf->ebx;
	usave.edx = tf->edx;
	usave.ecx = tf->ecx;
	usave.eax = tf->eax;
	//now just copy force user stack overflow
    old_esp -= sizeof(usave);
	memmove((char *)old_esp, (char *)&usave, sizeof(usave));
	old_esp -= sizeof(int);
	ret_eip = (uint *)old_esp;
	*ret_eip = (uint)&syscodes[SYS_alarm_ret-1];
	tf->eip = (uint)handler;
	tf->esp = old_esp;
	return 0;
}

static int
resetup_frame(struct proc *p)
{
	struct user_context usave;
	struct trapframe *tf = p->tf;
	uint  new_esp = tf->esp;
	memmove((char *)&usave, (char *)new_esp, sizeof(usave));
	tf->eflags = usave.eflags;
	tf->eip = usave.eip;
	tf->esp = usave.esp;
	tf->edi = usave.edi;
	tf->esi = usave.esi;
	tf->ebp = usave.ebp;
	tf->oesp = usave.oesp;
	tf->ebx = usave.ebx;
	tf->edx =  usave.edx;
	tf->ecx = usave.ecx;
	tf->eax = usave.eax;
	return 0;
}

int
sys_alarm_ret()
{
	struct proc *p = myproc();
	struct alarm_struct *alarm = &p->alarm;
	cli_lock_ptable();
	alarm->alarmed = 0;
	uncli_unlock_ptable();
	resetup_frame(p);
	return 0;
}

void
do_alarm(struct proc *p)
{
	struct alarm_struct *alarm = &p->alarm;
	alarm_handler handler;
	if(alarm->handler == 0 || alarm->count <= 0 || alarm->alarmed == 1)
		return;
	cli_lock_ptable();
	alarm->count--;
	alarm->alarmed = 1;
	uncli_unlock_ptable();
	handler = alarm->handler;
	setup_frame(p->tf, handler);
}
