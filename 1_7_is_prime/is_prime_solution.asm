;global is_prime	
extern printf

section .data
perf_c:
	db "%d", 0xa, 0x0

section .text

is_prime:
	push ebp
	mov ebp, esp
	sub esp, 0x4

	mov ecx, [ebp + 0x8]
	push ecx
	rdtsc
	mov [ebp - 0x4], eax
	call marc_is_prime
	add esp, 0x4
	mov ecx, eax
	rdtsc
	sub eax, [ebp - 0x4]
	push eax
	lea eax, [perf_c]
	push eax
	call printf
	add esp, 0x8

	mov ecx, [ebp + 0x8]
	push ecx
	rdtsc
	mov [ebp - 0x4], eax
	call phil_is_prime
	add esp, 0x4
	mov ecx, eax
	rdtsc
	sub eax, [ebp - 0x4]
	push eax
	lea eax, [perf_c]
	push eax
	call printf
	add esp, 0x8
	
	mov eax, ecx
	add esp, 0x4
	pop ebp
	ret

marc_is_prime: 
	push ebp
	mov ebp, esp

	; if num < 2
	mov ebx, [ebp + 0x8] ; num is ebp + 0x8
	cmp ebx, 2
	jl return_0

	; if num % 2
	and ebx, 0x1
	jnz start
 	; if num > 2	
	mov ebx, [ebp + 0x8] 
	cmp ebx, 2
	jg return_0

start:
	;edx & eax reserved for div
	mov ebx, [ebp + 0x8] ; num / 2
	shr ebx, 1
	mov esi, [ebp + 0x8] ; num 
	
	mov ecx, 0x3 ; i
	jmp condition
while:
	xor edx, edx ; zero
	mov eax, esi ; quotient
	div ecx ; diviseur
	test edx, edx
	jz return_0
	add ecx, 0x2
condition:
	cmp ecx, ebx
	jl while

return_1:
	mov eax, 0x1
	jmp return
return_0:
	xor eax, eax
return:
	pop ebp
	retn


phil_is_prime:
	push ebp
	mov ebp, esp
	push edi
	push esi
	

	mov edi, [ebp + 0x8]
	cmp edi, 2
	jl itIsNotPrime
	je itIsPrime

	mov esi, 0x02   ;divisors iterators

primeLoop:
	xor edx, edx
	mov eax, edi
	div esi
	test edx, edx
	jz itIsNotPrime
	inc esi
	cmp esi, edi
	jl primeLoop
  itIsPrime:
	mov eax, 0x01
	jmp endIsPrime
  itIsNotPrime:
	xor eax, eax
  endIsPrime:
	pop esi
	pop edi
	pop ebp
	ret

