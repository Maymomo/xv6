#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"


int sys_may(void)
{
	for(int i = 0; i < 10000000; i++);
	  //cprintf("%esp: %x\n", myproc()->tf);
	return 0;
}

int
sys_fork(void)
{
  //cprintf("%d\n", cpuid());
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  if(n <= 0)
	  return -1;
  //cprintf("n is %x\n", n);
  addr = myproc()->sz;
  //cprintf("old addr :%x\n", addr);
  n = PGROUNDUP(n);
  if(n + myproc()->vsz >= KERNBASE)
	  return -1;
  myproc()->vsz += n;
  /*
  if(growproc(n) < 0) {
	  cprintf("n is : %lu sbrk error!\n", n);
    return -1;
  }
  */
  //cprintf("new addr :%x\n", myproc()->sz);
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int
lazyload(struct trapframe *tf, uint faultaddr)
{
  struct proc *current = myproc();
  uint va = PGROUNDDOWN(faultaddr);
  uint vsz = current->vsz;
  //cprintf("lazyloading %p\n", faultaddr);
  if(current == 0) {
   cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
		  tf->trapno, cpuid(), tf->eip, rcr2());
   panic("trap");
  }

  if(faultaddr <= current->pgstart || faultaddr >= vsz)
	  return -1;
  va = va + PGSIZE > vsz ? vsz : va + PGSIZE;
  if(growproc(va - current->sz) < 0) {
	myproc()->killed = 1;
	return -1;
  }
  current->sz = va;
// In user space, assume process misbehaved.
  //cprintf("pid %d %s: trap %d err %d on cpu %d "
//		"eip 0x%x addr 0x%x--kill proc\n",
 // myproc()->pid, myproc()->name, tf->trapno,
//		tf->err, cpuid(), tf->eip, rcr2());
	return 0;
}
