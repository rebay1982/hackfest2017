%include "unistd_32.asm"

%define O_RDONLY	0x0000
%define O_WRONLY	0x0001
%define O_RDWR		0x0002
%define O_CREAT		0x0040

%define STDIN_FILENO	0
%define STDOUT_FILENO	1
%define STDERR_FILENO	2

;global cat	

section .data
struct_stat:		;struct stat64 {
st_dev:		dq 0x0  ;	unsigned long long	st_dev;
__pad0:		dd 0x0  ;	unsigned char	__pad0[4];
                        ;
__st_ino:	dd 0x0  ;	unsigned long	__st_ino;
                        ;
st_mode:	dd 0x0  ;	unsigned int	st_mode;
st_nlink:	dd 0x0  ;	unsigned int	st_nlink;
                        ;
st_uid:		dd 0x0  ;	unsigned long	st_uid;
st_gid:		dd 0x0  ;	unsigned long	st_gid;
                        ;
st_rdev:	dq 0x0  ;	unsigned long long	st_rdev;
__pad3: 	dd 0x0  ;	unsigned char	__pad3[4];
                        ;
st_size: 	dq 0x0  ;	long long	st_size;
st_blksize: 	dd 0x0  ;	unsigned long	st_blksize;
                        ;
                        ;	/* Number 512-byte blocks allocated. */
st_blocks: 	dq 0x0  ;	unsigned long long	st_blocks;
                        ;
st_atime: 	dd 0x0  ;	unsigned long	st_atime;
st_atime_nsec: 	dd 0x0  ;	unsigned long	st_atime_nsec;
                        ;
st_mtime:	dd 0x0  ;	unsigned long	st_mtime;
st_mtime_nsec: 	dd 0x0  ;	unsigned int	st_mtime_nsec;
                        ;
st_ctime: 	dd 0x0  ;	unsigned long	st_ctime;
st_ctime_nsec: 	dd 0x0  ;	unsigned long	st_ctime_nsec;
                        ;
st_ino: 	dq 0x0  ;	unsigned long long	st_ino;
                        ;};

section .text
cat:
    ; Please write your code here
