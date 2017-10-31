global bar
section .text

bar:
    ; Please insert your code here
    ; This should return -1 (0xFFFFFFFF)
    push ebp
    mov ebp, esp
    mov eax, 0xFFFFFFFF
    pop ebp
    ret
