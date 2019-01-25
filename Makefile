hw04:driver.c asm_io.o benedict_lo_hw04.o
	gcc -o hw04 -m32 driver.c asm_io.o benedict_lo_hw04.o

asm_io.o:asm_io.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm

benedict_lo_hw04.o:benedict_lo_hw04.asm
	nasm -f elf32 -d ELF_TYPE benedict_lo_hw04.asm
