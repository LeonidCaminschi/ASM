section .data
    equalto db "The numbers are equal",10
    notequalto db "The numbers are not equal",10
    ;explained in 1st example

section .text
    global _start
    ;explained in 1st example

_start:
    mov ecx, 69
    cmp ecx, 69
    je _printeq
    jne _printneq
    ; ecx = 69 | set variable for comparisons
    ; cmp ecx = 69 with 69 which will give equal
    ; use je to check if they are equal if so jump to the given section
    ; use jne to check if they are not equal if so jump to the given section

_printeq:
    mov rax, 1
    mov rdi, 1
    mov rsi, equalto 
    mov rdx, 22
    syscall
    jmp _exit
    ;standart output of the text to notify that the numbers equal
    ;jmp used to jump to a different section from within the current one

_printneq:
    mov rax, 1
    mov rdi, 1
    mov rsi, notequalto 
    mov rdx, 26
    syscall
    jmp _exit
    ;standart output of the text to notify that the numbers not equal
    ;jmp used to jump to a different section from within the current one

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
    ;standart exit with error code 0