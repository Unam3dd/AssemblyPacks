all:
	nasm -f elf32 main.s
	ld -m elf_i386 -pie -dynamic-linker /lib/ld-linux.so.2 --entry=main -o main main.o

clean:
	rm main.o main