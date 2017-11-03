extern printf
extern strlen

section .data
    a0:
        dq 0x55


    b1:
	;"How about we play a b1?", 0x0a, 0x00
        db 30, 57, 33, 118, 55, 52, 57, 35, 34, 118, 33, 51, 118, 38, 58, 55, 47, 118, 55, 118, 49, 55, 59, 51, 105, 92, 0x00
    b2:
	;"You can only go to next step with the good key..."
        db 15, 57, 35, 118, 53, 55, 56, 118, 57, 56, 58, 47, 118, 49, 57, 118, 34, 57, 118, 56, 51, 46, 34, 118, 37, 34, 51, 38, 118, 33, 63, 34, 62, 118, 34, 62, 51, 118, 49, 57, 57, 50, 118, 61, 51, 47, 120, 120, 120, 92, 0x00
    b3:
	;"Please enter the good key"
        db 6, 58, 51, 55, 37, 51, 118, 51, 56, 34, 51, 36, 118, 34, 62, 51, 118, 49, 57, 57, 50, 118, 61, 51, 47, 92, 0x00
    b4:
	;"Nha nha nha! Wrong key!"
        db 24, 62, 55, 118, 56, 62, 55, 118, 56, 62, 55, 119, 118, 1, 36, 57, 56, 49, 118, 61, 51, 47, 119, 92, 0x00
    b5:
	;"Good job, you got the good key!"
        db 17, 57, 57, 50, 118, 60, 57, 52, 122, 118, 47, 57, 35, 118, 49, 57, 34, 118, 34, 62, 51, 118, 49, 57, 57, 50, 118, 61, 51, 47, 119, 92, 0x00


	
    b6:
        ;Total length = 48 encoded with 0x55 key
        dd 0x3ade9daa, 0x659ae09d, 0x6da2e09d, 0x75aae09d
        dd 0x554ed89d, 0x65855fd3, 0x9d15549d, 0x45401e54
        dd 0x555518b2, 0x55555555, 0x55555555

    b7:
        dq  0

    b8:
        mov rax, 0x0
        ret

    b9:
        mov rdi, 0x0
        mov rsi, b7
        mov rdx, 0x04
        ret

    b10:
        syscall
        ret

    b11:
        jmp overMess
        mess:
        db "How fun is ROP?", 0x0a, 0x00
        overMess:
        mov rax, 0x01
        mov rdi, 0x01
        mov rsi, mess
        mov rdx, 17
        syscall
        mov dword eax, [b7]  
        ret

    b12:
    	; dq  b11, b10, b9, b8 
        push qword [rdi]      ;return
        push qword [rdi + 8]  ;syscall
        push qword [rdi + 16] ;mov params
        push qword [rdi + 24] ;set syscall number
        ret
    

section .text
global main

c1:
    ; c1(pointerToCode, length, key, action)
    push rbp
    mov rbp, rsp

loop_c1:
    cmp rsi, 0
    jle done_c1
    cmp rcx, 0
    jz encode_c1
    sub byte [rdi], dl
    jmp endIteration
encode_c1:
    add byte [rdi], dl
endIteration:
    inc rdi
    dec rsi
    jmp loop_c1

done_c1:
    pop rbp
    ret

main:
    push rsp
    mov rbp, rsp
    
    mov rdi, b6
    mov rsi, 44
    mov rdx, [a0]
    mov rcx, 0x01
    call c1
   
    inc qword [a0] 
    
    mov rdi, b1
    call strlen

    push qword [a0]
    push rax
    push b1
    call b6
    add rsp, 0x18 ; Stack cleaning since this is non std call
   
    mov rdi, b2
    call strlen

    push qword [a0]
    push rax
    push b2
    call b6
    add rsp, 0x18 ; Stack cleaning since this is non std call
   
    mov rdi, b3
    call strlen

    push qword [a0]
    push rax
    push b3
    call b6
    add rsp, 0x18 ; Stack cleaning since this is non std call
    
    mov rdi, b4
    call strlen

    push qword [a0]
    push rax
    push b4
    call b6
    add rsp, 0x18 ; Stack cleaning since this is non std call
    
    mov rdi, b5
    call strlen

    push qword [a0]
    push rax
    push b5
    call b6
    add rsp, 0x18 ; Stack cleaning since this is non std call
    
    mov rdi, b1
    call printf

    mov rdi, b2
    call printf

    mov rdi, b3
    call printf
    jmp tob12
    datab12:
    dq  b11, b10, b9, b8 
    tob12:
    mov rdi, datab12
    call b12

    rdtsc
    and rax, 0x1
    mov ecx, [b7]
    add eax, ecx

    cmp rax, 0x41424443
    jnz fail
    mov rdi, b5
    call printf
    jmp done_main
fail:
    mov rdi, b4
    call printf
done_main:

    pop rbp
    ret

