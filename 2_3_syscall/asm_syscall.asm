%include "unistd_32.asm"

global asm_syscall
;global asm_fork
;global asm_write
;global asm_exit

section .text
asm_syscall:
    ; Please write your code here
		push ebp
		mov ebp, esp

		mov eax, [ebp + 0x08]

		cmp eax, __NR_fork
		je asm_fork

		cmp eax, __NR_write
		je asm_write

		cmp eax, __NR_exit
		je asm_exit

asm_execute_syscall:
		int 0x80

		pop ebp
		ret

asm_fork:
		jmp asm_execute_syscall

asm_write:
		mov ebx, [ebp + 0x0C]
		mov ecx, [ebp + 0x10]
		mov edx, [ebp + 0x14]
		jmp asm_execute_syscall

asm_exit:
		mov ebx, [ebp + 0x0C]
		jmp asm_execute_syscall
