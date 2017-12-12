#//the STACK POINTER is'nt set to anything at
# the startup off so when bootloader is done
#we have to do loader.s.


.set MAGIC, 0xbadb002 #have bootloader treat this file as kernel
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section ,mutiboot
	.long MAGIC
  	.long FLAGS
    .long CHECKSUM

.section .text
.extern kernelMain
.gobal loader

loader:
  	mov $kernel_stack, %esp
    push %eax #push mutiboot structure for bootloader to kernel just for reference
    push %ebx #push mutiboot structure for bootloader to kernel just for reference
    call kernelMain #suppose not come back again

_stop: #another infinit loop, just incase came back
	cli
    hlt
    jmp _stop
    
.section  .bas
.space 2*1024*1024; #2 Mib for kernel stack 
kernel_stack: