global sse_add
global sse_mul
global sse_sqrt
global sse_pythagore
global sse_bonus

section .rodata
a:
	dq 4.5
b:
	dq 5.5
c:
	dq 0.0

section .text
sse_add:
	push rbp
	mov rbp, rsp

	addsd  xmm0, xmm1
	
	pop rbp
	retn

sse_mul:
	push rbp
	mov rbp, rsp

	mulsd  xmm0, xmm1
	
	pop rbp
	retn

sse_sqrt:
	push rbp
	mov rbp, rsp

	sqrtsd  xmm0, xmm0
	
	pop rbp
	retn


sse_pythagore:
	push rbp
	mov rbp, rsp

	mulsd xmm0, xmm0		
	mulsd xmm1, xmm1

	addsd xmm0, xmm1

	sqrtsd xmm0, xmm0

	pop rbp
	retn

sse_bonus:
	push rbp
	mov rbp, rsp

	sub rsp, 0x10

	movsd xmm0, [a]
	movsd xmm1, [a]
	call sse_mul
	; Save return value
	movsd [rbp-0x10], xmm0

	movsd xmm0, [b]
	movsd xmm1, [b]
	call sse_mul
	; Return value is in xmm0

	movsd xmm1, [rbp-0x10]
	call sse_add
	; Return value in in xmm0

	call sse_sqrt
	; Return value in in xmm0

	add rsp, 0x10
	pop rbp
	retn
