global sort_ascending

section .text

sort_ascending:
	push ebp
	mov ebp, esp
	push ebx ; I need more registers
	push esi ; And this one
	push edi ; And, like, one more

	xor ecx, ecx ; ECX is my counter i

	jmp condition ; Jump to the evaluation of the loop conditional
while:
	dec eax ; eax is array_len - 1
	cmp ecx, eax
	jne swap ; If we have not reached end of array, go to swap
	dec DWORD [ebp + 0x0C] ; Decrement len of array
	xor ecx, ecx ; Reset counter
	jmp condition
swap:
	mov eax, [ebp + 0x8] ; Retrieve the pointer to array
	mov ebx, ecx ; Take the counter and copy it to ebx
	shl ebx, 2 ; Multiply counter by for since we index interers
	add eax, ebx ; Add offset to the base of the array
	mov edx, [eax] ; Copy of the value at [base + offset]
	mov esi, [eax + 0x4] ; Copy the value at [base + offset + 4]
	cmp edx, esi ; Compare the two values
	jle increment ; If the lvalue is smaller than the rvalue, no swap
	mov [eax], esi ; Swap the content offset with the saved value
	mov [eax + 0x4], edx ; Sway the content of offset+4 with the other
increment:
	inc ecx ; Increment counter
condition:
	mov eax, [ebp + 0x0C] ; Take len of array
	cmp ecx, eax ; Compare counter  with len of array
	jl while ; If counter is smaller than len, go back up

	; Otherwise we're done
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret


