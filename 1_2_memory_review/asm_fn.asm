global asm_fn
section .text

; If you want to acces the int from the C file, set random_int to 'extern'
; This tell the linker that your princess is in an other castle.
;extern random_int

random_int:
	dd 0x11234

asm_fn:
	; Write you assembly code here
	push ebp
	mov ebp, esp

	mov eax, [random_int]

	pop ebp
	ret
