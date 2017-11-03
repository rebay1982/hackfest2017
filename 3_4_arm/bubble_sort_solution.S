.globl sort_ascending

.section .text

sort_ascending:
	stmfd sp!, {r4, r11, lr}

	// args are r0 r1 
	// use r2, r3, r12
	eor r2, r2 // r2 is my counter	
	
	b condition
while:
	sub r12, r1, #1
	cmp r2, r12
	bne swap
	sub r1, r1, #1
	eor r2, r2
	b condition
swap:
	mov r4, r2
	mov r3, #4
	mul r3, r4, r3
	add r12, r0, r3
	ldr r3, [r12] // r3 contains tmp
	ldr r4, [r12, #0x4]
	cmp r3, r4
	ble increment
	str r4, [r12]
	str r3, [r12, #0x4]
increment:	
	add r2, r2, #1
condition:
	cmp r2, r1
	blo while
	
	
	ldmfd sp!, {r4, r11, pc}
