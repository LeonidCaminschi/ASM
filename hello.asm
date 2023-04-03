section .data
    text db "Hello, World!",10
    ;section data for the initialization of so called hard coded "variables" to be used in the program
    ;can also define standart numbers not only strings

section .text
    global _start
    ;section for defining starting point of the execution

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, text 
    mov rdx, 14
    syscall 
    ;sys_write(1,1,text,14)
    ; rax = 1 | or the function that is going to be used in our case sys_write
    ; rdi = 1 | file descriptor 0(standart input) 1(standart output) 2(standart Error)
    ; text = "Hello, World!" | the string to be outputed for the sys_write function
    ; rdx = 14 | string length to be outputed to the screen

    mov rax, 60
    mov rdi, 0
    syscall
    ;sys_exit(0)
    ;rax = 60 | function sys_exit
    ;rdi = 0 | which is the error code outputed if 0 then its ok otherwise problem