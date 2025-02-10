BITS 64              ; specify 64-bit mode
GLOBAL _start        ; make _start visible outside this file

SECTION .data
    msg db "Hello from NASM!", 0Ah, 0

SECTION .bss

SECTION .text
_start:
    ; print the message
    mov rax, 1        ; system call for write
    mov rdi, 1        ; file descriptor (stdout)
    mov rsi, msg      ; address of the string
    mov rdx, 17       ; length of the string
    syscall

    ; exit the program
    mov rax, 60       ; system call for exit
    xor rdi, rdi      ; exit code 0
    syscall