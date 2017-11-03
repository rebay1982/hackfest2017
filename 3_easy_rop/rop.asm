section .data
    hello:
        db "Hello ROP", 0x0a, 0x00
    easy:
        db "ROP is an easy concept", 0x0a, 0x00

section .text
global main
extern printf
main:
    push ebp
    mov ebp, esp

    ; Create your ROP chain here!
    ; It should be a sequence of 5 push
    ; The result should be :
    ;
    ; Hello ROP
    ; ROP is an easy concept
    ;
    ; and the return code should be 0
    push done
    push easy
    push funPrint
    push hello
    push funPrint
    ret

done:
    pop ebp
    xor eax, eax
    ret

funPrint:
    call printf
    add esp, 0x04
    ret
