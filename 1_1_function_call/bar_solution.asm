global bar	
section .text

bar:
	push   ebp
	mov    ebp, esp
	mov    eax, 0xffffffff
	pop    ebp
	ret   

