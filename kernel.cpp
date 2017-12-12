void kernelMain(void * multiboot_structure, unsigned int magicnumber) //any name is fine
{
  int i=0;
  printf("Hello world, this is ISOUL!!");
  while(1){
  	printf("OS is counting: %d\n", i++ );
  } //keep the nature of a OS kerenl: it should never end...
}