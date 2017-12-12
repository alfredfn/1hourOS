void printf(char* str)
{
 	unsigned short * VideoMemory = (unsigned short*) 0xb8000; 
  
  	for (int i=0;str[i]!='\n';++i)
  		VideoMemory[i]=(VedioMemory[i] & 0FF0) | str[i]; 
  //keep hight bytes color setting
}

extern "C" void kernelMain(void * multiboot_structure, unsigned int magicnumber)
// tell g++ not to  change name
//any name is fine
{
  int i=0;
  printf("Hello world, this is ISOUL!!");
  while(1); //keep the nature of a OS kerenl: it should never end...
}