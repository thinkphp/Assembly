nasm -f elf32 media_aritmetica_EAX.asm -o mean.o
ld -m elf_i386 mean.o -o mean
./mean
echo $?

