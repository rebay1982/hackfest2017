global call_get_secret

; Tell the assembler printf and get_secret are external to this file
extern printf
extern get_secret
extern secret

section .data
fmt:
	db `%s\n`, 0x0 ; Format string %s to pass to printf

section .text
call_get_secret:
	; Instructions:
	;  - Call the get_secret function in main.c
	;  - If you give it the right keys you will obtain the secret
	;  - Call printf in libc to print said secret on the terminal
	;  - The last parameter should be the pointer to secret
	push ebp
	mov ebp, esp

	push secret
	push 0x0800
	push 0x0400
	push 0x00FF
	call get_secret
	add esp, 0x10

	push secret
	push fmt
	call printf
	add esp, 0x08

	pop ebp
	ret
