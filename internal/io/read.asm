BITS 64
GLOBAL read

SECTION .text
; readInput(fd, bufferPtr, bufferSize)
;   rdi = file descriptor
;   rsi = buffer pointer
;   rdx = buffer size
; Returns the number of bytes read in rax.
read:
    mov rax, 0       ; syscall number (read)
    syscall
    ret