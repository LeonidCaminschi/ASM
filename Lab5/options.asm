section .data
    text db "Please choose one of the following:",10
    choice1 db "1) (42) Determining the smallest number between two numbers",10
    choice2 db "2) (30) Dividing two numbers",10
    choice3 db "3) (1)  Concatenating two strings",10
    choice4 db "4) (13) Generating a random string",10
    choice5 db "5) (27) Adding two numbers",10
    choice0 db "0) Exit",10

    one db "1"
    two db  "2"
    three db "3"
    four db "4"
    five db "5"
    zero db "0"
    fizz db "Fizz"
    buzz db "Buzz"
    buffer times 10 db 0

    ; proc 1
    greater db "Second number is smaller",10
    lower db "First number is smaller",10
    equalto db "The numbers are equal",10
    ; proc 2

    ; proc 3

    ; proc 4
    msg db 'Random string is: ',0
    newline db 10,0
    ; proc 5

section .bss
    ; choice
    choice resb 1
    rand_num resb 2

section .text
    global _start

_start:
    call _printOptions
    call _getChoice

    mov esi, choice
    mov rdi, one
    mov ecx, 1
    repe cmpsb
    je _smallest

    mov esi, choice
    mov rdi, two
    mov ecx, 1
    repe cmpsb
    je _division

    mov esi, choice
    mov rdi, three
    mov ecx, 1
    repe cmpsb
    je _concat

    mov esi, choice
    mov rdi, four
    mov ecx, 1
    repe cmpsb
    je _randomstring

    mov esi, choice
    mov rdi, five
    mov ecx, 1
    repe cmpsb
    je _adding

    mov esi, choice
    mov rdi, zero
    mov ecx, 1
    repe cmpsb
    je _exit

_printOptions:
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 36
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, choice1
    mov rdx, 60
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, choice2
    mov rdx, 29
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, choice3
    mov rdx, 34
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, choice4
    mov rdx, 35
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, choice5
    mov rdx, 27
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, choice0
    mov rdx, 8
    syscall
    ret

_getChoice:
    mov rax, 0
    mov rdi, 0
    mov rsi, choice
    mov rdx, 2
    syscall
    ret

; proc 1
_smallest:
    mov ecx, 69
    cmp ecx, 68
    je _printeq
    jg _printgreater
    jl _printlower
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
    jmp _start
    ;standart output of the text to notify that the numbers equal
    ;jmp used to jump to a different section from within the current one

_printgreater:
    mov rax, 1
    mov rdi, 1
    mov rsi, greater 
    mov rdx, 25
    syscall
    jmp _start
    ;standart output of the text to notify that the numbers equal
    ;jmp used to jump to a different section from within the current one

_printlower:
    mov rax, 1
    mov rdi, 1
    mov rsi, lower 
    mov rdx, 24
    syscall
    jmp _start
    ;standart output of the text to notify that the numbers not equal
    ;jmp used to jump to a different section from within the current one

; prod 2
_division:
    mov edx, 0
    mov eax, 250
    mov ecx, 25
    div ecx
    ; eax qotient
    ; edx remainder
    jmp _start

; prod 3
_concat:
    mov eax, [fizz]
    mov [buffer], eax
    mov eax, [buzz]
    mov [buffer+4], eax

    mov rax, 1
    mov rdi, 1
    mov rsi, buffer 
    mov rdx, 8
    syscall
    jmp _start
; prod 4
_randomstring:
    xor eax, eax
    rdtsc
    mov ecx, eax

    mov eax, ecx
    mul ecx
    add eax, ecx
    xor edx, edx
    mov ebx, 100
    div ebx
    inc eax

    shl al, 2
    shr al, 2
    add al, '0'
    mov [rand_num], al

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 19
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
; prod 5
_adding:
    mov eax, 45
  	mov ebx, 55
  	add eax,ebx
    jmp _start

; exit
_exit:
    mov rax, 60
    mov rdi, 0
    syscall