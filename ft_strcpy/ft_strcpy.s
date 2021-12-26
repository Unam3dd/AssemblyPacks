BITS 32

section .bss
    buffer resb 10h

section .data
    msg db "hello", 0h

section .text

global _start

_start:
    mov esi, msg
    mov edi, buffer
    push edi
    jmp _comp

_comp:
    cmp byte [esi], 0
    je _exit
    movsb
    jmp _comp

_exit:
    xor eax, eax
    or eax, 1
    xor ebx, ebx
    int 0x80