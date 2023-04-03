section .data
    question db "What is your age? "
    output db "You are this "
    output1 db " years old",10
    ;explained in 1st example

section .bss
    age resb 2
    ;section for defining so called dynamic "variables"
    ; 1st column is the name of the variable
    ; 2nd column is the reserve bytes
    ; 3rd column is the number of bytes to be reserved for the variable

section .text
    global _start
    ;explained in 1st example

_start:
    call _printQuestion
    call _getAge
    call _printFirstPart
    call _printAge
    call _printSecondPart
    ;call is also called subroutine
    ;difference between call and jmp is that you cant return from a jump
    ;while you can return from a call

    jmp _end_program

_getAge:
    mov rax, 0
    mov rdi, 0
    mov rsi, age
    mov rdx, 2
    syscall
    ret
    ;in this case we have
    ;rax=0 | sys_read()
    ;rdi=0 | file descriptor 0(standart input) 1(standart output) 2(standart Error)
    ;rsi = age = {user input} | address where the data should be inputed
    ;rdx = 2 | max length of the given string

_end_program:
    mov rax, 60
    mov rdi, 0
    syscall
    ;explained before

_printQuestion:
    mov rax, 1
    mov rdi, 1
    mov rsi, question
    mov rdx, 18
    syscall
    ret
    ;standart output of the text to output given text
    ;ret returns the flow to the upper level from where the call was originaly made

_printFirstPart:
    mov rax, 1
    mov rdi, 1
    mov rsi, output
    mov rdx, 13     
    syscall
    ret
    ;standart output of the text to output given text
    ;ret returns the flow to the upper level from where the call was originaly made

_printAge:
    mov rax, 1
    mov rdi, 1
    mov rsi, age
    mov rdx, 2    
    syscall
    ret
    ;standart output of the text to output given text
    ;ret returns the flow to the upper level from where the call was originaly made

_printSecondPart:
    mov rax, 1
    mov rdi, 1
    mov rsi, output1
    mov rdx, 11    
    syscall
    ret
    ;standart output of the text to output given text
    ;ret returns the flow to the upper level from where the call was originaly made