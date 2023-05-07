section .data
    msg db 'Random number between 1-55: ',0
    newline db 10,0

section .bss
    rand_num resb 2

section .text
    global _start

_start:
    xor eax, eax
    rdtsc
    mov ecx, eax

    mov eax, ecx
    mul ecx
    add eax, ecx
    xor edx, edx
    mov ebx, 55
    div ebx
    inc eax

    shl al, 2
    shr al, 2
    add al, '0'
    mov [rand_num], al

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 28
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, rand_num
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    jmp _start

    mov eax, 60
    xor edi, edi
    syscall
