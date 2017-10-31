global asm_fn
section .text

asm_fn:
	; Write you assembly code here
	push ebp
	mov ebp, esp

  mov eax, [ebp + 0x08]
  add eax, [ebp + 0x0C]
  add eax, [ebp + 0x10]
  add eax, [ebp + 0x14]

	pop ebp
	ret
