%include "unistd_32.asm"

global asm_syscall
;global asm_fork
;global asm_write
;global asm_exit

section .text
asm_syscall:
		push ebp
		mov ebp, esp

		mov eax, [ebp + 0x08]
		mov ebx, [ebp + 0x0C]
		mov ecx, [ebp + 0x10]
		mov edx, [ebp + 0x14]
		mov esi, [ebp + 0x18]
		mov edi, [ebp + 0x1C]
		mov ebp, [ebp + 0x20]

		int 0x80

		pop ebp
		ret
