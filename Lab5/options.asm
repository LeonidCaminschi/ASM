section .data
    text db "Please choose one of the following:",10
    choice0 db "0) Print Hello World!",10
    choice1 db "1) Compare 2 numbers",10
    choice2 db "2) Input your age",10
    choice3 db "3) Print Hello World!",10
    choice4 db "4) Print Hello World!",10
    choice5 db "5) Print Hello World!",10
    choice6 db "6) Print Hello World!",10
    choice7 db "7) Print Hello World!",10
    choice8 db "8) Print Hello World!",10
    choice9 db "9) Print Hello World!",10

    zero db "0"
    one db "1"
    two db  "2"

    ; proc 1
    helloworld db "Hello World!",10
    ; proc 2
    equalto db "The numbers are equal",10
    notequalto db "The numbers are not equal",10
    ; proc 3
    question db "What is your age? "
    output db "You are this "
    output1 db " years old",10

section .bss
    ; choice
    choice resb 1
    ; proc 2
    age resb 3

section .text
    global _start

_start:
    call _printOptions
    jmp _contstart

_contstart:
    call _getChoice

    mov esi, choice
    mov rdi, zero
    mov ecx, 1
    repe cmpsb
    je _helloWorld

    mov esi, choice
    mov rdi, one
    mov ecx, 1
    repe cmpsb
    je _comparenumbers

    mov esi, choice
    mov rdi, two
    mov ecx, 1
    repe cmpsb
    je _age

    jmp _contstart
    ; jmp _exit

_printOptions:
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 36
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, choice0
    mov rdx, 22
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, choice1
    mov rdx, 21
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, choice2
    mov rdx, 18
    syscall
    ret

_getChoice:
    mov rax, 0
    mov rdi, 0
    mov rsi, choice
    mov rdx, 2
    syscall
    ret

; proc 0
_helloWorld:
    mov rax, 1
    mov rdi, 1
    mov rsi, helloworld 
    mov rdx, 13
    syscall
    jmp _start

; prod 1
_comparenumbers:
    mov ecx, 69
    cmp ecx, 69
    je _printeq
    jne _printneq

_printeq:
    mov rax, 1
    mov rdi, 1
    mov rsi, equalto 
    mov rdx, 22
    syscall
    jmp _start

_printneq:
    mov rax, 1
    mov rdi, 1
    mov rsi, notequalto 
    mov rdx, 26
    syscall
    jmp _start
    
; prod 2
_age:
    call _printQuestion
    call _getAge
    call _printFirstPart
    call _printAge
    call _printSecondPart
    jmp _start

_printQuestion:
    mov rax, 1
    mov rdi, 1
    mov rsi, question
    mov rdx, 18
    syscall
    ret

_getAge:
    mov rax, 0
    mov rdi, 0
    mov rsi, age
    mov rdx, 2
    syscall
    ret
    
_printFirstPart:
    mov rax, 1
    mov rdi, 1
    mov rsi, output
    mov rdx, 13     
    syscall
    ret

_printAge:
    mov rax, 1
    mov rdi, 1
    mov rsi, age
    mov rdx, 2    
    syscall
    ret

_printSecondPart:
    mov rax, 1
    mov rdi, 1
    mov rsi, output1
    mov rdx, 11    
    syscall
    ret

; exit
_exit:
    mov rax, 60
    mov rdi, 0
    syscall