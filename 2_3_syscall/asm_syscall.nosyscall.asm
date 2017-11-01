%include "unistd_32.asm"

;global asm_syscall
global asm_fork
global asm_write
global asm_exit

section .text
asm_syscall:
    ; Please write your code here

asm_fork:
		push ebp
		mov ebp, esp

		mov eax, __NR_fork

		int 0x80

		pop ebp
		ret

asm_write:
		push ebp
		mov ebp, esp

		mov eax, __NR_write
		mov ebx, [ebp + 0x08]
		mov ecx, [ebp + 0x0C]
		mov edx, [ebp + 0x10]

		int 0x80

		pop ebp
		ret

asm_exit:
		push ebp
		mov ebp, esp

		mov eax, __NR_exit
		mov ebx, [ebp + 0x08]

		int 0x80

		pop ebp
		ret
