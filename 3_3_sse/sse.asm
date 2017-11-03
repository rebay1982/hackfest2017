global sse_add
global sse_mul
global sse_sqrt
global sse_pythagore
;global sse_bonus

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
  addsd xmm0, xmm1
  pop rbp
  ret

sse_mul:
  ; Please write your code here
  push rbp
  mov rbp, rsp
  mulsd xmm0, xmm1
  pop rbp
  ret

sse_sqrt:
  ; Please write your code here
  push rbp
  mov rbp, rsp
  sqrtpd xmm0, xmm0
  pop rbp
  ret

sse_pythagore:
  ; Please write your code here
  push rbp
  mov rbp, rsp

  

  pop rbp
  ret
sse_bonus:
  ; Please write your code here
  push rbp
  mov rbp, rsp


  pop rbp
  ret
