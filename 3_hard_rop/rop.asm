section .data
    welcome:
    db "Hello world! Welcome to the ROP assembly programming challenge", 0x0a, 0x00
    goal:
    db `You goal is to setup a ROP chain that will print "ROP is no luck!" to the command line followed by another line saying "ROP is only work"`, 0x0a, 0x00
    luck:
    db "Good luck!", 0x0a, 0x00

    file:
    db "rop.bin", 0x00

    mode:
    db "rb", 0x00

section .text
global main
extern fopen
extern fclose
extern fread
extern printf

main:
    push ebp
    mov ebp, esp
    
    sub esp, 0x10

    push welcome
    call printf
    push goal
    call printf
    push luck
    call printf
    add esp, 0x0c
    


    push mode
    push file
    call fopen
    add esp, 0x08
    test eax, eax
    jz done
    mov dword [ebp - 4], eax    ;Keep a copy of the file

    sub esp, 0x100
    mov ecx, esp
    push eax
    push 0x100
    push 0x1
    push ecx
    call fread
    add esp, 0x10
    ret

    mov eax, [ebp - 4]
    push eax
    call fclose
    add esp, 0x04
done:
    add esp, 0x10
    pop ebp
    ret


printOut:
    push ebp
    mov ebp, esp
    push esi
    push ebx
    mov eax, 0x04 ; write syscall
    mov ebx, [esp]
    mov ecx, [esp + 4]
    mov edx, [esp + 8]
    int 0x80

    pop ebx
    pop esi
    pop ebp
    ret
