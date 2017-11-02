%include "unistd_64.asm"

%define O_RDONLY	0x0000
%define O_WRONLY	0x0001
%define O_RDWR		0x0002
%define O_CREAT		0x0040

%define STDIN_FILENO	0
%define STDOUT_FILENO	1
%define STDERR_FILENO	2

global cat

section .data
struct_stat:		;struct stat64 {
st_dev:		dq 0x0  ;	unsigned long long	st_dev;
st_ino:		dq 0x0  ;	unsigned long	st_ino;

st_mode:	dd 0x0  ;	unsigned int	st_mode;
st_nlink:	dd 0x0  ;	unsigned int	st_nlink;
st_uid:		dd 0x0  ;	unsigned long	st_uid;
st_gid:		dd 0x0  ;	unsigned long	st_gid;
                        ;
st_rdev:	dq 0x0  ;	unsigned long long	st_rdev;
__pad1:		dq 0x0  ;	unsigned long	__pad1
                        ;
st_size: 	dq 0x0  ;	long long	st_size;
st_blksize: 	dd 0x0  ;	unsigned long	st_blksize;
__pad2:		dd 0x0  ;	unsigned long	__pad2
                        ;
                        ;	/* Number 512-byte blocks allocated. */
st_blocks: 	dq 0x0  ;	unsigned long long	st_blocks;
                        ;
st_atime: 	dq 0x0  ;	unsigned long	st_atime;
st_atime_nsec: 	dq 0x0  ;	unsigned long	st_atime_nsec;
                        ;
st_mtime:	dq 0x0  ;	unsigned long	st_mtime;
st_mtime_nsec: 	dq 0x0  ;	unsigned int	st_mtime_nsec;
                        ;
st_ctime: 	dq 0x0  ;	unsigned long	st_ctime;
st_ctime_nsec: 	dq 0x0  ;	unsigned long	st_ctime_nsec;
                        ;
__unused4: 	dd 0x0  ;	unsigned int __unused4;
__unused5: 	dd 0x0  ;	unsigned int __unused5;
                        ;};

section .text
cat:
    ; Please write your code here
    ; rdi already contains the filename.
    push rbp
    mov rbp, rsp

    add rsp, 0x08 ; <-- fd      rbp + 0x08
    add rsp, 0x08 ; <-- *buf    rbp + 0x10

    ; open
    mov rax, __NR_open
    mov rsi, O_RDONLY
    syscall
    test rax, rax
    jl eof

    ; save the file descriptor
    mov [rbp - 0x08], rax

    ; fstat call
    mov rdi, rax  ; set the FD as first param.
    mov rax, __NR_fstat
    mov rsi, struct_stat
    syscall
    test rax, rax
    jl eof

    ; malloc
    ; mov rdi, st_size
    ; call malloc
    ; cmp rax, 0x00
    ; je eof
    add rsp, [st_size]    ; make room on the stack
    ; to pad stuff, AND the st_size value, the rest will be
    ; how much you need to add to the stack pointer.

    ; Save buffer pointer.
    mov [rsp - 0x10], rax

    ; read
    mov rax, __NR_read
    mov rdi, [rbp - 0x08]   ; file descriptor
    mov rsi, [rbp - 0x10]   ;ad *buf
    mov rdx, [st_size]
    syscall
    cmp rax, [st_size]
    jne eof

    ; write
    mov rax, __NR_write
    mov rdi, STDERR_FILENO
    mov rsi, [rbp + 0x10]
    mov rdx, [st_size]
    syscall
    test rax, rax
    jl eof


    ; free

    ; close



eof:
    pop rbp
    ret
