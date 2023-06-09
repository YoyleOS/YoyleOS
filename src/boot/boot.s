[org 0x7c00]
bits 16
mov ah, 00h
mov al, 13h
int 0x10
; NOTE: text will take a very long time to load so be patient users.
mov ah, 0Ch
mov al, 8
mov bh, 1
.loop:
	inc cx
	cmp cx, 70
	je .nl
	jmp .write_pixel
.nl:
	inc dx
	cmp dx, 30
	je .end
	jmp .setnl
.setnl:
	mov cx, 0
	jmp .write_pixel
.write_pixel:
	int 0x10
	jmp .loop
.end:
	; end of loop
	mov cx, 0
	mov dx, 0
; this is very tedious but idc lolll
mov ah, 0Eh
mov al, 'M'
mov bl, 7
int 0x10
mov al, 'a'
int 0x10
mov al, 'i'
int 0x10
mov al, 'n'
int 0x10
mov al, '.'
int 0x10
; at least this isn't, i suppose.
.loop2:
	inc cx
	cmp cx, 36 ; each row is up to 36 characters in length.
	je .end2
	jmp .space
.space:
	mov al, ' '
	int 0x10
	jmp .loop2
.end2:
	; end of window title loop (for main window)
	mov cx, 0
.key_input:
	mov ah, 00h
	int 0x16
	cmp al, 't'
	je .terminal
	jmp .error
.error:
	mov ah, 0Eh
	mov al, '?' ; cant bother to make a function for printing strings so imma just do this
	mov bl, 4
	int 0x10
	jmp .key_input
; all of the stuff for the terminal. took me some time.
.terminal:
	mov cx, 0
	mov ah, 0Eh
	mov al, '$'
	mov bl, 2
	int 0x10
	mov al, ' '
	int 0x10
	jmp .terminal_input
.terminal_input:
	mov ah, 00h
	int 0x16
	mov ah, 0Eh
	mov bl, 14
	int 0x10
	push ax
	jmp .term_newline
.term_error:
	mov ah, 0Eh
	mov al, '!'
	mov bl, 4
	int 0x10
	jmp .term_error_newline
.term_newline:
	mov al, ' '
	inc cx
	cmp cx, 38
	je .read_command
	jmp .write_pix2
.write_pix2:
	int 0x10
	jmp .term_newline
.read_command:
	mov cx, 0
	pop ax
	cmp al, 't'
	je .test_command
	jmp .term_error
.term_error_newline:
	mov ah, 0Eh
	mov al, ' '
	inc cx
	cmp cx, 40
	je .terminal
	jmp .write_pix3
.write_pix3:
	int 0x10
	jmp .term_error_newline
.test_command:
	mov ah, 0Eh
	mov al, 'H'
	mov bl, 1
	int 0x10
	mov al, 'i'
	int 0x10
	mov al, '!'
	int 0x10
	mov cx, 0
	jmp .test_term_newline
.test_term_newline:
	mov ah, 0Eh
	mov al, ' '
	inc cx
	cmp cx, 38
	je .terminal
	jmp .write_pix4
.write_pix4:
	int 0x10
	jmp .test_term_newline
jmp $
times 510-($-$$) db 0
dw 0AA55h
