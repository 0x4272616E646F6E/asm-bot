BITS 64
GLOBAL _start
extern alloc
extern cloudflare
extern dealloc
extern discord
extern exit
extern print
entern read
extern read_memory
extern reverse
extern strlen
extern write

SECTION .data
envPrefixes    db "CLOUDFLARE_ACCOUNT_ID=", 0, "CLOUDFLARE_API_TOKEN=", 0, "DISCORD_TOKEN=", 0, "MODEL=", 0, 0
notFoundMsg    db "Environment variable not found!", 0xA, 0
lenNotFound    equ $ - notFoundMsg

SECTION .bss

SECTION .text
_start:
    ; 1. Read argc from [rsp].
    mov rax, [rsp]          ; rax = argc

    ; 2. Skip argc + 1 pointers (the program name).
    lea rbx, [rsp + 8 + rax*8]

    ; 3. Skip the null pointer after argv.
    add rbx, 8

.nextEnv:
    ; Load an environment-pointer.
    mov rcx, [rbx]
    test rcx, rcx
    jz .noMatch                ; If it's NULL, we reached end of env

    ; Compare it with envPrefixes.
    lea rdi, [envPrefixes]

.nextPrefix:
    mov al, [rdi]
    test al, al
    jz .skipEnv                ; If it's NULL, we reached end of prefixes

.cmpLoop:
    mov al, [rdi]
    cmp al, 0
    je .foundMatch            ; If we've reached end of prefix, we found a match
    mov dl, [rcx]
    cmp dl, 0
    je .nextPrefix
    cmp al, dl
    jne .nextPrefix
    inc rcx
    inc rdi
    jmp .cmpLoop

.foundMatch:
    ; rcx now points to the value after the prefix.
    push rcx                  ; Save pointer

    ; Find length of the variable's value
    mov rsi, rcx
.findEnd:
    cmp byte [rsi], 0
    je .writeVal
    inc rsi
    jmp .findEnd

.writeVal:
    sub rsi, rcx
    mov rdx, rsi             ; rdx = length
    pop rsi                  ; restore pointer
    mov rax, 1               ; syscall: write
    mov rdi, 1               ; file descriptor: stdout
    syscall
    jmp .exit

.skipEnv:
    add rbx, 8               ; Move to next environment pointer
    jmp .nextEnv

.noMatch:
    ; Environment variable not found.
    mov rax, 1
    mov rdi, 1
    mov rsi, notFoundMsg
    mov rdx, lenNotFound
    syscall
    jmp .exit

.exit:
    ; Exit with code 0
    mov rax, 60
    xor rdi, rdi
    syscall