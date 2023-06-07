[org 0x7c00]
bits 16
mov ah, 00h
mov al, 13h
int 0x10
mov ah, 0Ch
mov al, 7
mov bh, 1
.loop:
    inc cx
    cmp cx, 70
    je .nl
    jmp .write_pix
.nl:
    inc dx
    mov cx, 0
    cmp dx, 30
    je .end
    jmp .write_pix
.write_pix:
    int 0x10
    jmp .loop
.end:
mov ah, 0Eh
mov al, '$'
mov bl, 2
int 0x10
mov al, ' '
int 0x10
.input:
    mov ah, 00h
    int 0x16
    mov ah, 0Eh
    mov bl, 14
    int 0x10
    inc bx
    cmp bx, 5
    je .end2
    jmp .input
.end2:
jmp $
times 510-($-$$) db 0
dw 0AA55h
