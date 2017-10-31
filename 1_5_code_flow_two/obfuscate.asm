global obfuscate

section .rodata
XOR_KEY:
	db 0b10101010

section .text
obfuscate:
    ; Please add your code here
		push ebp
		mov ebp, esp

		mov eax, [XOR_KEY]
		mov ecx, 0x00						; offset for *msg
		mov edx, [ebp + 0x08]		; *msg

for_loop:
		cmp ecx, [ebp + 0x0C]		; msg_len
		jge loop_end

 		xor [edx + ecx], al

 		inc ecx
 		jmp for_loop
loop_end:

		pop ebp
		ret
