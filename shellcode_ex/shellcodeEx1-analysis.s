section .text
global main

main:
    jmp main

shellcode:
   db 0x6a, 0x0b, 0x58, 0x99, 0x52, 0x66, 0x68
   db 0x2d, 0x63, 0x89, 0xe7, 0x68, 0x2f, 0x73
   db 0x68, 0x00, 0x68, 0x2f, 0x62, 0x69, 0x6e
   db 0x89, 0xe3, 0x52, 0xe8, 0x09, 0x00, 0x00
   db 0x00, 0x65, 0x63, 0x68, 0x6f, 0x20, 0x6d
   db 0x30, 0x30, 0x00, 0x57, 0x53, 0x89, 0xe1
   db 0xcd, 0x80
