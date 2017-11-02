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
	push rbp
	mov rbp, rsp

	; Open the file
	mov rax, __NR_open; syscall #
	mov rdi, rdi ; [rbp + 0x08]
	mov rsi, O_RDONLY
	syscall
	test rax, rax 
	jl exit
	push rax ; keep fd somewhere

	; Get file size
	mov rax, __NR_fstat; syscall #
	mov rdi, [rsp]
	mov rsi, struct_stat
	syscall
	test rax, rax 
	jl exit

	; Read the file
	mov rax, __NR_read
	mov rdi, [rsp] ; fd for read
	sub rsp, [st_size] ; Allocate memory to read
	mov rsi, rsp
	mov rdx, [st_size]; Size of buffer to read
	syscall
	test rax, rax
	jl exit

	; Readjusting the stack just in case we didn't read everything
	add rsp, [st_size]
	mov [st_size], rax
	sub rsp, [st_size]

	; Write to stderr
	mov rax, __NR_write ; syscall #
	mov rdi, STDERR_FILENO
	mov rsi, rsp
	mov rdx, [st_size]
	syscall
	test rax, rax
	jl exit

	; Close fd
	add rsp, [st_size]
	mov rax, __NR_close; syscall #
	pop rdi ; removing the fd
	syscall
	test rax, rax
	jl exit

	pop rbp
	ret
exit: 
	neg rax
	mov rdi, rax
	mov rax, __NR_exit; syscall #
	syscall
	
