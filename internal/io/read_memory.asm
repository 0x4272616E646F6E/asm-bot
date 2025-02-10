BITS 64
GLOBAL read_memory

SECTION .text
; readMemory(srcPtr, destPtr, length)
;   rdi = source pointer (memory location to read from)
;   rsi = destination pointer (buffer to store data)
;   rdx = length (number of bytes to read)
; Returns the number of bytes read in rax.
read_memory:
    mov rcx, rdx      ; length
    rep movsb         ; copy bytes from [rdi] to [rsi]
    mov rax, rdx      ; return the number of bytes read
    ret