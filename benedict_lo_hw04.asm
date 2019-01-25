;nasm -f elf32 -d ELF_TYPE asm_io.asm
;nasm -f elf32 -d ELF_TYPE benedict_lo_hw04.asm
;gcc -o hw04 -m32 driver.c asm_io.o benedict_lo_hw04.asm
;
; Name: Benedict Lo
; Date: 09/28/18
;
;
;

%include "asm_io.inc"

segment .data

prompt		db	"Enter a digit: ", 0
even    dd  "Sum of the even positions: ", 0
odd		dd	"Sum of odd-numbered positions: ", 0
multiply    dd  "Odd positions multiply 3: ", 0
sum         dd "Check digit is: ", 0
modu    dd "Mod 10 of result: ", 0
welcome     db "Welcome to Homework 4", 0


segment .bss
input	resd 1
input2	resd 1

segment .text
	global asm_main
asm_main:
	enter 0,0
	pusha

    mov eax, welcome
    call print_string
    call print_nl
	mov	eax, prompt ; prompt the user
	call 	print_string ; print the string
	call	read_int
	mov	[input], eax ; position 1

	mov 	eax, prompt
	call	print_string
	call	read_int
	mov	[input2], eax ; position 2


	mov 	eax, prompt
	call	print_string
	call	read_int
	add	[input], eax ; position 3


	mov 	eax, prompt
	call	print_string
	call	read_int
	add	[input2], eax ; position 4


	mov 	eax, prompt
	call	print_string
	call	read_int
	add	[input], eax ; position 5


	mov 	eax, prompt
	call	print_string
	call	read_int
	add	[input2], eax ; position 6

	mov 	eax, prompt
	call	print_string
	call	read_int
	add	[input], eax ; position 7

	mov 	eax, prompt
	call	print_string
	call	read_int
	add	[input2], eax ; position 8


	mov 	eax, prompt
	call	print_string
	call	read_int
	add	[input], eax ; position 9


	mov 	eax, prompt
	call	print_string
	call	read_int
	add	[input2], eax ; position 10


	mov 	eax, prompt
	call	print_string
	call	read_int
	add	[input], eax ; position 11


	mov	eax, odd
	call	print_string
	mov	eax, [input]
	call	print_int
	call	print_nl


	mov	eax, even
	call	print_string
	mov	eax, [input2]
	call	print_int
	call	print_nl


    mov eax, [input]
    imul eax, 3
    add eax, [input2]
    mov [input], eax


	mov	eax, multiply
	call	print_string
	mov	eax, [input]
	call	print_int
	call	print_nl

    mov ecx, 10
    cdq
    idiv ecx
    mov [input], edx

	mov	eax, modu
	call	print_string
	mov	eax, [input]
	call	print_int
	call	print_nl

    ;if zero then 0
    ;else
    ;10-M
    mov eax, [input]
    cmp eax, 0 ; compare eax with 0
    jz else ;
    mov ecx, 10
    sub ecx, [input] ;else part of if
    mov eax, ecx
    jmp next
    else:
    mov eax, 0
    next:

    mov [input], eax
	mov	eax, sum
	call	print_string
	mov	eax, [input]
	call	print_int
	call	print_nl

	popa
	mov	eax, 0
	leave
	ret
