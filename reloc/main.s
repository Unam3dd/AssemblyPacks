BITS 32

section .data
    msg db "hello"
    size_len equ $-msg

section .text
global main

main:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov eax, 0x4
    or ebx, 0x1
    mov ecx, msg
    mov edx, size_len
    int 0x80
    jmp _exit

_exit:
    xor eax, eax
    or eax, 0x1
    xor ebx, ebx
    int 0x80