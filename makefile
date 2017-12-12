GPPPARAMS = -m32 #need  some flags to tell compiler this file run empty env not a complete support system likes linux, see vedio 
ASPARAMS = --32
LDPARAMS = -melf _i386
objects = loader.o kernel.o

%.o %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<
  
%.o %.s
	as $(ASPARAMS) -o $@ $<
  
mykernel.bin linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)
  
insall: mykernel.bin
  	sudo cp $< /boot/mykernel.bin