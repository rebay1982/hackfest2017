	.text
	.intel_syntax noprefix
	.file	"main.c"
	.globl	foo
	.type	foo,@function
foo:                                    # @foo
# BB#0:
	mov	eax, 15
	ret
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo

	.globl	main
	.type	main,@function
main:                                   # @main
# BB#0:
	sub	esp, 12
	sub	esp, 8
	push	15
	push	.L.str
	call	printf
	add	esp, 16
	call	bar
	sub	esp, 8
	push	eax
	push	.L.str
	call	printf
	add	esp, 16
	xor	eax, eax
	add	esp, 12
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Return is 0x%X\n"
	.size	.L.str, 16

	.weak	bar

	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
