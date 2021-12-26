BITS 32

section .text

global _start

sum:
    push ebp
    mov ebp, esp
    mov eax, DWORD [ebp + 0x8]
    mov edx, DWORD [ebp + 0xc]
    add eax, edx
    pop ebp
    ret

_start:
    push ebp
    mov ebp, esp
    sub esp, 4h
    mov DWORD [ebp - 4h], sum
    mov eax, DWORD [ebp - 4h]
    push 2h
    push 2h
    call eax
    add esp, 4h
    jmp _exit

_exit:
    xor eax, eax
    or eax, 1h
    xor ebx, ebx
    int 80h